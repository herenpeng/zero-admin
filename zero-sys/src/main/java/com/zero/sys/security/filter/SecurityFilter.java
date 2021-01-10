package com.zero.sys.security.filter;

import com.zero.common.exception.MyException;
import com.zero.common.exception.MyExceptionEnum;
import com.zero.sys.entity.Resources;
import com.zero.sys.entity.Role;
import com.zero.sys.mapper.ResourcesMapper;
import com.zero.sys.request.util.RequestUtils;
import com.zero.sys.security.jwt.properties.JwtProperties;
import com.zero.sys.security.jwt.util.JwtUtils;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
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
@Component
public class SecurityFilter implements FilterInvocationSecurityMetadataSource {

    @Autowired
    private RequestUtils requestUtils;

    @Autowired
    private ResourcesMapper resourcesMapper;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private JwtProperties jwtProperties;

    @Autowired
    private JwtUtils jwtUtils;

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
            String[] roleNameList = new String[roles.size()];
            for (int i = 0; i < roles.size(); i++) {
                roleNameList[i] = roles.get(i).getName();
            }
            // 传递的是需要的角色名数组
            return SecurityConfig.createList(roleNameList);
        }
        return SecurityConfig.createList("ACCESS_DENIED");
    }

    /**
     * @param request HttpServletRequest请求对象
     * @return 如果token合法，返回token，否则抛出异常信息
     */
    private String checkToken(HttpServletRequest request) {
        // 获取token
        String token = requestUtils.getToken(request);
        if (StringUtils.isBlank(token)) {
            // 没有token，拒绝访问
            log.error("[系统登录功能]该请求未携带token，token为空");
            throw new MyException(MyExceptionEnum.ILLEGAL_TOKEN);
        }
        // 解析token
        String tokenId = null;
        try {
            tokenId = jwtUtils.getId(token);
        } catch (Exception e) {
            log.error("[系统登录功能]解析token失败");
            throw new MyException(MyExceptionEnum.ILLEGAL_TOKEN);
        }
        String tokenRedisKey = jwtProperties.getKey() + ":" + tokenId;
        Object redisToken = redisTemplate.opsForValue().get(tokenRedisKey);
        if (!StringUtils.equalsIgnoreCase(token, String.valueOf(redisToken))) {
            log.error("[系统登录功能]该token已失效或已过期");
            throw new MyException(MyExceptionEnum.ILLEGAL_TOKEN);
        }
        return token;
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
