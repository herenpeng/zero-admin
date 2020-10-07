package com.zero.sys.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.entity.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 角色实体类信息
 * @author herenpeng
 * @since 2020-09-07 08:05
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_role")
public class Role extends BaseEntity implements Serializable {

    /**
     * 角色名称
     */
    @TableField(value = "name", el = "name")
    private String name;
    /**
     * 角色描述信息
     */
    @TableField(value = "description", el = "description")
    private String description;
}
