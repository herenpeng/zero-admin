package com.zero.auth.security.filter;

import com.zero.auth.entity.Resources;
import com.zero.auth.entity.Role;
import com.zero.auth.mapper.ResourcesMapper;
import com.zero.auth.security.constant.SecurityConst;
import com.zero.auth.security.jwt.properties.JwtProperties;
import com.zero.auth.security.util.SecurityUtils;
import com.zero.auth.util.RequestUtils;
import com.zero.common.constant.StringConst;
import com.zero.common.exception.MyException;
import com.zero.common.exception.MyExceptionEnum;
import com.zero.common.util.RedisUtils;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.List;

/**
 * 系统访问授权过滤器
 * 主要功能是解析请求中携带的token，解析请求所需要的权限或者拒绝访问
 *
 * @author herenpeng
 * 2020-9-13 18:31
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class SecurityFilter implements FilterInvocationSecurityMetadataSource {

    private final RequestUtils requestUtils;

    private final ResourcesMapper resourcesMapper;

    private final RedisUtils<String, Object> redisUtils;

    private final JwtProperties jwtProperties;

    private final SecurityUtils securityUtils;

    @SneakyThrows
    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        // 这里需要强转称FilterInvocation的原因是因为要获取请求的url。
        FilterInvocation filterInvocation = (FilterInvocation) object;
        HttpServletRequest request = filterInvocation.getRequest();
        // 校验token是否合法
        checkToken(request);
        // 授权
        String requestURI = request.getRequestURI();
        String uri = requestURI.substring(request.getContextPath().length());
        Resources resources = resourcesMapper.getByRegexUriAndMethodType(uri, request.getMethod().toUpperCase());
        if (ObjectUtils.allNotNull(resources)) {
            List<Role> roles = resources.getRoles();
            String[] authorityList = new String[roles.size()];
            for (int i = 0; i < roles.size(); i++) {
                authorityList[i] = roles.get(i).getAuthority();
            }
            // 传递的是需要的角色权限名数组
            return SecurityConfig.createList(authorityList);
        }
        return SecurityConfig.createList(SecurityConst.ACCESS_DENIED);
    }

    /**
     * 校验Token
     *
     * @param request HttpServletRequest请求对象
     */
    private void checkToken(HttpServletRequest request) {
        // 获取token
        String token = requestUtils.getToken(request);
        if (StringUtils.isBlank(token)) {
            // 没有token，拒绝访问
            log.error("[系统登录功能]该请求{}未携带token，token为空", request.getRequestURI());
            throw new MyException(MyExceptionEnum.ILLEGAL_TOKEN);
        }
        // 解析token
        String tokenId;
        try {
            tokenId = securityUtils.getId(token);
        } catch (Exception e) {
            log.error("[系统登录功能]解析token失败");
            throw new MyException(MyExceptionEnum.ILLEGAL_TOKEN);
        }
        String tokenRedisKey = jwtProperties.getKey() + StringConst.COLON + tokenId;
        Object redisToken = redisUtils.get(tokenRedisKey);
        if (!StringUtils.equals(token, String.valueOf(redisToken))) {
            log.error("[系统登录功能]该token已失效或已过期");
            throw new MyException(MyExceptionEnum.ILLEGAL_TOKEN);
        }
    }


    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return true;
    }


}
