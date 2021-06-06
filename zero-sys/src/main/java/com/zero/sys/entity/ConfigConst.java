package com.zero.sys.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import com.zero.sys.enums.ConfigConstKey;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;


/**
 * 系统配置常量表
 *
 * @author herenpeng
 * @since 2021-06-05 22:29
 */
@ApiModel(value = "系统配置常量表")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_config_const")
public class ConfigConst extends BaseEntity {

    /**
     * 常量键值，标识，唯一
     */
    @ApiModelProperty(value = "常量键值，标识，唯一")
    @Excel(name = "常量键值，标识，唯一", width = 15, needMerge = true)
    @TableField(value = "`key`")
    private ConfigConstKey key;
    /**
     * 键值描述信息
     */
    @ApiModelProperty(value = "键值描述信息")
    @Excel(name = "键值描述信息", width = 15, needMerge = true)
    @TableField(value = "description")
    private String description;
    /**
     * 系统配置的默认值
     */
    @ApiModelProperty(value = "系统配置的默认值")
    @Excel(name = "系统配置的默认值", width = 15, needMerge = true)
    @TableField(value = "default_value")
    private String defaultValue;
    /**
     * 用户是否可配置，true为可配置，false为不可配置
     */
    @ApiModelProperty(value = "用户是否可配置")
    @Excel(name = "用户是否可配置", width = 15, needMerge = true)
    @TableField(value = "userable")
    private Boolean userable;

}