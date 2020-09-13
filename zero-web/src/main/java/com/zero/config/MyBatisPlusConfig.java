package com.zero.config;

import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * MyBatisPlus的Java配置类
 * @author herenpeng
 * @since 2020-09-07 19:27
 */
@Configuration
@MapperScan("com.zero.sys.mapper")
public class MyBatisPlusConfig {

    /**
     * MyBatisPlus分页插件
     *
     * @return
     */
    @Bean
    public PaginationInterceptor paginationInterceptor() {
        return new PaginationInterceptor();
    }

}
