package com.zero.upload.properties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 文件上传相关属性
 *
 * @author herenpeng
 * @since 2021-01-09 22:15
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.upload")
public class UploadProperties {

    /**
     * 静态文件上传路径
     */
    private String path;

    /**
     * 需要上传的图片文件的属性
     */
    private FileUpload image;

}
