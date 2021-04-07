package com.zero.auth.security.userdetails;

import com.zero.auth.entity.User;
import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;

/**
 * SpringSecurity用户详情封装对象
 *
 * @author herenpeng
 * @since 2020-10-20 19:49
 */
@ApiModel(value = "SpringSecurity用户详情封装对象")
@Data
@EqualsAndHashCode(callSuper = false)
@AllArgsConstructor
public class LoginUserDetails implements UserDetails {

    private User user;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return user.getRoles();
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
