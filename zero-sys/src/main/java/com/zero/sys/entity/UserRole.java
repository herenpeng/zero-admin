package com.zero.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 用户-角色关联表
 * @author herenpeng
 * @since 2020-09-07 08:05
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_user_role")
public class UserRole extends BaseEntity {
    /**
     * 用户主键，sys_user表的主键id
     */
    @TableField(value = "user_id", el = "userId")
    private Integer userId;

    /**
     * 角色主键，sys_role表的主键id
     */
    @TableField(value = "role_id", el = "roleId")
    private Integer roleId;
}
