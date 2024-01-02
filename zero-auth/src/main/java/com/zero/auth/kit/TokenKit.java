package com.zero.auth.kit;

import com.zero.auth.entity.Role;
import com.zero.auth.entity.User;
import com.zero.auth.properties.JwtProperties;
import com.zero.common.kit.JsonKit;
import io.jsonwebtoken.Claims;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author herenpeng
 * @since 2021-04-08 22:01
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class TokenKit {

    private final JsonKit jsonKit;

    private final JwtKit jwtKit;

    private final JwtProperties jwtProperties;

    /**
     * 获取token的Id
     *
     * @param token token字符串信息
     * @return token的Id
     */
    public String getId(String token) {
        Claims claims = jwtKit.parseJWT(token);
        return claims.getId();
    }

    /**
     * 获取token的Id
     *
     * @param request HTTP请求
     * @return token的Id
     */
    public String getId(HttpServletRequest request) {
        return getId(getToken(request));
    }


    public String getToken(HttpServletRequest request) {
        return request.getHeader(jwtProperties.getKey());
    }

    /**
     * 通过token解析请求用户信息，并返回User对象
     *
     * @param token token字符串信息
     * @return User对象
     */
    public User getUser(String token) {
        Claims claims = jwtKit.parseJWT(token);
        String subject = claims.getSubject();
        return jsonKit.toObject(subject, User.class);
    }

    /**
     * 通过token解析请求用户信息，并返回User对象
     *
     * @param request HTTP请求
     * @return User对象
     */
    public User getUser(HttpServletRequest request) {
        return getUser(getToken(request));
    }

    /**
     * 通过token解析，获取对应请求的用户的用户名
     *
     * @param token token字符串信息
     * @return 返回请求的用户的用户名信息
     */
    public String getUsername(String token) {
        User user = getUser(token);
        return user.getUsername();
    }

    /**
     * 通过token解析，获取对应请求的用户的用户名
     *
     * @param request HTTP请求
     * @return 返回请求的用户的用户名信息
     */
    public String getUsername(HttpServletRequest request) {
        return getUsername(getToken(request));
    }

    /**
     * 通过解析token，获取对应请求用户的用户主键
     *
     * @param token token字符串信息
     * @return 返回请求的用户的用户主键
     */
    public Integer getUserId(String token) {
        User user = getUser(token);
        return user.getId();
    }

    /**
     * token，获取对应请求用户的用户主键
     *
     * @param request HTTP请求
     * @return 返回请求的用户的用户主键
     */
    public Integer getUserId(HttpServletRequest request) {
        return getUserId(getToken(request));
    }

    /**
     * 通过token解析，获取对应请求的用户的所有角色信息
     *
     * @param token token字符串信息
     * @return 返回请求的用户的所有角色信息
     */
    public List<Role> getRoleList(String token) {
        User user = getUser(token);
        return user.getRoles();
    }

    /**
     * 通过解析token，获取对应请求用户的所有角色信息
     *
     * @param request HTTP请求
     * @return 返回请求的用户的所有角色信息
     */
    public List<Role> getRoleList(HttpServletRequest request) {
        return getRoleList(getToken(request));
    }

}
