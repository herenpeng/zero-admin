package com.zero.auth.security.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.zero.auth.entity.Role;
import com.zero.auth.entity.User;
import com.zero.auth.security.jwt.properties.JwtProperties;
import com.zero.auth.security.jwt.util.JwtUtils;
import com.zero.auth.service.LoginLogService;
import com.zero.auth.util.RequestUtils;
import com.zero.common.constant.StringConst;
import com.zero.common.util.JsonUtils;
import com.zero.common.util.RedisUtils;
import io.jsonwebtoken.Claims;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

/**
 * @author herenpeng
 * @since 2021-04-08 22:01
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class SecurityUtils {

    private final JsonUtils jsonUtils;

    private final RedisUtils<String, Object> redisUtils;

    private final JwtProperties jwtProperties;

    private final JwtUtils jwtUtils;

    private final LoginLogService loginLogService;

    private final RequestUtils requestUtils;

    /**
     * 通过用户信息生成 Jwt，并放入 Redis 中，并记录登录日志
     *
     * @param user    用户信息
     * @param request HttpServletRequest对象
     * @return Jwt
     */
    public String generateJwt(User user, HttpServletRequest request) {
        user.setPassword(null);
        String tokenId = UUID.randomUUID().toString();
        String subject = jsonUtils.toJson(user);
        // 创建JWT
        String jwt = jwtUtils.createJWT(tokenId, subject);
        // 将jwt存放入redis中
        String tokenRedisKey = jwtProperties.getKey() + StringConst.COLON + tokenId;
        redisUtils.set(tokenRedisKey, jwt, jwtProperties.getTtl());

        // 记录登录日志
        loginLogService.loginLog(request, user.getId(), tokenId);
        return jwt;
    }


    /**
     * 获取jwt的Id
     *
     * @param jwt JWT字符串信息
     * @return Jwt的Id
     */
    public String getId(String jwt) {
        Claims claims = jwtUtils.parseJWT(jwt);
        return claims.getId();
    }

    /**
     * 获取jwt的Id
     *
     * @param request HTTP请求
     * @return Jwt的Id
     */
    public String getId(HttpServletRequest request) {
        return getId(requestUtils.getToken(request));
    }


    /**
     * 通过jwt解析请求用户信息，并返回User对象
     *
     * @param jwt JWT字符串信息
     * @return User对象
     * @throws JsonProcessingException 抛出Json格式化异常
     */
    public User getUser(String jwt) {
        Claims claims = jwtUtils.parseJWT(jwt);
        String subject = claims.getSubject();
        User user = jsonUtils.toObject(subject, User.class);
        return user;
    }

    /**
     * 通过jwt解析请求用户信息，并返回User对象
     *
     * @param request HTTP请求
     * @return User对象
     * @throws JsonProcessingException 抛出Json格式化异常
     */
    public User getUser(HttpServletRequest request) {
        return getUser(requestUtils.getToken(request));
    }

    /**
     * 通过jwt解析，获取对应请求的用户的用户名
     *
     * @param jwt JWT字符串信息
     * @return 返回请求的用户的用户名信息
     * @throws JsonProcessingException 抛出Json格式化异常
     */
    public String getUsername(String jwt) {
        User user = getUser(jwt);
        return user.getUsername();
    }

    /**
     * 通过jwt解析，获取对应请求的用户的用户名
     *
     * @param request HTTP请求
     * @return 返回请求的用户的用户名信息
     * @throws JsonProcessingException 抛出Json格式化异常
     */
    public String getUsername(HttpServletRequest request) {
        return getUsername(requestUtils.getToken(request));
    }

    /**
     * 通过解析jwt，获取对应请求用户的用户主键
     *
     * @param jwt JWT字符串信息
     * @return 返回请求的用户的用户主键
     * @throws JsonProcessingException 抛出Json格式化异常
     */
    public Integer getUserId(String jwt) {
        User user = getUser(jwt);
        return user.getId();
    }

    /**
     * 通过解析jwt，获取对应请求用户的用户主键
     *
     * @param request HTTP请求
     * @return 返回请求的用户的用户主键
     * @throws JsonProcessingException 抛出Json格式化异常
     */
    public Integer getUserId(HttpServletRequest request) {
        return getUserId(requestUtils.getToken(request));
    }

    /**
     * 通过jwt解析，获取对应请求的用户的所有角色信息
     *
     * @param jwt JWT字符串信息
     * @return 返回请求的用户的所有角色信息
     * @throws JsonProcessingException 抛出Json格式化异常
     */
    public List<Role> getRoleList(String jwt) {
        User user = getUser(jwt);
        return user.getRoles();
    }

    /**
     * 通过解析jwt，获取对应请求用户的所有角色信息
     *
     * @param request HTTP请求
     * @return 返回请求的用户的所有角色信息
     * @throws JsonProcessingException 抛出Json格式化异常
     */
    public List<Role> getRoleList(HttpServletRequest request) {
        return getRoleList(requestUtils.getToken(request));
    }

}
