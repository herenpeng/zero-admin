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
        //  单个数据大小 1024KB
        factory.setMaxFileSize(DataSize.ofKilobytes(1024));
        /// 总上传数据大小 10240KB
        factory.setMaxRequestSize(DataSize.ofKilobytes(102400));
        return factory.createMultipartConfig();
    }
}