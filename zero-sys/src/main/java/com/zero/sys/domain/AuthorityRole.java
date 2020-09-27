package com.zero.sys.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

/**
 * 权限-角色关联表
 * @author herenpeng
 * @since 2020-09-07 19:13
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_authority_role")
public class AuthorityRole implements Serializable {
    /**
     * 权限主键，sys_authority表的主键id
     */
    @TableField(value = "authority_id", el = "authorityId")
    private Integer authorityId;
    /**
     * 角色主键，sys_role表的主键id
     */
    @TableField(value = "role_id", el = "roleId")
    private Integer roleId;
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
}
