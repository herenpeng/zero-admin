package com.zero.auth.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelCollection;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.auth.enums.LoginTypeEnum;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 用户账号实体类信息
 *
 * @author herenpeng
 * @since 2020-09-07 08:05
 */
@Schema(name = "用户信息实体类")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@TableName("auth_user")
public class User extends BaseEntity {

    /**
     * 用户名称
     */
    @Schema(name = "用户名称")
    @Excel(name = "用户名称", width = 15, needMerge = true)
    @TableField(value = "username")
    private String username;

    /**
     * 用户密码，如果password为null，则在序列化为json的时候不进行序列化
     */
    @Schema(name = "用户密码")
    @TableField(value = "password")
    private String password;

    /**
     * 账号是否启用，true为启用，false为禁用，默认为true
     */
    @Schema(name = "用户账号是否启用")
    @Excel(name = "账号是否启用", width = 15, needMerge = true, replace = {"启用_true", "禁用_false"})
    @TableField(value = "enabled")
    private Boolean enabled;

    /**
     * 账号是否锁定，true为锁定，false为未锁定，默认为false
     */
    @Schema(name = "用户账号是否锁定")
    @Excel(name = "账号是否锁定", width = 15, needMerge = true, replace = {"锁定_true", "未锁定_false"})
    @TableField(value = "locked")
    private Boolean locked;

    /**
     * 账号是否过期，true为过期，false为未过期，默认为false
     */
    @Schema(name = "用户账号是否过期")
    @Excel(name = "账号是否过期", width = 15, needMerge = true, replace = {"过期_true", "未过期_false"})
    @TableField(value = "account_expire")
    private Boolean accountExpire;

    /**
     * 密码是否过期，true为过期，false为未过期，默认为false
     */
    @Schema(name = "用户密码是否过期")
    @Excel(name = "密码是否过期", width = 15, needMerge = true, replace = {"过期_true", "未过期_false"})
    @TableField(value = "password_expire")
    private Boolean passwordExpire;

    /**
     * 用户类型
     */
    @Schema(name = "用户类型")
    @Excel(name = "用户类型", width = 15, needMerge = true)
    @TableField(value = "type")
    private LoginTypeEnum type;

    /**
     * 用户所包含的角色信息，非数据库字段
     */
    @Schema(name = "用户所拥有的角色信息")
    @ExcelCollection(name = "用户所拥有的角色信息")
    @TableField(exist = false)
    private List<Role> roles;

    /**
     * 用户的详细信息
     */
    @Schema(name = "用户的详细信息")
    @TableField(exist = false)
    private UserInfo userInfo;

    /**
     * 当前登录的用户登入日志记录
     */
    @Schema(name = "当前登录的用户登入日志记录")
    @TableField(exist = false)
    private List<LoginLog> onlineLoginLogs;

    /**
     * 通过角色主键查询用户
     */
    @Schema(name = "通过角色主键查询用户")
    @TableField(exist = false)
    private Integer queryRoleId;

}
