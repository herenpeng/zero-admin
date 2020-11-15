package com.zero.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 角色实体类信息
 * @author herenpeng
 * @since 2020-09-07 08:05
 */
@ApiModel(value = "角色信息实体类")
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_role")
public class Role extends BaseEntity {

    /**
     * 角色名称
     */
    @ApiModelProperty(value = "角色名称")
    @TableField(value = "name", el = "name")
    private String name;

    /**
     * 角色描述信息
     */
    @ApiModelProperty(value = "角色描述信息")
    @TableField(value = "description", el = "description")
    private String description;
}
