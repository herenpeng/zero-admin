package com.zero.auth.security.handler;

import com.zero.auth.entity.Resources;
import com.zero.auth.entity.Role;
import com.zero.auth.mapper.ResourcesMapper;
import com.zero.auth.security.jwt.properties.JwtProperties;
import com.zero.auth.security.util.SecurityUtils;
import com.zero.common.constant.StringConst;
import com.zero.common.exception.AppException;
import com.zero.common.exception.AppExceptionEnum;
import com.zero.common.util.RedisUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.List;
import java.util.Objects;

@Slf4j
@AllArgsConstructor
@Component
public class JwtAuthenticationHandler implements HandlerInterceptor {


    private final SecurityUtils securityUtils;
    private final JwtProperties jwtProperties;
    private final RedisUtils redisUtils;
    private final ResourcesMapper resourcesMapper;

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 获取token
        String token = securityUtils.getToken(request);
        if (StringUtils.isBlank(token)) {
            // 没有token，拒绝访问
            log.error("[系统登录功能]该请求{}未携带token，token为空", request.getRequestURI());
            throw new AppException(AppExceptionEnum.ILLEGAL_TOKEN);
        }
        // 解析token
        String tokenId;
        try {
            tokenId = securityUtils.getId(token);
        } catch (Exception e) {
            log.error("[系统登录功能]解析token失败");
            throw new AppException(AppExceptionEnum.ILLEGAL_TOKEN);
        }
        String tokenRedisKey = jwtProperties.getKey() + StringConst.COLON + tokenId;
        Object redisToken = redisUtils.get(tokenRedisKey);
        if (!StringUtils.equals(token, String.valueOf(redisToken))) {
            log.error("[系统登录功能]该token已失效或已过期");
            throw new AppException(AppExceptionEnum.ILLEGAL_TOKEN);
        }
        // 系统鉴权处理器，对于SecurityFilter解析的权限和token中携带的权限进行鉴定
        String requestURI = request.getRequestURI();
        String uri = requestURI.substring(request.getContextPath().length());
        Resources resources = resourcesMapper.getByRegexUriAndMethodType(uri, request.getMethod().toUpperCase());
        if (resources == null) {
            throw new AppException(AppExceptionEnum.INSUFFICIENT_AUTHENTICATION);
        }
        // 该资源权限需要的角色
        List<Role> roles = resources.getRoles();
        // 玩家拥有的权限
        List<Role> roleList = securityUtils.getRoleList(token);

        for (Role role : roles) {
            // 判断逻辑：当然登录用户角色只要满足资源路径的其中一个角色便可以访问
            for (Role hasRole : roleList) {
                if (Objects.equals(role.getId(), hasRole.getId())) {
                    return true;
                }
            }
        }
        throw new AppException(AppExceptionEnum.INSUFFICIENT_AUTHENTICATION);
    }


}
