package com.fanchen.config;

import com.fanchen.security.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.annotation.Resource;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Resource
    private LoginFailHandler loginFailHandler;

    @Resource
    private LoginSuccessHandler loginSuccessHandler;

    @Resource
    private CaptchaFilter captchaFilter;

    @Resource
    private JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;

    @Resource
    private JwtAccessDeniedHandler jwtAccessDeniedHandler;

    @Resource
    private UserDetailServiceImpl userDetailService;

    @Resource
    private JwtLogoutSuccessHandler jwtLogoutSuccessHandler;

    @Bean
    public JwtAuthenticationFilter jwtAuthenticationFilter() throws Exception {
        return new JwtAuthenticationFilter(authenticationManager());
    }

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder(){
        return new BCryptPasswordEncoder();
    }

    private static final String[] URL_WHITELIST = {
            "/login",
            "/register",
            "/captcha",
            "/register/deptList",
            "/favicon.ico",
    };

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.cors().and().csrf().disable()
        //登录配置
        .formLogin()
                .successHandler(loginSuccessHandler)
                .failureHandler(loginFailHandler)
        .and()
                .logout()
                .logoutSuccessHandler(jwtLogoutSuccessHandler)
        //禁用Session
        .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
        //配置拦截器
        //anonymous() 允许匿名用户访问,不允许已登入用户访问
        //permitAll() 不管登入,不登入 都能访问
        .and()
                .authorizeRequests()
                .antMatchers(URL_WHITELIST).anonymous()
                .antMatchers(
                        HttpMethod.GET,
                        "/",
                        "/*.html",
                        "/**/*.html",
                        "/**/*.css",
                        "/**/*.js",
                        "/img/**"
                ).permitAll()
                .antMatchers("/swagger-ui.html").anonymous()
                .antMatchers("/swagger-resources/**").anonymous()
                .antMatchers("/webjars/**").anonymous()
                .antMatchers("/*/api-docs").anonymous()
                .antMatchers("/druid/**").anonymous()
                .anyRequest().authenticated()
                .and()
                .headers().frameOptions().disable()
        //异常处理器
        .and()
                .exceptionHandling()
                .authenticationEntryPoint(jwtAuthenticationEntryPoint)
                .accessDeniedHandler(jwtAccessDeniedHandler)
        //配置自定义过滤器
        .and()
        .addFilter(jwtAuthenticationFilter())
        .addFilterBefore(captchaFilter, UsernamePasswordAuthenticationFilter.class)
        ;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailService);
    }

}
