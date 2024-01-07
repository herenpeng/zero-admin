package com.zero.sys.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelCollection;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.auth.entity.Role;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 系统菜单表
 *
 * @author herenpeng
 * @since 2020-11-15 21:20
 */
@Schema(name = "系统菜单表")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_menu")
public class Menu extends BaseEntity {

    /**
     * 菜单路由路径
     */
    @Schema(name = "菜单路由路径")
    @Excel(name = "菜单路由路径", width = 15, needMerge = true)
    @TableField(value = "path")
    private String path;
    /**
     * 菜单模块名称
     */
    @Schema(name = "菜单模块名称")
    @Excel(name = "菜单模块名称", width = 15, needMerge = true)
    @TableField(value = "name")
    private String name;
    /**
     * 菜单名称
     */
    @Schema(name = "菜单名称")
    @Excel(name = "菜单名称", width = 15, needMerge = true)
    @TableField(value = "meta_title")
    private String metaTitle;
    /**
     * 菜单图标
     */
    @Schema(name = "菜单图标")
    @Excel(name = "菜单图标", width = 15, needMerge = true)
    @TableField(value = "meta_icon")
    private String metaIcon;
    /**
     * 菜单排序
     */
    @Schema(name = "菜单排序")
    @Excel(name = "菜单排序", width = 15, needMerge = true)
    @TableField(value = "sort")
    private Integer sort;
    /**
     * 菜单是否隐藏，0(false)为正常，1(true)为隐藏，该隐藏只是对于页面左侧菜单不可见
     */
    @Schema(name = "菜单是否隐藏，0为正常，1为隐藏")
    @Excel(name = "菜单是否隐藏", width = 15, needMerge = true)
    @TableField(value = "hidden")
    private Boolean hidden;
    /**
     * 菜单是否显示，0(false)禁用，1(true)为启用，该启用为整个前端路由不可见，无法跳转
     */
    @Schema(name = "菜单是否启用，0为禁用，1为启用")
    @Excel(name = "菜单是否启用", width = 15, needMerge = true)
    @TableField(value = "enabled")
    private Boolean enabled;
    /**
     * 父级菜单主键，如果为顶级菜单，值为0
     */
    @Schema(name = "父级菜单主键，如果为顶级菜单，值为0")
    @Excel(name = "父级菜单主键", width = 15, needMerge = true)
    @TableField(value = "parent_id")
    private Integer parentId;

    /**
     * 菜单下级的子菜单，非数据库字段
     */
    @Schema(name = "菜单下级的子菜单")
    @TableField(exist = false)
    private List<Menu> children;

    /**
     * 拥有该菜单的角色信息，非数据库字段
     */
    @Schema(name = "拥有该菜单的角色信息")
    @ExcelCollection(name = "拥有该菜单的角色信息")
    @TableField(exist = false)
    private List<Role> roles;

    /**
     * 通过角色主键查询菜单
     */
    @Schema(name = "通过角色主键查询菜单")
    @TableField(exist = false)
    private Integer queryRoleId;

}