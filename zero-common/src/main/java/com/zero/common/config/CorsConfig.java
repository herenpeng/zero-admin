package com.zero.common.config;

import com.zero.common.constant.MethodTypeConst;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

/**
 * 跨域处理器
 *
 * @author herenpeng
 * @since 2020-09-23 20:38
 */
@Configuration
public class CorsConfig {

    @Bean
    public CorsFilter corsFilter() {
        //1.添加CORS配置信息
        CorsConfiguration config = new CorsConfiguration();
        //1) 允许的域,不要写*，否则cookie就无法使用了
        config.addAllowedOrigin("http://127.0.0.1:20000");
        config.addAllowedOrigin("http://192.168.8.128");
        config.addAllowedOrigin("http://zeroadmin.herenpeng.com");
        //2) 是否发送Cookie信息
        config.setAllowCredentials(true);
        //3) 允许的请求方式
        config.addAllowedMethod(MethodTypeConst.OPTIONS);
        config.addAllowedMethod(MethodTypeConst.HEAD);
        config.addAllowedMethod(MethodTypeConst.GET);
        config.addAllowedMethod(MethodTypeConst.PUT);
        config.addAllowedMethod(MethodTypeConst.POST);
        config.addAllowedMethod(MethodTypeConst.DELETE);
        config.addAllowedMethod(MethodTypeConst.PATCH);
        // 4）允许的头信息
        config.addAllowedHeader("*");
        // 5) 有效时长
        config.setMaxAge(3600L);

        //2.添加映射路径，我们拦截一切请求
        UrlBasedCorsConfigurationSource configSource = new UrlBasedCorsConfigurationSource();
        configSource.registerCorsConfiguration("/**", config);

        //3.返回新的CorsFilter.
        return new CorsFilter(configSource);
    }
}
