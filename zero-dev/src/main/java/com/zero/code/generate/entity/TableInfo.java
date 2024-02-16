package com.zero.code.generate.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 系统数据库表信息实体类
 *
 * @author herenpeng
 * @since 2020-11-08 10:55
 */
@Schema(name = "系统数据库表信息实体类")
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@TableName("dev_table_info")
public class TableInfo extends BaseEntity {

    /**
     * 表名称
     */
    @Schema(name = "数据库表名称")
    @TableField(value = "name")
    private String name;

    /**
     * 表注释
     */
    @Schema(name = "数据库表描述")
    @TableField(value = "comment")
    private String comment;

    /**
     * 表名对应的实体类名称
     */
    @Schema(name = "表名对应的实体类名称")
    @TableField(value = "entity_name")
    private String entityName;

    /**
     * Java代码生成路径
     */
    @Schema(name = "Java代码生成路径")
    @TableField(value = "java_code_path")
    private String javaCodePath;

    /**
     * 表名对应的实体类Controller请求路径
     */
    @Schema(name = "表名对应的实体类请求路径")
    @TableField(value = "request_mapping")
    private String requestMapping;

    /**
     * Java包前缀名称
     */
    @Schema(name = "Java包前缀名称")
    @TableField(value = "java_package")
    private String javaPackage;

    /**
     * Vue代码生成路径
     */
    @Schema(name = "Vue代码生成路径")
    @TableField(value = "vue_code_path")
    private String vueCodePath;

    /**
     * Vue包路径
     */
    @Schema(name = "Vue包路径")
    @TableField(value = "vue_package")
    private String vuePackage;

    /**
     * 是否为树状结构
     */
    @Schema(name = "是否为树状结构")
    @TableField(value = "tree")
    private Boolean tree;

    /**
     * 是否覆盖同名文件
     */
    @Schema(name = "是否覆盖同名文件")
    @TableField(value = "cover")
    private Boolean cover;

    /**
     * 代码作者
     */
    @Schema(name = "代码作者")
    @TableField(value = "code_author")
    private String codeAuthor;

    /**
     * 数据库表的字段信息
     */
    @Schema(name = "数据库表的字段信息")
    @TableField(exist = false)
    private List<TableColumn> tableColumnList;

}
