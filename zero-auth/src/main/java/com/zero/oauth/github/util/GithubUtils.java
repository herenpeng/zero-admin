package com.zero.oauth.github.util;

import com.zero.common.kit.JsonKit;
import com.zero.oauth.github.entity.GithubUser;
import com.zero.oauth.github.properties.GithubProperties;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.util.MultiValueMap;
import org.springframework.util.ObjectUtils;
import org.springframework.web.client.RestTemplate;

/**
 * Github的工具类，封装了一些请求操作
 *
 * @author herenpeng
 * @since 2021-04-06 22:27
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class GithubUtils {

    private final RestTemplate restTemplate;

    private final GithubProperties githubProperties;

    private final JsonKit jsonKit;

    /**
     * 通过Github回调的参数获取Github AccessToken
     *
     * @param code 回调请求携带的Code
     * @return AccessToken
     */
    public String getGithubToken(String code) {
        try {
            ResponseEntity<String> responseEntity = restTemplate.getForEntity(githubProperties.getTokenUrl(), String.class,
                    githubProperties.getClientId(), githubProperties.getClientSecrets(), code);
            HttpStatusCode statusCode = responseEntity.getStatusCode();
            if (ObjectUtils.nullSafeEquals(statusCode, HttpStatus.OK)) {
                log.info("[GithubUtils工具类]使用CODE={}获取Github Token响应成功", code);
                String body = responseEntity.getBody();
                if (StringUtils.isNotBlank(body)) {
                    return resolveToken(body);
                }
            }
        } catch (Exception e) {
            log.error("[GithubUtils工具类]使用CODE={}获取Github Token失败", code);
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 通过Github响应体中的数据，解析出Github Token信息
     * Github响应体：access_token=ghoddwgd5LJdfNHYdsUgs3o4sRwC1Jdzhd8d&scope=&token_type=bearer
     *
     * @param body 响应体中的字符串
     * @return Github Token
     */
    private String resolveToken(String body) {
        // 以&来解析字符串
        String[] result = body.split("&");
        for (String str : result) {
            if (str.startsWith(githubProperties.getTokenName())) {
                // 以=来解析字符串
                String[] split = str.split("=");
                if (split.length == 2) {
                    return split[1];
                }
            }
        }
        return null;
    }


    /**
     * 通过 accessToken 获取 Github 用户信息
     *
     * @param accessToken accessToken
     * @return Github 用户信息
     */
    public GithubUser getGithubUser(String accessToken) {
        try {
            HttpHeaders headers = new HttpHeaders();
            headers.add(HttpHeaders.AUTHORIZATION, "token " + accessToken);
            HttpEntity<MultiValueMap<String, Object>> httpEntity = new HttpEntity<>(headers);
            ResponseEntity<String> responseEntity = restTemplate.exchange(githubProperties.getUserInfoUrl(),
                    HttpMethod.GET, httpEntity, String.class);
            HttpStatusCode statusCode = responseEntity.getStatusCode();
            if (ObjectUtils.nullSafeEquals(statusCode, HttpStatus.OK)) {
                String body = responseEntity.getBody();
                return jsonKit.toObject(body, GithubUser.class);
            }
        } catch (Exception e) {
            log.error("[GithubUtils工具类]使用accessToken={}获取Github用户信息失败", accessToken);
            e.printStackTrace();
        }
        return null;
    }

}
