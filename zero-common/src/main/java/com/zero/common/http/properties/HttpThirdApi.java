package com.zero.common.http.properties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 第三方的API接口
 *
 * @author herenpeng
 * @since 2021-02-16 11:54
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
@ConfigurationProperties(prefix = "zero.common.http.third.api")
public class HttpThirdApi {

    /**
     * 通过ip获取ip的真实地址信息等等
     */
    private String ipInfo;
    /**
     * 中华万年历 天气 API
     */
    private String weatherInfo;

}
