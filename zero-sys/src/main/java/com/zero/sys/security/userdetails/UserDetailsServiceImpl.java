package com.zero.sys.security.userdetails;

import com.zero.sys.domain.Role;
import com.zero.sys.domain.User;
import com.zero.sys.mapper.UserMapper;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * Spring Security的接口UserDetailsService的实现类，用来处理服务登录相关的业务逻辑
 * @author herenpeng
 * @since 2020-09-13 8:31
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserMapper userMapper;

    @SneakyThrows
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userMapper.loadUserByUsername(username);
        if (ObjectUtils.isEmpty(user)) {
            throw new UsernameNotFoundException("用户" + username + "不存在！");
        }
        UserDetails userDetails = new UserDetails() {
            @Override
            public Collection<? extends GrantedAuthority> getAuthorities() {
                List<SimpleGrantedAuthority> authorities = new ArrayList<>();
                for (Role role : user.getRoles()) {
                    // 要以ROLE_开头
                    authorities.add(new SimpleGrantedAuthority("ROLE_" + role.getName()));
                }
                return authorities;
            }

            @Override
            public String getPassword() {
                return user.getPassword();
            }

            @Override
            public String getUsername() {
                return user.getUsername();
            }

            @Override
            public boolean isAccountNonExpired() {
                return !user.getAccountExpire();
            }

            @Override
            public boolean isAccountNonLocked() {
                return !user.getLocked();
            }

            @Override
            public boolean isCredentialsNonExpired() {
                return !user.getPasswordExpire();
            }

            @Override
            public boolean isEnabled() {
                return user.getEnabled();
            }
        };
        return userDetails;
    }
}
