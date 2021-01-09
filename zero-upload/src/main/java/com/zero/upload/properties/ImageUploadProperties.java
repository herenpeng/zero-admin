package com.zero.upload.properties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 图片上传相关属性
 *
 * @author herenpeng
 * @since 2021-01-09 22:15
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.upload.image")
public class ImageUploadProperties {

    private String path;

    private List<String> allowTypes;

}
