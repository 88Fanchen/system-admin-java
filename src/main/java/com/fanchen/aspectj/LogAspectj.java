package com.fanchen.aspectj;

import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSON;
import cn.hutool.json.JSONUtil;
import com.fanchen.annotation.Log;
import com.fanchen.entity.SysOperateLog;
import com.fanchen.utils.AsyncTaskUtil;
import com.fanchen.utils.IpUtils;
import com.fanchen.utils.SecurityUtil;
import com.fanchen.utils.ServletUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.Map;

@Aspect
@Component
@Slf4j
public class LogAspectj {

    @Resource
    private AsyncTaskUtil asyncTaskUtil;

    @AfterReturning(pointcut = "@annotation(controllerLog)", returning = "jsonResult")
    public void doAfterReturn(JoinPoint joinPoint, Log controllerLog, Object jsonResult) {
        handleLog(joinPoint, controllerLog, null, jsonResult);
    }

    protected void handleLog(final JoinPoint joinPoint, Log controllerLog, final Exception e, Object jsonResult) {
        try {
            String username = SecurityUtil.getLoginUser();
            HttpServletRequest request = ServletUtil.getRequest();
            // *========数据库日志=========*//
            SysOperateLog operateLog = new SysOperateLog();
            operateLog.setStatus(e != null ? 0 : 1);
            operateLog.setErrorMsg(e != null ? e.getMessage() : null);
            operateLog.setOperIp(IpUtils.getIpAddr(request));
            operateLog.setOperUrl(ServletUtil.getRequest().getRequestURI());
            operateLog.setOperName(StrUtil.isNotBlank(username) ? username : "未知");
            String className = joinPoint.getTarget().getClass().getName();
            String methodName = joinPoint.getSignature().getName();
            operateLog.setMethod(className + "." + methodName + "()");
            operateLog.setRequestMethod(request.getMethod());
            getControllerMethodDescription(joinPoint, controllerLog, operateLog, jsonResult, request);
            asyncTaskUtil.recordOperateInfo(operateLog);
        } catch (Exception exception) {
            log.error("==========切面通知异常=========");
            log.error("异常信息:{}", exception.getMessage());
        }
    }

    public void getControllerMethodDescription(JoinPoint joinPoint, Log controllerLog, SysOperateLog sysOperateLog, Object jsonResult, HttpServletRequest request) throws IOException {
        sysOperateLog.setBusinessType(controllerLog.businessType());
        sysOperateLog.setTitle(controllerLog.title());
        if (controllerLog.isSaveRequestData()){
            setRequestValue(joinPoint, sysOperateLog, request);
        }
        if (controllerLog.isSaveResponseData() && jsonResult != null){
            sysOperateLog.setJsonResult(JSONUtil.toJsonStr(jsonResult));
        }
    }

    private void setRequestValue(JoinPoint joinPoint, SysOperateLog sysOperateLog, HttpServletRequest request) throws IOException {
        String requestMethod = sysOperateLog.getRequestMethod();
        if (HttpMethod.PUT.name().equals(requestMethod) || HttpMethod.POST.name().equals(requestMethod)){
            //使用不了 Stream closed 是因为这个InputStream已经被用过了
            //String body = StreamUtils.copyToString(request.getInputStream(), StandardCharsets.UTF_8);
            sysOperateLog.setOperParam(argsArrayToString(joinPoint.getArgs()));
        }else {
            Map<String, String[]> parameterMap = request.getParameterMap();
            sysOperateLog.setOperParam(StrUtil.toString(parameterMap));
        }
    }

    /**
     * 参数拼装
     */
    private String argsArrayToString(Object[] paramsArray)
    {
        StringBuilder params = new StringBuilder();
        if (paramsArray != null && paramsArray.length > 0)
        {
            for (Object o : paramsArray)
            {
                if (o != null && !isFilterObject(o))
                {
                    try
                    {
                        JSON jsonObj = JSONUtil.parse(o);
                        params.append(jsonObj.toString()).append(" ");
                    }
                    catch (Exception e)
                    {
                        e.printStackTrace();
                    }
                }
            }
        }
        return params.toString().trim();
    }

    /**
     * 判断是否需要过滤的对象。
     *
     * @param o 对象信息。
     * @return 如果是需要过滤的对象，则返回true；否则返回false。
     */
    @SuppressWarnings("rawtypes")
    public boolean isFilterObject(final Object o)
    {
        Class<?> clazz = o.getClass();
        if (clazz.isArray())
        {
            return clazz.getComponentType().isAssignableFrom(MultipartFile.class);
        }
        else if (Collection.class.isAssignableFrom(clazz))
        {
            Collection collection = (Collection) o;
            for (Object value : collection)
            {
                return value instanceof MultipartFile;
            }
        }
        else if (Map.class.isAssignableFrom(clazz))
        {
            Map map = (Map) o;
            for (Object value : map.entrySet())
            {
                Map.Entry entry = (Map.Entry) value;
                return entry.getValue() instanceof MultipartFile;
            }
        }
        return o instanceof MultipartFile || o instanceof HttpServletRequest || o instanceof HttpServletResponse
                || o instanceof BindingResult;
    }

}
