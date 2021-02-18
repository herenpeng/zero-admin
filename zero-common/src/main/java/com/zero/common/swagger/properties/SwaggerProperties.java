package com.zero.common.swagger.properties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author herenpeng
 * @since 2021-02-18 21:06
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.common.swagger")
public class SwaggerProperties {

    /**
     * 是否启用Swagger文档
     */
    private Boolean enable;

}
