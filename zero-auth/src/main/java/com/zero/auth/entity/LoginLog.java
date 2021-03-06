package com.zero.auth.entity;

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
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 系统账号登录日志表
 *
 * @author herenpeng
 * @since 2021-02-17 10:04
 */
@ApiModel(value = "系统账号登录日志表")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@TableName("auth_login_log")
public class LoginLog extends BaseEntity {

    /**
     * 登录用户主键
     */
    @ApiModelProperty(value = "登录用户主键")
    @Excel(name = "登录用户主键", width = 15, needMerge = true)
    @TableField(value = "user_id")
    private Integer userId;
    /**
     * 登录的IP地址
     */
    @ApiModelProperty(value = "登录的IP地址")
    @Excel(name = "登录的IP地址", width = 15, needMerge = true)
    @TableField(value = "ip", condition = SqlCondition.LIKE)
    private String ip;
    /**
     * 登录现实地址，国家
     */
    @ApiModelProperty(value = "登录现实地址，国家")
    @Excel(name = "登录现实地址，国家", width = 15, needMerge = true)
    @TableField(value = "country", condition = SqlCondition.LIKE)
    private String country;
    /**
     * 登录现实地址，区域，省
     */
    @ApiModelProperty(value = "登录现实地址，区域，省")
    @Excel(name = "登录现实地址，区域，省", width = 15, needMerge = true)
    @TableField(value = "region", condition = SqlCondition.LIKE)
    private String region;
    /**
     * 登录现实地址，城市
     */
    @ApiModelProperty(value = "登录现实地址，城市")
    @Excel(name = "登录现实地址，城市", width = 15, needMerge = true)
    @TableField(value = "city", condition = SqlCondition.LIKE)
    private String city;
    /**
     * 因特网提供商
     */
    @ApiModelProperty(value = "因特网提供商")
    @Excel(name = "因特网提供商", width = 15, needMerge = true)
    @TableField(value = "isp", condition = SqlCondition.LIKE)
    private String isp;
    /**
     * 登录时间
     */
    @ApiModelProperty(value = "登录时间")
    @Excel(name = "登录时间", width = 15, needMerge = true)
    @TableField(value = "login_time")
    private Date loginTime;
    /**
     * tokenId
     */
    @ApiModelProperty(value = "tokenId")
    @Excel(name = "tokenId", width = 15, needMerge = true)
    @TableField(value = "token_id", condition = SqlCondition.LIKE)
    private String tokenId;
    /**
     * 登出时间，默认为登录时间+token失效时间，登出时更新
     */
    @ApiModelProperty(value = "登出时间，默认为登录时间+token失效时间，登出时更新")
    @Excel(name = "登出时间，默认为登录时间+token失效时间，登出时更新", width = 15, needMerge = true)
    @TableField(value = "logout_time")
    private Date logoutTime;
    /**
     * 是否主动登出，默认为0
     */
    @ApiModelProperty(value = "是否主动登出，默认为0")
    @Excel(name = "是否主动登出，默认为0", width = 15, needMerge = true)
    @TableField(value = "logout")
    private Boolean logout;

    /**
     * 用户信息
     */
    @ApiModelProperty(value = "用户信息")
    @TableField(exist = false)
    private User user;


    /**
     * 非数据库字段，查询登入日志登入用户名称
     */
    @ApiModelProperty(value = "非数据库字段，查询登入日志登入用户名称")
    @TableField(exist = false)
    private String queryUsername;

    /**
     * 非数据库字段，查询登入日志登入时间范围开始时间
     */
    @ApiModelProperty(value = "非数据库字段，查询登入日志登入时间范围开始时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(exist = false)
    private Date queryStartDate;

    /**
     * 非数据库字段，查询登入日志登入时间范围结束时间
     */
    @ApiModelProperty(value = "非数据库字段，查询登入日志登入时间范围结束时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(exist = false)
    private Date queryEndDate;


    /**
     * 非数据库字段，查询登入日志账号是否在线
     */
    @ApiModelProperty(value = "非数据库字段，查询登入日志账号是否在线")
    @TableField(exist = false)
    private Boolean queryOnline;

    /**
     * 非数据库字段，查询登入日志登入地址
     */
    @ApiModelProperty(value = "非数据库字段，查询登入日志登入地址")
    @TableField(exist = false)
    private String queryAddress;


}