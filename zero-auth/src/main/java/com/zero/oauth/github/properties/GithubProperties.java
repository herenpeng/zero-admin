package com.zero.oauth.github.properties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author herenpeng
 * @since 2021-04-06 22:28
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.auth.oauth.github")
public class GithubProperties {
    /**
     * Github的client_id
     */
    private String clientId;
    /**
     * Github的client_secrets
     */
    private String clientSecrets;
    /**
     * 通过code获取token的请求路径
     */
    private String tokenUrl;
    /**
     *
     */
    private String tokenName;

    private String userInfoUrl;

}
