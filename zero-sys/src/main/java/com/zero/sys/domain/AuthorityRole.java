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
@AllArgsConstructor
@NoArgsConstructor
@TableName("sys_authority_role")
public class AuthorityRole implements Serializable {
    /**
     * 权限主键，sys_authority表的主键id
     */
    @TableField(value = "aid", el = "aid")
    private Integer aid;
    /**
     * 角色主键，sys_role表的主键id
     */
    @TableField(value = "rid", el = "rid")
    private Integer rid;
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
