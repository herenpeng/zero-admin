package com.zero.sys.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 权限实体类信息
 * @author herenpeng
 * @since 2020-09-07 8:20
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName("sys_authority")
public class Authority implements Serializable {
    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 权限格式
     */
    @TableField(value = "pattern", el = "pattern")
    private String pattern;
    /**
     * 权限名称
     */
    @TableField(value = "name", el = "name")
    private String name;
    /**
     * 权限描述信息
     */
    @TableField(value = "description", el = "description")
    private String description;
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
     * 拥有该权限的角色信息，非数据库字段
     */
    @TableField(exist = false)
    private List<Role> roles;
}
