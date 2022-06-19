package com.fanchen.security;

import com.fanchen.common.exception.CaptchaException;
import com.fanchen.common.lang.Const;
import com.fanchen.utils.RedisUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.annotation.Resource;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Component
public class CaptchaFilter extends OncePerRequestFilter {

    @Resource
    private RedisUtil redisUtil;

    @Resource
    private LoginFailHandler loginFailHandler;

    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {
        String url = httpServletRequest.getRequestURI();
        if (("/login".equals(url) && httpServletRequest.getMethod().equals("POST")) || ("/register".equals(url) && httpServletRequest.getMethod().equals("POST"))){
            try {
                validate(httpServletRequest);
            }catch (CaptchaException captchaException){
                loginFailHandler.onAuthenticationFailure(httpServletRequest, httpServletResponse, captchaException);
                return;
            }
        }
        doFilter(httpServletRequest, httpServletResponse, filterChain);
    }

    private void validate(HttpServletRequest request) {
        String code = request.getParameter("code").toLowerCase();
        String key = request.getParameter("key");
        if (StringUtils.isBlank(code) || StringUtils.isBlank(key)) {
            throw new CaptchaException("验证码错误");
        }
        Object hget = redisUtil.hget(Const.CAPTCHA_KEY, key);
        if (hget == null || hget.equals("")){
            throw new CaptchaException("请刷新验证码");
        }
        if (!code.equals(hget.toString())) {
            throw new CaptchaException("验证码错误");
        }
        redisUtil.hdel(Const.CAPTCHA_KEY, key);
    }
}
