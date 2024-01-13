package com.zero.sys.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.auth.entity.User;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 系统操作日志表
 *
 * @author herenpeng
 * @since 2020-12-01 22:31
 */
@Schema(name = "系统操作日志表")
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_operation_log")
public class OperationLog extends BaseEntity {

    /**
     * 操作日志用户
     */
    @Schema(name = "操作日志用户")
    @Excel(name = "操作日志用户主键", width = 15)
    @TableField(value = "operation_user_id")
    private Integer operationUserId;
    /**
     * 访问时间
     */
    @Schema(name = "访问时间")
    @Excel(name = "访问时间", width = 30, format = "yyyy-MM-dd HH:mm:ss")
    @TableField(value = "access_time")
    private Date accessTime;
    /**
     * 访问ip地址
     */
    @Schema(name = "访问ip地址")
    @Excel(name = "访问ip地址", width = 15)
    @TableField(value = "ip")
    private String ip;
    /**
     * 访问的uri
     */
    @Schema(name = "访问的uri")
    @Excel(name = "访问的uri", width = 30)
    @TableField(value = "uri")
    private String uri;
    /**
     * 方法类型
     */
    @Schema(name = "方法类型")
    @Excel(name = "方法类型", width = 10)
    @TableField(value = "method_type")
    private String methodType;
    /**
     * 访问方法
     */
    @Schema(name = "访问方法")
    @Excel(name = "访问方法", width = 40)
    @TableField(value = "method")
    private String method;
    /**
     * 请求参数
     */
    @Schema(name = "请求参数")
    @Excel(name = "请求参数", width = 40)
    @TableField(value = "request_args")
    private String requestArgs;
    /**
     * 执行时间
     */
    @Schema(name = "执行时间")
    @Excel(name = "执行时间", width = 10)
    @TableField(value = "execution_time")
    private Long executionTime;
    /**
     * 执行结果标识，1(true)为正常，0(false)为执行异常
     */
    @Schema(name = "执行结果标识")
    @Excel(name = "执行结果标识", width = 30)
    @TableField(value = "result")
    private Boolean result;
    /**
     * 日志描述信息
     */
    @Schema(name = "日志描述信息")
    @Excel(name = "日志描述信息", width = 30)
    @TableField(value = "description")
    private String description;
    /**
     * 异常名称
     */
    @Schema(name = "异常名称")
    @Excel(name = "异常名称", width = 30)
    @TableField(value = "exception_name")
    private String exceptionName;
    /**
     * 异常信息
     */
    @Schema(name = "异常信息")
    @Excel(name = "异常信息", width = 50)
    @TableField(value = "exception_message")
    private String exceptionMessage;

    /**
     * 非数据库字段，日志操作用户信息
     */
    @Schema(name = "非数据库字段，日志操作用户信息")
    @TableField(exist = false)
    private User user;

    /**
     * 非数据库字段，查询日志操作用户名称
     */
    @Schema(name = "非数据库字段，查询日志操作用户名称")
    @TableField(exist = false)
    private String queryUsername;

    /**
     * 非数据库字段，查询日志时间范围开始时间
     */
    @Schema(name = "非数据库字段，查询日志时间范围开始时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(exist = false)
    private Date queryStartDate;

    /**
     * 非数据库字段，查询日志时间范围结束时间
     */
    @Schema(name = "非数据库字段，查询日志时间范围结束时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(exist = false)
    private Date queryEndDate;

}