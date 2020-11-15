package com.zero.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 用户实体类信息
 *
 * @author herenpeng
 * @since 2020-09-07 08:05
 */
@ApiModel(value = "用户信息实体类")
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_user")
public class User extends BaseEntity {

    /**
     * 用户名称
     */
    @ApiModelProperty(value = "用户名称")
    @TableField(value = "username", el = "username")
    private String username;

    /**
     * 用户密码，如果password为null，则在序列化为json的时候不进行序列化
     */
    @ApiModelProperty(value = "用户密码")
    @JsonInclude(JsonInclude.Include.NON_NULL)
    @TableField(value = "password", el = "password")
    private String password;

    /**
     * 账号是否启用，true为启用，false为禁用，默认为true
     */
    @ApiModelProperty(value = "用户账号是否启用")
    @TableField(value = "enabled", el = "enabled")
    private Boolean enabled;

    /**
     * 账号是否锁定，true为锁定，false为未锁定，默认为false
     */
    @ApiModelProperty(value = "用户账号是否锁定")
    @TableField(value = "locked", el = "locked")
    private Boolean locked;

    /**
     * 账号是否过期，true为过期，false为未过期，默认为false
     */
    @ApiModelProperty(value = "用户账号是否过期")
    @TableField(value = "account_expire", el = "accountExpire")
    private Boolean accountExpire;

    /**
     * 密码是否过期，true为过期，false为未过期，默认为false
     */
    @ApiModelProperty(value = "用户密码是否过期")
    @TableField(value = "password_expire", el = "passwordExpire")
    private Boolean passwordExpire;

    /**
     * 用户所包含的角色信息，非数据库字段
     */
    @ApiModelProperty(value = "用户所拥有的角色信息")
    @TableField(exist = false)
    private List<Role> roles;

}
