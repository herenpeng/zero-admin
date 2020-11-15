package com.zero.code.generation.entity;

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
 * 系统数据库表信息实体类
 *
 * @author herenpeng
 * @since 2020-11-08 10:55
 */
@ApiModel(value = "系统数据库表信息实体类")
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("dev_table_info")
public class TableInfo extends BaseEntity {

    /**
     * 表名称
     */
    @ApiModelProperty(value = "数据库表名称")
    @TableField(value = "name", el = "name")
    private String name;

    /**
     * 表注释
     */
    @ApiModelProperty(value = "数据库表描述")
    @TableField(value = "comment", el = "comment")
    private String comment;

    /**
     * 表名对应的实体类名称
     */
    @ApiModelProperty(value = "表名对应的实体类名称")
    @TableField(value = "entity_name", el = "entityName")
    private String entityName;

    /**
     * 包前缀名称
     */
    @ApiModelProperty(value = "包前缀名称")
    @TableField(value = "base_package_name", el = "basePackageName")
    private String basePackageName;

    /**
     * 代码生成路径
     */
    @ApiModelProperty(value = "代码生成路径")
    @TableField(value = "code_generation_path", el = "codeGenerationPath")
    private String codeGenerationPath;

    /**
     * 代码作者
     */
    @ApiModelProperty(value = "代码作者")
    @TableField(value = "code_author", el = "codeAuthor")
    private String codeAuthor;

    /**
     * 数据库表的字段信息
     */
    @ApiModelProperty(value = "数据库表的字段信息")
    @TableField(exist = false)
    private List<TableColumn> tableColumnList;

}
