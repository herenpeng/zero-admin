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
    @TableField(value = "name")
    private String name;

    /**
     * 表注释
     */
    @ApiModelProperty(value = "数据库表描述")
    @TableField(value = "comment")
    private String comment;

    /**
     * 表名对应的实体类名称
     */
    @ApiModelProperty(value = "表名对应的实体类名称")
    @TableField(value = "entity_name")
    private String entityName;

    /**
     * 表名对应的实体类Controller请求路径
     */
    @ApiModelProperty(value = "表名对应的实体类请求路径")
    @TableField(value = "request_mapping")
    private String requestMapping;

    /**
     * Java包前缀名称
     */
    @ApiModelProperty(value = "Java包前缀名称")
    @TableField(value = "java_package_name")
    private String javaPackageName;

    /**
     * Java代码生成路径
     */
    @ApiModelProperty(value = "Java代码生成路径")
    @TableField(value = "java_code_path")
    private String javaCodePath;

    /**
     * Vue代码生成路径
     */
    @ApiModelProperty(value = "Vue代码生成路径")
    @TableField(value = "vue_code_path")
    private String vueCodePath;

    /**
     * Vue包路径
     */
    @ApiModelProperty(value = "Vue包路径")
    @TableField(value = "vue_package")
    private String vuePackage;

    /**
     * 代码作者
     */
    @ApiModelProperty(value = "代码作者")
    @TableField(value = "code_author")
    private String codeAuthor;

    /**
     * 数据库表的字段信息
     */
    @ApiModelProperty(value = "数据库表的字段信息")
    @TableField(exist = false)
    private List<TableColumn> tableColumnList;

}
