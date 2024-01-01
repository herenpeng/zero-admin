package com.zero.auth.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * 系统用户信息表
 *
 * @author herenpeng
 * @since 2021-01-12 22:19
 */
@Schema(name = "系统用户信息表")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@TableName("auth_user_info")
public class UserInfo extends BaseEntity {

    /**
     * 用户姓名
     */
    @Schema(name = "用户姓名")
    @Excel(name = "用户姓名", width = 15, needMerge = true)
    @TableField(value = "name")
    private String name;
    /**
     * 用户性别，1（true）为男，0（false）为女
     */
    @Schema(name = "用户性别，1（true）为男，0（false）为女")
    @Excel(name = "用户性别，1（true）为男，0（false）为女", width = 15, needMerge = true)
    @TableField(value = "gender")
    private Boolean gender;
    /**
     * 用户手机号码
     */
    @Schema(name = "用户手机号码")
    @Excel(name = "用户手机号码", width = 15, needMerge = true)
    @TableField(value = "mobile")
    private String mobile;
    /**
     * 用户邮箱地址
     */
    @Schema(name = "用户邮箱地址")
    @Excel(name = "用户邮箱地址", width = 15, needMerge = true)
    @TableField(value = "mail")
    private String mail;
    /**
     * 用户出生日期
     */
    @Schema(name = "用户出生日期")
    @Excel(name = "用户出生日期", width = 15, needMerge = true)
    @JsonFormat(pattern = "yyyy-MM-dd")
    @TableField(value = "birthday")
    private Date birthday;
    /**
     * 用户身份证号码
     */
    @Schema(name = "用户身份证号码")
    @Excel(name = "用户身份证号码", width = 15, needMerge = true)
    @TableField(value = "id_number")
    private String idNumber;
    /**
     * 用户QQ号码
     */
    @Schema(name = "用户QQ号码")
    @Excel(name = "用户QQ号码", width = 15, needMerge = true)
    @TableField(value = "qq")
    private String qq;
    /**
     * 用户微信号码
     */
    @Schema(name = "用户微信号码")
    @Excel(name = "用户微信号码", width = 15, needMerge = true)
    @TableField(value = "we_chat")
    private String weChat;
    /**
     * 用户头像路径
     */
    @Schema(name = "用户头像路径")
    @Excel(name = "用户头像路径", width = 15, needMerge = true)
    @TableField(value = "avatar")
    private String avatar;

}