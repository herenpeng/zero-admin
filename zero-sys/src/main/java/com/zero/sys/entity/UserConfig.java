package com.zero.sys.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.SqlCondition;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;


/**
 * 系统用户配置表
 *
 * @author herenpeng
 * @since 2021-06-06 18:28
 */
@ApiModel(value = "系统用户配置表")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_user_config")
public class UserConfig extends BaseEntity {

    /**
     * 用户主键
     */
    @ApiModelProperty(value = "用户主键")
    @Excel(name = "用户主键", width = 15, needMerge = true)
    @TableField(value = "user_id")
    private Integer userId;
    /**
     * 配置主键
     */
    @ApiModelProperty(value = "配置主键")
    @Excel(name = "配置主键", width = 15, needMerge = true)
    @TableField(value = "config_id")
    private Integer configId;
    /**
     * 用户配置值
     */
    @ApiModelProperty(value = "用户配置值")
    @Excel(name = "用户配置值", width = 15, needMerge = true)
    @TableField(value = "value")
    private String value;

}