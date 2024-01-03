package com.zero.auth.handler;

import com.zero.auth.entity.Resources;
import com.zero.auth.entity.Role;
import com.zero.auth.mapper.ResourcesMapper;
import com.zero.auth.properties.JwtProperties;
import com.zero.auth.kit.TokenKit;
import com.zero.common.constant.AppConst;
import com.zero.common.exception.AppException;
import com.zero.common.exception.AppExceptionEnum;
import com.zero.common.kit.RedisKit;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.List;
import java.util.Objects;

@Slf4j
@RequiredArgsConstructor
@Component
public class JwtAuthenticationHandler implements HandlerInterceptor {


    private final TokenKit tokenKit;
    private final JwtProperties jwtProperties;
    private final RedisKit redisKit;
    private final ResourcesMapper resourcesMapper;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        String uri = requestURI.substring(request.getContextPath().length());
        // 获取token
        String token = tokenKit.getToken(request);
        if (StringUtils.isBlank(token)) {
            // 没有token，拒绝访问
            log.error("[系统登录功能]该请求{}未携带token，token为空", uri);
            throw new AppException(AppExceptionEnum.ILLEGAL_TOKEN);
        }
        // 解析token
        String tokenId;
        try {
            tokenId = tokenKit.getId(token);
        } catch (Exception e) {
            log.error("[系统登录功能]解析token失败");
            throw new AppException(AppExceptionEnum.ILLEGAL_TOKEN);
        }
        String tokenRedisKey = jwtProperties.getKey() + AppConst.COLON + tokenId;
        Object redisToken = redisKit.get(tokenRedisKey);
        if (!StringUtils.equals(token, String.valueOf(redisToken))) {
            log.error("[系统登录功能]该token已失效或已过期");
            throw new AppException(AppExceptionEnum.ILLEGAL_TOKEN);
        }
        // 系统鉴权处理器
        log.debug("[登录权限鉴定器]请求路径：{}", uri);
        Resources resources = resourcesMapper.getByRegexUriAndMethodType(uri, request.getMethod().toUpperCase());
        if (resources == null) {
            throw new AppException(AppExceptionEnum.INSUFFICIENT_AUTHENTICATION);
        }
        // 该资源权限需要的角色
        List<Role> roles = resources.getRoles();
        // 玩家拥有的权限
        List<Role> roleList = tokenKit.getRoleList(token);

        for (Role role : roles) {
            // 判断逻辑：当然登录用户角色只要满足资源路径的其中一个角色便可以访问
            for (Role hasRole : roleList) {
                if (Objects.equals(role.getId(), hasRole.getId())) {
                    return true;
                }
            }
        }
        log.warn("[登录权限鉴定器]请求{}权限错误", uri);
        throw new AppException(AppExceptionEnum.INSUFFICIENT_AUTHENTICATION);
    }


}
