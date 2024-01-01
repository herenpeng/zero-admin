package com.zero.common.http.util;

import com.zero.common.http.domain.IpInfo;
import com.zero.common.http.domain.WeatherInfo;
import com.zero.common.http.properties.HttpThirdApi;
import com.zero.common.util.JsonUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.client.RestTemplate;

import jakarta.servlet.http.HttpServletRequest;

/**
 * 天气接口
 *
 * @author herenpeng
 * @since 2021-04-27 21:31
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class WeatherUtils {

    private final RestTemplate restTemplate;

    private final HttpThirdApi httpThirdApi;

    private final IpUtils ipUtils;

    private final JsonUtils jsonUtils;

    private final HttpUtils httpUtils;


    /**
     * 天气API响应成功的状态码
     */
    public static final Integer OK_STATUS = 1000;

    public WeatherInfo getWeatherInfo(HttpServletRequest request) {
        IpInfo ipInfo = ipUtils.getIpInfo(request);
        if (ObjectUtils.isEmpty(ipInfo)) {
            log.warn("[获取天气信息]无法获取当前城市信息");
            return null;
        }
        String city = ipInfo.getData().getCity();
        try {
            String url = httpThirdApi.getWeatherInfo() + city;
            ResponseEntity<String> responseEntity = restTemplate.getForEntity(url, String.class);
            HttpStatusCode statusCode = responseEntity.getStatusCode();
            if (ObjectUtils.nullSafeEquals(statusCode, HttpStatus.OK)) {
                WeatherInfo weatherInfo = httpUtils.gzipDecode(responseEntity, WeatherInfo.class);
                if (!ObjectUtils.isEmpty(weatherInfo) && OK_STATUS.equals(weatherInfo.getStatus())) {
                    return weatherInfo;
                }
            }
        } catch (Exception e) {
            log.warn("[获取天气信息]当前城市：{}天气信息获取失败", city);
            e.printStackTrace();
        }
        return null;
    }
}
