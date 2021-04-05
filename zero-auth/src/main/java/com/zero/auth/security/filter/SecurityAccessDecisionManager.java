package com.zero.auth.security.filter;

import com.zero.auth.entity.Role;
import com.zero.auth.security.constant.SecurityConst;
import com.zero.auth.security.jwt.util.JwtUtils;
import com.zero.auth.util.RequestUtils;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.FilterInvocation;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.List;

/**
 * 系统鉴权处理器，对于SecurityFilter解析的权限和token中携带的权限进行鉴定，
 *
 * @author herenpeng
 * 2020-9-13 18:50
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class SecurityAccessDecisionManager implements AccessDecisionManager {

    private final RequestUtils requestUtils;

    private final JwtUtils jwtUtils;

    /**
     * 权限认证
     *
     * @param authentication 可以获取到当前登录用户的信息
     * @param o              实际上是一个FilterInvocation对象，用来获取当前请求对象的信息
     * @param collection     即MyFilter类中getAttributes(Object o)方法的返回值
     * @throws AccessDeniedException               权限拒绝异常
     * @throws InsufficientAuthenticationException 权限不足异常
     */
    @SneakyThrows
    @Override
    public void decide(Authentication authentication, Object o, Collection<ConfigAttribute> collection) throws AccessDeniedException, InsufficientAuthenticationException {
        // 这里需要强转称FilterInvocation的原因是因为要获取请求的url。
        FilterInvocation filterInvocation = (FilterInvocation) o;
        HttpServletRequest request = filterInvocation.getHttpRequest();

        for (ConfigAttribute configAttribute : collection) {
            // 访问拒绝
            if (StringUtils.equals(SecurityConst.ACCESS_DENIED, configAttribute.getAttribute())) {
                throw new InsufficientAuthenticationException("您的访问权限不足");
            }
            // 获取请求token
            String token = requestUtils.getToken(request);
            List<Role> roleList = jwtUtils.getRoleList(token);
            // 判断逻辑：当然登录用户角色只要满足资源路径的其中一个角色便可以访问
            for (Role role : roleList) {
                if (role.getName().equals(configAttribute.getAttribute())) {
                    return;
                }
            }
        }
        throw new AccessDeniedException("您的访问权限不足");
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
