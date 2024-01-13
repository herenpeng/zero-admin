package com.zero.auth.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 用户-角色关联表
 *
 * @author herenpeng
 * @since 2020-09-07 08:05
 */
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@TableName("auth_user_role")
public class UserRole extends BaseEntity {

    /**
     * 用户主键，auth_user表的主键id
     */
    @Schema(name = "用户主键")
    @TableField(value = "user_id")
    private Integer userId;

    /**
     * 角色主键，auth_role表的主键id
     */
    @Schema(name = "角色主键")
    @TableField(value = "role_id")
    private Integer roleId;

}
