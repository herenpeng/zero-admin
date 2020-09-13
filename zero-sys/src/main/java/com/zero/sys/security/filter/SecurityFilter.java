package com.zero.sys.security.filter;

import com.zero.sys.domain.Authority;
import com.zero.sys.domain.Role;
import com.zero.sys.mapper.AuthorityMapper;
import org.apache.commons.lang3.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.stereotype.Component;
import org.springframework.util.PathMatcher;

import java.util.Collection;
import java.util.List;

/**
 * @author 何任鹏
 * 2020/7/25 18:31
 */
@Component
public class SecurityFilter implements FilterInvocationSecurityMetadataSource {

    @Autowired
    private AuthorityMapper authorityMapper;

    @Autowired
    private PathMatcher pathMatcher;

    @Override
    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
        // 这里需要强转称FilterInvocation的原因是因为要获取请求的url。
        String requestUrl = ((FilterInvocation) object).getRequestUrl();
        Authority authority = authorityMapper.getByPattern(requestUrl);
        if (ObjectUtils.allNotNull(authority) && pathMatcher.match(authority.getPattern(), requestUrl)) {
            List<Role> roles = authority.getRoles();
            String[] roleNameList = new String[roles.size()];
            for (int i = 0; i < roles.size(); i++) {
                roleNameList[i] = roles.get(i).getName();
            }
            // 传递的是需要的角色名数组
            return SecurityConfig.createList(roleNameList);
        }
        return SecurityConfig.createList("ROLE_LOGIN");
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
