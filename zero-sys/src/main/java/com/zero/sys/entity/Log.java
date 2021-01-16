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
import org.springframework.format.annotation.DateTimeFormat;

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
    @Excel(name = "操作日志用户", width = 15)
    @TableField(value = "username", el = "username")
    private String username;
    /**
     * 访问时间
     */
    @ApiModelProperty(value = "访问时间")
    @Excel(name = "访问时间", width = 30, format = "yyyy-MM-dd HH:mm:ss")
    @TableField(value = "access_time", el = "accessTime")
    private Date accessTime;
    /**
     * 访问ip地址
     */
    @ApiModelProperty(value = "访问ip地址")
    @Excel(name = "访问ip地址", width = 15)
    @TableField(value = "ip", el = "ip")
    private String ip;
    /**
     * 访问的uri
     */
    @ApiModelProperty(value = "访问的uri")
    @Excel(name = "访问的uri", width = 30)
    @TableField(value = "uri", el = "uri")
    private String uri;
    /**
     * 方法类型
     */
    @ApiModelProperty(value = "方法类型")
    @Excel(name = "方法类型", width = 10)
    @TableField(value = "method_type", el = "methodType")
    private String methodType;
    /**
     * 访问方法
     */
    @ApiModelProperty(value = "访问方法")
    @Excel(name = "访问方法", width = 40)
    @TableField(value = "method", el = "method")
    private String method;
    /**
     * 执行时间
     */
    @ApiModelProperty(value = "执行时间")
    @Excel(name = "执行时间", width = 10)
    @TableField(value = "execution_time", el = "executionTime")
    private Long executionTime;
    /**
     * 日志描述信息
     */
    @ApiModelProperty(value = "日志描述信息")
    @Excel(name = "日志描述信息", width = 30)
    @TableField(value = "description", el = "description")
    private String description;
    /**
     * 异常名称
     */
    @ApiModelProperty(value = "异常名称")
    @Excel(name = "异常名称", width = 30)
    @TableField(value = "exception_name", el = "exceptionName")
    private String exceptionName;
    /**
     * 异常信息
     */
    @ApiModelProperty(value = "异常信息")
    @Excel(name = "异常信息", width = 50)
    @TableField(value = "exception_message", el = "exceptionMessage")
    private String exceptionMessage;

    @ApiModelProperty(value = "非数据库字段，查询日志时间范围开始时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(exist = false, el = "queryStartDate")
    private Date queryStartDate;

    @ApiModelProperty(value = "非数据库字段，查询日志时间范围结束时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(exist = false, el = "queryEndDate")
    private Date queryEndDate;

}