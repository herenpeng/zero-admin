package com.zero.sys.security.userdetails;

import com.zero.sys.entity.Role;
import com.zero.sys.entity.User;
import com.zero.sys.security.constant.SecurityConst;
import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/**
 * SpringSecurity用户详情封装对象
 *
 * @author herenpeng
 * @since 2020-10-20 19:49
 */
@ApiModel(value = "SpringSecurity用户详情封装对象")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyUserDetails implements UserDetails {

    private User user;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        for (Role role : user.getRoles()) {
            // 要以ROLE_开头
            authorities.add(new SimpleGrantedAuthority(SecurityConst.ROLE_ + role.getName()));
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
}
