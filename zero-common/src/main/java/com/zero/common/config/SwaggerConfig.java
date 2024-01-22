package com.zero.common.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.info.License;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.context.annotation.Bean;

import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@SpringBootConfiguration
public class SwaggerConfig {

    @Bean
    public OpenAPI customOpenAPI() {
        // 联系人信息(contact)，构建API的联系人信息，用于描述API开发者的联系信息，包括名称、URL、邮箱等
        // name：文档的发布者名称 url：文档发布者的网站地址，一般为企业网站 email：文档发布者的电子邮箱
        Contact contact = new Contact()
                // 作者名称
                .name("herenpeng")
                // 作者邮箱
                .email("he.ren.peng@qq.com")
                // 介绍作者的URL地址
                .url("https://github.com/herenpeng")
                // 使用Map配置信息（如key为"name","email","url"）
                .extensions(new HashMap<>());

        // 授权许可信息(license)，用于描述API的授权许可信息，包括名称、URL等；假设当前的授权信息为Apache 2.0的开源标准
        License license = new License()
                // 授权名称
                .name("")
                // 授权信息
                .url("")
                // 标识授权许可
//                .identifier("")
                // 使用Map配置信息（如key为"name","url","identifier"）
                .extensions(new HashMap<>());

        //创建Api帮助文档的描述信息、联系人信息(contact)、授权许可信息(license)
        Info info = new Info()
                // 标题信息
                .title("zero-admin通用后台管理系统接口文档")
                .description("该篇接口文档是关于zero-admin通用后台管理系统的接口说明文档，对于该系统中的所有接口进行了详细的描述！")
                // 系统版本
                .version("1.0.0")
                .termsOfService("http://zeroadmin.herenpeng.com")
                // 设置联系人信息
                .contact(contact)
                // 授权许可信息
                .license(license);
        // 返回信息
        return new OpenAPI().info(info);
    }

}
