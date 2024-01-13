package com.zero.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 系统菜单角色关系表
 *
 * @author herenpeng
 * @since 2020-11-22 09:46
 */
@Schema(name = "系统菜单角色关系表")
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_menu_role")
public class MenuRole extends BaseEntity {

    /**
     * 菜单主键
     */
    @Schema(name = "菜单主键")
    @TableField(value = "menu_id")
    private Integer menuId;
    /**
     * 角色主键
     */
    @Schema(name = "角色主键")
    @TableField(value = "role_id")
    private Integer roleId;

}