package com.zero.auth.properties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * JWT相关的常量属性
 *
 * @author herenpeng
 * @since 2020-09-28 20:37
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.auth.jwt")
public class JwtProperties {

    /**
     * Token过期时间，单位为毫秒，默认为1个小时
     */
    private Long ttl;

    /**
     * token的签发者
     */
    private String issuer;

    /**
     * token名称；accessToken
     */
    private String key;

}
