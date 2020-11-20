package com.zero.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 系统菜单表
 *
 * @author herenpeng
 * @since 2020-11-15 21:20
 */
@ApiModel(value = "系统菜单表")
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_menu")
public class Menu extends BaseEntity {

    /**
     * 菜单路由路径
     */
    @ApiModelProperty(value = "菜单路由路径")
    @TableField(value = "path", el = "path")
    private String path;
    /**
     * 菜单模块名称
     */
    @ApiModelProperty(value = "菜单模块名称")
    @TableField(value = "name", el = "name")
    private String name;
    /**
     * 菜单模块路径
     */
    @ApiModelProperty(value = "菜单模块路径")
    @TableField(value = "component", el = "component")
    private String component;
    /**
     * 菜单名称
     */
    @ApiModelProperty(value = "菜单名称")
    @TableField(value = "meta_title", el = "metaTitle")
    private String metaTitle;
    /**
     * 菜单图标
     */
    @ApiModelProperty(value = "菜单图标")
    @TableField(value = "meta_icon", el = "metaIcon")
    private String metaIcon;
    /**
     * 父级菜单定向路由路径
     */
    @ApiModelProperty(value = "父级菜单定向路由路径")
    @TableField(value = "redirect", el = "redirect")
    private String redirect;
    /**
     * 菜单排序
     */
    @ApiModelProperty(value = "菜单排序")
    @TableField(value = "sort", el = "sort")
    private Integer sort;
    /**
     * 菜单是否显示，0(false)为显示，1(true)为隐藏
     */
    @ApiModelProperty(value = "菜单是否启用，0为禁用，1为启用")
    @TableField(value = "enabled", el = "enabled")
    private Boolean enabled;
    /**
     * 父级菜单主键，如果为顶级菜单，值为0
     */
    @ApiModelProperty(value = "父级菜单主键，如果为顶级菜单，值为0")
    @TableField(value = "parent_id", el = "parentId")
    private Integer parentId;

    /**
     * 菜单下级的子菜单，非数据库字段
     */
    @ApiModelProperty(value = "菜单下级的子菜单")
    @TableField(exist = false)
    private List<Menu> childrenMenuList;

}