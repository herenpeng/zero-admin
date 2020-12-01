package com.zero.sys.entity;

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
 * 系统操作日志表
 *
 * @author herenpeng
 * @since 2020-12-01 22:31
 */
@ApiModel(value = "系统操作日志表")
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_log")
public class Log extends BaseEntity {

    /**
     * 操作日志用户
     */
    @ApiModelProperty(value = "操作日志用户")
    @TableField(value = "username", el = "username")
    private String username;
    /**
     * 访问时间
     */
    @ApiModelProperty(value = "访问时间")
    @TableField(value = "access_time", el = "accessTime")
    private Date accessTime;
    /**
     * 访问ip地址
     */
    @ApiModelProperty(value = "访问ip地址")
    @TableField(value = "ip", el = "ip")
    private String ip;
    /**
     * 访问的uri
     */
    @ApiModelProperty(value = "访问的uri")
    @TableField(value = "uri", el = "uri")
    private String uri;
    /**
     * 方法类型
     */
    @ApiModelProperty(value = "方法类型")
    @TableField(value = "method_type", el = "methodType")
    private String methodType;
    /**
     * 访问方法
     */
    @ApiModelProperty(value = "访问方法")
    @TableField(value = "method", el = "method")
    private String method;
    /**
     * 执行时间
     */
    @ApiModelProperty(value = "执行时间")
    @TableField(value = "execution_time", el = "executionTime")
    private Long executionTime;
    /**
     * 日志描述信息
     */
    @ApiModelProperty(value = "日志描述信息")
    @TableField(value = "description", el = "description")
    private String description;
    /**
     * 异常名称
     */
    @ApiModelProperty(value = "异常名称")
    @TableField(value = "exception_name", el = "exceptionName")
    private String exceptionName;
    /**
     * 异常信息
     */
    @ApiModelProperty(value = "异常信息")
    @TableField(value = "exception_message", el = "exceptionMessage")
    private String exceptionMessage;

}