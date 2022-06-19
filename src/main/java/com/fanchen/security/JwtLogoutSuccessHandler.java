package com.fanchen.security;

import cn.hutool.json.JSONUtil;
import com.fanchen.common.lang.Result;
import com.fanchen.utils.JwtUtil;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

@Component
public class JwtLogoutSuccessHandler implements LogoutSuccessHandler {

    @Resource
    private JwtUtil jwtUtil;

    @Override
    public void onLogoutSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        if (authentication != null){
            new SecurityContextLogoutHandler().logout(httpServletRequest, httpServletResponse, authentication);
        }
        httpServletResponse.setContentType("application/json;charset=utf-8");
        httpServletResponse.setHeader(jwtUtil.getHeader(), "");
        ServletOutputStream outputStream = httpServletResponse.getOutputStream();
        Result success = Result.succ("退出成功");
        outputStream.write(JSONUtil.toJsonStr(success).getBytes(StandardCharsets.UTF_8));
        outputStream.flush();
        outputStream.close();
    }
}
