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


/**
 * 系统用户配置表
 *
 * @author herenpeng
 * @since 2021-06-06 18:28
 */
@Schema(name = "系统用户配置表")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_user_config")
public class UserConfig extends BaseEntity {

    /**
     * 用户主键
     */
    @Schema(name = "用户主键")
    @Excel(name = "用户主键", width = 15, needMerge = true)
    @TableField(value = "user_id")
    private Integer userId;
    /**
     * 配置主键
     */
    @Schema(name = "配置主键")
    @Excel(name = "配置主键", width = 15, needMerge = true)
    @TableField(value = "config_id")
    private Integer configId;
    /**
     * 用户配置值
     */
    @Schema(name = "用户配置值")
    @Excel(name = "用户配置值", width = 15, needMerge = true)
    @TableField(value = "value")
    private String value;

    /**
     * 非数据库字段，用户配置用户信息
     */
    @Schema(name = "非数据库字段，用户配置用户信息")
    @TableField(exist = false)
    private User user;
    /**
     * 非数据库字段，系统配置常量对象
     */
    @Schema(name = "系统配置常量对象")
    @TableField(exist = false)
    private ConfigConst configConst;

    /**
     * 非数据库字段，查询配置KEY常量值
     */
    @Schema(name = "非数据库字段，查询配置KEY常量值")
    @TableField(exist = false)
    private String queryKey;

    /**
     * 非数据库字段，查询配置用户名称
     */
    @Schema(name = "非数据库字段，查询配置用户名称")
    @TableField(exist = false)
    private String queryUsername;

}