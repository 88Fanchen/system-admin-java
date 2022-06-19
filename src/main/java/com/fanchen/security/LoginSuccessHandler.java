package com.fanchen.security;

import cn.hutool.json.JSONUtil;
import com.fanchen.common.lang.Result;
import com.fanchen.utils.AsyncTaskUtil;
import com.fanchen.utils.JwtUtil;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
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
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Resource
    private JwtUtil jwtUtil;

    @Resource
    private AsyncTaskUtil asyncTaskUtil;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        httpServletResponse.setContentType("application/json;charset=utf-8");
        String jwt = jwtUtil.createToken(authentication.getName());
        httpServletResponse.setHeader(jwtUtil.getHeader(), jwt);
        ServletOutputStream outputStream = httpServletResponse.getOutputStream();
        Result success = Result.succ("登录成功");
        outputStream.write(JSONUtil.toJsonStr(success).getBytes(StandardCharsets.UTF_8));
        outputStream.flush();
        outputStream.close();
        asyncTaskUtil.recordLoginInfo(authentication.getName(), 1, "登陆成功", new Date());
    }
}
