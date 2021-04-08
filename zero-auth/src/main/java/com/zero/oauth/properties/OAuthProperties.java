package com.zero.oauth.properties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author herenpeng
 * @since 2021-04-08 20:48
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.auth.oauth")
public class OAuthProperties {

    /**
     * 通信目标源域名的key
     */
    private String targetOriginKey;

    /**
     * 通信页面路径
     */
    private String messagePage;

}
