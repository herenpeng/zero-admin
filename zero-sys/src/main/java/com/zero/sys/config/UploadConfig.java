package com.zero.sys.config;

import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.unit.DataSize;

import jakarta.servlet.MultipartConfigElement;

/**
 * 上传文件配置
 *
 * @author herenpeng
 * @since 2021-01-09 19:37
 */
@Configuration
public class UploadConfig {

    @Bean
    public MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        //  单个数据大小 5MB
        factory.setMaxFileSize(DataSize.ofKilobytes(5120));
        /// 总上传数据大小 50MB
        factory.setMaxRequestSize(DataSize.ofKilobytes(512000));
        return factory.createMultipartConfig();
    }
}