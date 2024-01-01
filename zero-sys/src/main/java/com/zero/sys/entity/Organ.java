package com.zero.sys.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.auth.entity.User;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.List;


/**
 * 系统组织机构表
 *
 * @author herenpeng
 * @since 2023-09-03 16:42
 */
@Schema(name = "系统组织机构表")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_organ")
public class Organ extends BaseEntity {

    /**
     * 组织机构名称
     */
    @Schema(name = "组织机构名称")
    @Excel(name = "组织机构名称", width = 15, needMerge = true)
    @TableField(value = "name")
    private String name;
    /**
     * 组织机构排序
     */
    @Schema(name = "组织机构排序")
    @Excel(name = "组织机构排序", width = 15, needMerge = true)
    @TableField(value = "sort")
    private Integer sort;
    /**
     * 父级组织机构主键，如果为顶级组织机构，值为0
     */
    @Schema(name = "父级组织机构主键，如果为顶级组织机构，值为0")
    @Excel(name = "父级组织机构主键，如果为顶级组织机构，值为0", width = 15, needMerge = true)
    @TableField(value = "parent_id")
    private Integer parentId;


    /**
     * 组织机构下级的子组织机构，非数据库字段
     */
    @Schema(name = "组织机构下级的子组织机构")
    @TableField(exist = false)
    private List<Organ> children;

    /**
     * 组织机构中的用户，非数据库字段
     */
    @Schema(name = "组织机构中的用户")
    @TableField(exist = false)
    private List<User> users;


}