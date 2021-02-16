package com.zero.common.http.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.zero.common.http.domain.IpInfo;
import com.zero.common.http.properties.HttpUrl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.client.RestTemplate;

/**
 * IP工具类
 *
 * @author herenpeng
 * @since 2021-02-16 8:08
 */
@Slf4j
@Component
public class IpUtils {

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private ObjectMapper objectMapper;

    @Autowired
    private HttpUrl httpUrl;

    public IpInfo getIpInfo(String ip) {
        objectMapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
        String url = httpUrl.getIpInfo() + ip;
        try {
            ResponseEntity<String> responseEntity = restTemplate.getForEntity(url, String.class);
            HttpStatus statusCode = responseEntity.getStatusCode();
            if (ObjectUtils.nullSafeEquals(statusCode, HttpStatus.OK)) {
                String body = responseEntity.getBody();
                IpInfo ipInfo = objectMapper.readValue(body, IpInfo.class);
                if (!ObjectUtils.isEmpty(ipInfo) && ipInfo.getCode().equals(0)) {
                    return objectMapper.readValue(body, IpInfo.class);
                }
            }
        } catch (JsonProcessingException e) {
            log.warn("[获取IP信息]ip：{}信息获取失败", ip);
            e.printStackTrace();
        }
        return null;
    }


}
