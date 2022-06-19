package com.fanchen.security;

import cn.hutool.json.JSONUtil;
import com.fanchen.common.lang.Result;
import com.fanchen.utils.AsyncTaskUtil;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Date;

@Component
public class LoginFailHandler implements AuthenticationFailureHandler {

    @Resource
    private AsyncTaskUtil asyncTaskUtil;

    @Override
    public void onAuthenticationFailure(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {
        httpServletResponse.setContentType("application/json;charset=utf-8");
        ServletOutputStream outputStream = httpServletResponse.getOutputStream();
        String message = e.getMessage();
        if (!"验证码错误".equals(message) && !"请刷新验证码".equals(message)){
            message = "用户名或密码错误";
        }
        Result fail = Result.fail(message);
        outputStream.write(JSONUtil.toJsonStr(fail).getBytes(StandardCharsets.UTF_8));
        outputStream.flush();
        outputStream.close();
        if (message.equals("请刷新验证码")){
            return;
        }
        asyncTaskUtil.recordLoginInfo(null, 0, message, new Date());
    }
}
