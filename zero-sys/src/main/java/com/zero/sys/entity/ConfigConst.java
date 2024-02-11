package com.zero.sys.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
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
@Schema(name = "系统配置常量表")
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_config_const")
public class ConfigConst extends BaseEntity {

    /**
     * 常量键值，标识，唯一
     */
    @Schema(name = "常量键值，标识，唯一")
    @Excel(name = "常量键值，标识，唯一", width = 15, needMerge = true)
    @TableField(value = "`key`")
    private String key;
    /**
     * 键值描述信息
     */
    @Schema(name = "键值描述信息")
    @Excel(name = "键值描述信息", width = 15, needMerge = true)
    @TableField(value = "description")
    private String description;
    /**
     * 系统配置的默认值
     */
    @Schema(name = "系统配置的默认值")
    @Excel(name = "系统配置的默认值", width = 15, needMerge = true)
    @TableField(value = "default_value")
    private String defaultValue;
    /**
     * 用户是否可自定义，true为可配置，false为不可配置
     */
    @Schema(name = "用户是否可自定义")
    @Excel(name = "用户是否可自定义", width = 15, needMerge = true)
    @TableField(value = "custom")
    private Boolean custom;

}