package com.fanchen.security;

import cn.hutool.core.util.StrUtil;
import com.fanchen.utils.JwtUtil;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class JwtAuthenticationFilter extends BasicAuthenticationFilter {

    @Resource
    private JwtUtil jwtUtil;

    @Resource
    private UserDetailServiceImpl userDetailService;

    public JwtAuthenticationFilter(AuthenticationManager authenticationManager) {
        super(authenticationManager);
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        String jwt = request.getHeader(jwtUtil.getHeader());
        if (StrUtil.isBlankOrUndefined(jwt)){
            chain.doFilter(request, response);
            return;
        }
        Claims claims = jwtUtil.parserToken(jwt);
        if (claims == null){
            throw new JwtException("token异常");
        }
        if (jwtUtil.isExpire(claims)){
            throw new JwtException("token过期");
        }
        String username = claims.getSubject();
        UsernamePasswordAuthenticationToken token =
                new UsernamePasswordAuthenticationToken(username, null,
                        userDetailService.getUserAuthority(username));
        SecurityContextHolder.getContext().setAuthentication(token);
        chain.doFilter(request, response);
    }
}
