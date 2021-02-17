package com.zero.code.generation.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 系统数据库表字段信息实体类
 *
 * @author herenpeng
 * @since 2020-11-11 23:11
 */
@ApiModel(value = "系统数据库表字段信息实体类")
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("dev_table_column")
public class TableColumn extends BaseEntity {

    /**
     * 数据库表字段名称
     */
    @ApiModelProperty(value = "数据库表字段名称")
    @TableField(value = "name")
    private String name;

    /**
     * Java属性名称
     */
    @ApiModelProperty(value = "Java属性名称")
    @TableField(value = "java_name")
    private String javaName;

    /**
     * 数据库表字段注释
     */
    @ApiModelProperty(value = "数据库表字段注释")
    @TableField(value = "comment")
    private String comment;

    /**
     * 数据库表字段类型
     */
    @ApiModelProperty(value = "数据库表字段类型")
    @TableField(value = "database_type")
    private String databaseType;

    /**
     * 数据库表字段对应的JDBC类型
     */
    @ApiModelProperty(value = "数据库表字段对应的JDBC类型")
    @TableField(value = "jdbc_type")
    private String jdbcType;

    /**
     * 数据库表字段对应的JAVA类型
     */
    @ApiModelProperty(value = "数据库表字段对应的JAVA类型")
    @TableField(value = "java_type")
    private String javaType;

    /**
     * 数据库表字段排序顺序，数据库默认升序排序
     */
    @ApiModelProperty(value = "数据库表字段排序顺序")
    @TableField(value = "sort")
    private Integer sort;

    /**
     * 表信息主键，关联dev_table_info表的主键
     */
    @ApiModelProperty(value = "表信息主键，关联dev_table_info表的主键")
    @TableField(value = "table_info_id")
    private Integer tableInfoId;

}
