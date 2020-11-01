package com.zero.sys.domain;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.entity.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 系统访问日志实体类
 *
 * @author herenpeng
 * @since 2020-10-27 22:51
 */
@ApiModel(value = "系统访问日志实体类")
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_log")
public class Log extends BaseEntity {

    /**
     * 执行该操作的用户
     */
    @ApiModelProperty(value = "操作日志用户")
    @TableField(value = "username", el = "username")
    private String username;

    /**
     * 执行该操作的时间
     */
    @ApiModelProperty(value = "访问时间")
    @TableField(value = "access_time", el = "accessTime")
    private Date accessTime;

    /**
     * 执行该操作的ip地址信息
     */
    @ApiModelProperty(value = "访问ip地址")
    @TableField(value = "ip", el = "ip")
    private String ip;

    /**
     * 执行该操作的uri
     */
    @ApiModelProperty(value = "访问的uri")
    @TableField(value = "uri", el = "uri")
    private String uri;

    /**
     * 执行该操作的方法类型，HTTP请求类型
     */
    @ApiModelProperty(value = "方法类型")
    @TableField(value = "method_type", el = "methodType")
    private String methodType;

    /**
     * 执行该操作的方法
     */
    @ApiModelProperty(value = "访问方法")
    @TableField(value = "method", el = "method")
    private String method;

    /**
     * 执行该操作耗时
     */
    @ApiModelProperty(value = "执行时间")
    @TableField(value = "execution_time", el = "executionTime")
    private Long executionTime;

    /**
     * 日志描述信息
     */
    @ApiModelProperty(value = "日志描述")
    @TableField(value = "description", el = "description")
    private String description;

    /**
     * 执行该操作发生的异常名称
     */
    @ApiModelProperty(value = "异常名称")
    @TableField(value = "exception_name", el = "exceptionName")
    private String exceptionName;

    /**
     * 执行该操作发生的异常信息
     */
    @ApiModelProperty(value = "异常信息")
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
