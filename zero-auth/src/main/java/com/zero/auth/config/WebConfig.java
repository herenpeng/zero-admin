package com.zero.auth.config;

import com.zero.auth.handler.JwtAuthenticationHandler;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * SpringSecurity配置类
 *
 * @author herenpeng
 * @since 2020-09-13 8:26
 */

@Configuration
@RequiredArgsConstructor
public class WebConfig implements WebMvcConfigurer {

    private final JwtAuthenticationHandler authenticationHandler;


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authenticationHandler)
                .addPathPatterns("/**")
                .excludePathPatterns(
                        "/login",
                        "/logout",
                        "/websocket/**",
                        "/swagger-ui/**",
                        "/v3/**",
                        // 静态资源文件
                        "/image/**",
                        "/oauth/github/**",
                        "/error"
                );
    }

}
