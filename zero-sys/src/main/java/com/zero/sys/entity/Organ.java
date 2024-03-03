package com.zero.sys.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import cn.afterturn.easypoi.excel.annotation.ExcelCollection;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.auth.entity.User;
import com.zero.common.base.entity.BaseTreeEntity;
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
 * @since 2024-01-20 10:11
 */
@Schema(name = "系统组织机构表")
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_organ")
public class Organ extends BaseTreeEntity {

    /**
     * 组织机构名称
     */
    @Schema(name = "组织机构名称")
    @Excel(name = "组织机构名称", width = 15, needMerge = true)
    @TableField(value = "name")
    private String name;

    /**
     * 该组织机构的用户，非数据库字段
     */
    @Schema(name = "该组织机构的用户")
    @ExcelCollection(name = "该组织机构的用户")
    @TableField(exist = false)
    private List<User> users;

}