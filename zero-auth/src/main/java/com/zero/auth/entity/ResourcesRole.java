package com.zero.auth.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 资源-角色关联表
 *
 * @author herenpeng
 * @since 2020-09-07 19:13
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_resources_role")
public class ResourcesRole extends BaseEntity {

    /**
     * 权限主键，sys_resources表的主键id
     */
    @ApiModelProperty(value = "资源主键")
    @TableField(value = "resources_id", el = "resourcesId")
    private Integer resourcesId;

    /**
     * 角色主键，sys_role表的主键id
     */
    @ApiModelProperty(value = "角色主键")
    @TableField(value = "role_id", el = "roleId")
    private Integer roleId;

}
