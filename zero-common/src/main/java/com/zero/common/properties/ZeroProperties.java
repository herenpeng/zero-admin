package com.zero.common.properties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * zero-admin项目的项目属性
 *
 * @author herenpeng
 * @since 2021-01-10 18:50
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero")
public class ZeroProperties {

    /**
     * zero-admin该项目对应域名名称
     */
    private String domainName;
}
