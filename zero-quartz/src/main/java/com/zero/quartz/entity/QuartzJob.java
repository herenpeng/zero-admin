package com.zero.quartz.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 定时任务表
 *
 * @author root
 * @since 2025-02-05 21:36
 */
@Schema(name = "定时任务表")
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@TableName("quartz_job")
public class QuartzJob extends BaseEntity {

    /**
     * 任务名
     */
    @Schema(name = "任务名")
    @Excel(name = "任务名", width = 15, needMerge = true)
    @TableField(value = "name")
    private String name;
    /**
     * 任务组
     */
    @Schema(name = "任务组")
    @Excel(name = "任务组", width = 15, needMerge = true)
    @TableField(value = "group_name")
    private String groupName;
    /**
     * 是否运行，0停止，1运行 
     */
    @Schema(name = "是否运行，0停止，1运行 ")
    @Excel(name = "是否运行，0停止，1运行 ", width = 15, needMerge = true)
    @TableField(value = "status")
    private Boolean status;
    /**
     * 表达式
     */
    @Schema(name = "表达式")
    @Excel(name = "表达式", width = 15, needMerge = true)
    @TableField(value = "expression")
    private String expression;
    /**
     * 描述
     */
    @Schema(name = "描述")
    @Excel(name = "描述", width = 15, needMerge = true)
    @TableField(value = "description")
    private String description;
    /**
     * 是否同步，0否，1是
     */
    @Schema(name = "是否同步，0否，1是")
    @Excel(name = "是否同步，0否，1是", width = 15, needMerge = true)
    @TableField(value = "concurrent")
    private Boolean concurrent;
    /**
     * 全限定类名
     */
    @Schema(name = "全限定类名")
    @Excel(name = "全限定类名", width = 15, needMerge = true)
    @TableField(value = "bean_class")
    private String beanClass;
    /**
     * 方法名称
     */
    @Schema(name = "方法名称")
    @Excel(name = "方法名称", width = 15, needMerge = true)
    @TableField(value = "method")
    private String method;
    /**
     * 上传一次执行时间
     */
    @Schema(name = "上传一次执行时间")
    @Excel(name = "上传一次执行时间", width = 15, needMerge = true)
    @TableField(value = "previous_fire_time")
    private Date previousFireTime;
    /**
     * 下一次执行时间
     */
    @Schema(name = "下一次执行时间")
    @Excel(name = "下一次执行时间", width = 15, needMerge = true)
    @TableField(value = "next_fire_time")
    private Date nextFireTime;

}