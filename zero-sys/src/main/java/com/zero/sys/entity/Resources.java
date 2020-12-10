package com.zero.sys.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelCollection;
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
 * 系统资源实体类
 *
 * @author herenpeng
 * @since 2020-09-07 8:20
 */
@ApiModel(value = "系统资源实体类")
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_resources")
public class Resources extends BaseEntity {

    /**
     * 资源定位符
     */
    @ApiModelProperty(value = "资源定位符")
    @Excel(name = "资源定位符", width = 15, needMerge = true)
    @TableField(value = "uri", el = "uri")
    private String uri;

    /**
     * 资源定位符匹配正则表达式
     */
    @ApiModelProperty(value = "资源定位符匹配正则表达式")
    @TableField(value = "regex", el = "regex")
    private String regex;

    /**
     * 资源描述信息
     */
    @ApiModelProperty(value = "资源描述信息")
    @Excel(name = "资源描述信息", width = 30, needMerge = true)
    @TableField(value = "description", el = "description")
    private String description;

    /**
     * 资源方法类型
     */
    @ApiModelProperty(value = "资源方法类型")
    @Excel(name = "资源方法类型", width = 30, needMerge = true)
    @TableField(value = "method_type", el = "methodType")
    private String methodType;

    /**
     * 拥有该资源的角色信息，非数据库字段
     */
    @ApiModelProperty(value = "拥有该资源的角色信息")
    @ExcelCollection(name = "拥有该资源的角色信息")
    @TableField(exist = false)
    private List<Role> roles;

    /**
     * 通过角色主键查询系统资源
     */
    @ApiModelProperty(value = "通过角色主键查询系统资源")
    @TableField(exist = false)
    private Integer roleId;

}
