package com.zero.sys.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * 用户实体类信息
 * @author herenpeng
 * @since 2020-09-07 08:05
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_user")
public class User implements UserDetails {
    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 用户名陈
     */
    @TableField(value = "username", el = "username")
    private String username;
    /**
     * 用户密码
     */
    @TableField(value = "password", el = "password")
    private String password;
    /**
     * 账号是否启用，true为启用，false为禁用，默认为true
     * 这个字段使用的是基本数据类型的布尔类型，因为在UserDetails接口中是接口方法isEnabled()
     * 对当前的实体类的getter和setter造成了接口污染，如果使用Boolean类型，在和MyBatisPlus
     * 整合过程中，Mapper.xml的返回结果集映射resultMap会出现报错的情况
     */
    @TableField(value = "enabled", el = "enabled")
    private boolean enabled;
    /**
     * 账号是否锁定，true为锁定，false为未锁定，默认为false
     */
    @TableField(value = "locked", el = "locked")
    private Boolean locked;
    /**
     * 账号是否过期，true为过期，false为未过期，默认为false
     */
    @TableField(value = "account_expire", el = "accountExpire")
    private Boolean accountExpire;
    /**
     * 密码是否过期，true为过期，false为未过期，默认为false
     */
    @TableField(value = "password_expire", el = "passwordExpire")
    private Boolean passwordExpire;
    /**
     * 数据插入时间
     */
    @TableField(value = "create_time", el = "createTime")
    private Date createTime;
    /**
     * 数据更新时间
     */
    @TableField(value = "update_time", el = "updateTime")
    private Date updateTime;

    /**
     * 用户所包含的角色信息，非数据库字段
     */
    @TableField(exist = false)
    private List<Role> roles;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<SimpleGrantedAuthority> authorities = new ArrayList<>();
        for (Role role : roles) {
            // 要以ROLE_开头
            authorities.add(new SimpleGrantedAuthority("ROLE_" + role.getName()));
        }
        return authorities;
    }

    @Override
    public String getUsername() {
        return this.username;
    }

    @Override
    public String getPassword() {
        return this.password;
    }

    /**
     * 判断账号是否没有过期
     *
     * @return 账号是否没有过期
     */
    @Override
    public boolean isAccountNonExpired() {
        return !accountExpire;
    }

    /**
     * 判断账号是否没有锁定
     *
     * @return 账号是否没有锁定
     */
    @Override
    public boolean isAccountNonLocked() {
        return !locked;
    }

    /**
     * 判断密码是否没有过期
     *
     * @return 密码是否没有过期
     */
    @Override
    public boolean isCredentialsNonExpired() {
        return !passwordExpire;
    }

    /**
     * 判断账号是否过期
     *
     * @return 账号是否过期
     */
    @Override
    public boolean isEnabled() {
        return enabled;
    }
}
