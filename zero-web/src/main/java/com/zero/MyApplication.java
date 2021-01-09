package com.zero;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import springfox.documentation.oas.annotations.EnableOpenApi;

/**
 * zero-admin项目的入口启动类
 *
 * @author herenpeng
 * @since 2020/8/2 22:04
 */
@EnableOpenApi
@EnableScheduling
@SpringBootApplication
public class MyApplication {
    public static void main(String[] args) {
        SpringApplication.run(MyApplication.class, args);
    }
}
