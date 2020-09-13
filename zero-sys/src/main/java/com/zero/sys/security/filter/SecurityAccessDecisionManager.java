package com.zero.sys.security.filter;

import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

import java.util.Collection;

/**
 * @author 何任鹏
 * 2020/7/25 18:50
 */
@Component
public class SecurityAccessDecisionManager implements AccessDecisionManager {
    /**
     * 权限认证
     *
     * @param authentication 可以获取到当前登录用户的信息
     * @param o              实际上是一个FilterInvocation对象，用来获取当前请求对象的信息
     * @param collection     即MyFilter类中getAttributes(Object o)方法的返回值
     * @throws AccessDeniedException               权限拒绝异常
     * @throws InsufficientAuthenticationException 权限不足异常
     */
    @Override
    public void decide(Authentication authentication, Object o, Collection<ConfigAttribute> collection) throws AccessDeniedException, InsufficientAuthenticationException {
        for (ConfigAttribute configAttribute : collection) {
            if ("ROLE_LOGIN".equals(configAttribute.getAttribute())) {
                if (authentication instanceof AnonymousAuthenticationToken) {
                    throw new AccessDeniedException("账号未登录异常");
                }
                return;
            }
            // 获取当前用户的所有角色
            Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
            // 判断逻辑：当然登录用户角色只要满足资源路径的其中一个角色便可以访问
            for (GrantedAuthority authority : authorities) {
                if (authority.getAuthority().equals(configAttribute.getAttribute())) {
                    return;
                }
            }
        }
        throw new AccessDeniedException("非法请求");
    }

    @Override
    public boolean supports(ConfigAttribute configAttribute) {
        return true;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }
}
