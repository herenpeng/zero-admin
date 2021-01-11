package com.zero.sys.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 系统用户信息表
 *
 * @author herenpeng
 * @since 2021-01-11 21:55
 */
@ApiModel(value = "系统用户信息表")
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_user_info")
public class UserInfo extends BaseEntity {

    /**
     * 用户性别，1（true）为男，0（false）为女
     */
    @ApiModelProperty(value = "用户性别，1（true）为男，0（false）为女")
    @Excel(name = "用户性别", width = 15, needMerge = true)
    @TableField(value = "gender", el = "gender")
    private Boolean gender;
    /**
     * 用户手机号码
     */
    @ApiModelProperty(value = "用户手机号码")
    @Excel(name = "用户手机号码", width = 15, needMerge = true)
    @TableField(value = "mobile", el = "mobile")
    private String mobile;
    /**
     * 用户邮箱地址
     */
    @ApiModelProperty(value = "用户邮箱地址")
    @Excel(name = "用户邮箱地址", width = 15, needMerge = true)
    @TableField(value = "mail", el = "mail")
    private String mail;
    /**
     * 用户出生日期
     */
    @ApiModelProperty(value = "用户出生日期")
    @Excel(name = "用户出生日期", width = 15, needMerge = true)
    @TableField(value = "birthday", el = "birthday")
    private Date birthday;
    /**
     * 用户身份证号码
     */
    @ApiModelProperty(value = "用户身份证号码")
    @Excel(name = "用户身份证号码", width = 15, needMerge = true)
    @TableField(value = "identity_number", el = "identityNumber")
    private String identityNumber;
    /**
     * 用户头像路径
     */
    @ApiModelProperty(value = "用户头像路径")
    @Excel(name = "用户头像路径", width = 15, needMerge = true)
    @TableField(value = "avatar", el = "avatar")
    private String avatar;

}