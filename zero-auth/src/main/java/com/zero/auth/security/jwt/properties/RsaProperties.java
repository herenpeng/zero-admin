package com.zero.auth.security.jwt.properties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * Rsa文件属性
 *
 * @author herenpeng
 * @since 2021-04-05 13:29
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.auth.security.jwt.rsa")
public class RsaProperties {

    /**
     * 加密秘钥信息
     */
    private String secret;
    /**
     * 私钥存放路径
     */
    private String privateFile;
    /**
     * 公钥存放路径
     */
    private String publicFile;

}
