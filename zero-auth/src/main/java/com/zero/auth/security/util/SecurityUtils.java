package com.zero.auth.security.util;

import com.zero.auth.entity.Role;
import com.zero.auth.entity.User;
import com.zero.auth.security.jwt.properties.JwtProperties;
import com.zero.auth.security.jwt.util.JwtUtils;
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
public class SecurityUtils {

    private final JsonKit jsonKit;

    private final JwtUtils jwtUtils;

    private final JwtProperties jwtProperties;

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
        return getId(getToken(request));
    }


    public String getToken(HttpServletRequest request) {
        return request.getHeader(jwtProperties.getKey());
    }

    /**
     * 通过jwt解析请求用户信息，并返回User对象
     *
     * @param jwt JWT字符串信息
     * @return User对象
     */
    public User getUser(String jwt) {
        Claims claims = jwtUtils.parseJWT(jwt);
        String subject = claims.getSubject();
        User user = jsonKit.toObject(subject, User.class);
        return user;
    }

    /**
     * 通过jwt解析请求用户信息，并返回User对象
     *
     * @param request HTTP请求
     * @return User对象
     */
    public User getUser(HttpServletRequest request) {
        return getUser(getToken(request));
    }

    /**
     * 通过jwt解析，获取对应请求的用户的用户名
     *
     * @param jwt JWT字符串信息
     * @return 返回请求的用户的用户名信息
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
     */
    public String getUsername(HttpServletRequest request) {
        return getUsername(getToken(request));
    }

    /**
     * 通过解析jwt，获取对应请求用户的用户主键
     *
     * @param jwt JWT字符串信息
     * @return 返回请求的用户的用户主键
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
     */
    public Integer getUserId(HttpServletRequest request) {
        return getUserId(getToken(request));
    }

    /**
     * 通过jwt解析，获取对应请求的用户的所有角色信息
     *
     * @param jwt JWT字符串信息
     * @return 返回请求的用户的所有角色信息
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
     */
    public List<Role> getRoleList(HttpServletRequest request) {
        return getRoleList(getToken(request));
    }

}
