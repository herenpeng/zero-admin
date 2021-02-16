package com.zero.common.http.properties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author herenpeng
 * @since 2021-02-16 11:54
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.common.http.url")
public class HttpUrl {

    /**
     * 通过ip获取ip的真实地址信息等等
     */
    private String ipInfo;

}
