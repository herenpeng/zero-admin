package com.zero.common.swagger.config;

import com.zero.common.swagger.properties.SwaggerProperties;
import io.swagger.annotations.ApiOperation;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.oas.annotations.EnableOpenApi;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

/**
 * Swagger2配置Java类
 *
 * @author herenpeng
 * @since 2020-09-27 20:12
 */
@Slf4j
@RequiredArgsConstructor
@EnableOpenApi
@Configuration
public class SwaggerConfig {

    private final SwaggerProperties swaggerProperties;

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.OAS_30)
                .enable(swaggerProperties.getEnable())
                .pathMapping("/")
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.withMethodAnnotation(ApiOperation.class))
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                // 标题信息
                .title("zero-admin通用后台管理系统接口文档")
                // 描述信息
                .description("该篇接口文档是关于zero-admin通用后台管理系统的接口说明文档，对于该系统中的所有接口进行了详细的描述！")
                // 系统版本
                .version("1.0.0")
                .contact(new Contact("herenpeng", "https://blog.csdn.net/qq_45193304", "he.ren.peng@qq.com"))
                .license("前往系统")
                .licenseUrl("http://zeroadmin.herenpeng.com")
                .build();
    }

}

