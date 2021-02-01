package com.zero.upload.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.zero.auth.entity.User;
import com.zero.common.base.entity.BaseEntity;
import com.zero.upload.enums.FileTypeEnums;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * 文件资源管理表
 *
 * @author herenpeng
 * @since 2021-01-30 18:46
 */
@ApiModel(value = "文件资源管理表")
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("upload_file_manage")
public class FileManage extends BaseEntity {

    /**
     * 文件名称
     */
    @ApiModelProperty(value = "文件名称")
    @Excel(name = "文件名称", width = 15, needMerge = true)
    @TableField(value = "name", el = "name")
    private String name;
    /**
     * 文件类型
     */
    @ApiModelProperty(value = "文件类型")
    @Excel(name = "文件类型", width = 15, needMerge = true)
    @TableField("type")
    private FileTypeEnums type;
    /**
     * 文件http引用路径
     */
    @ApiModelProperty(value = "文件http引用路径")
    @Excel(name = "文件http引用路径", width = 15, needMerge = true)
    @TableField(value = "uri", el = "uri")
    private String uri;
    /**
     * 文件磁盘路径
     */
    @JsonIgnore
    @ApiModelProperty(value = "文件磁盘路径")
    @TableField(value = "path", el = "path")
    private String path;
    /**
     * 文件上传时间
     */
    @ApiModelProperty(value = "文件上传时间")
    @Excel(name = "文件上传时间", width = 15, needMerge = true)
    @TableField(value = "upload_time", el = "uploadTime")
    private Date uploadTime;
    /**
     * 文件上传用户主键
     */
    @ApiModelProperty(value = "文件上传用户主键")
    @Excel(name = "文件上传用户主键", width = 15, needMerge = true)
    @TableField(value = "upload_user_id", el = "uploadUserId")
    private Integer uploadUserId;
    /**
     * 主文件主键，源文件为0，其他值为对应的备份文件
     */
    @ApiModelProperty(value = "主文件主键，源文件为0，其他值为对应的备份文件")
    @Excel(name = "主文件主键，源文件为0，其他值为对应的备份文件", width = 15, needMerge = true)
    @TableField(value = "parent_id", el = "parentId")
    private Integer parentId;

    /**
     * 非数据库字段，备份文件集合
     */
    @ApiModelProperty(value = "备份文件集合")
    @TableField(exist = false)
    private List<FileManage> bakFiles;

    /**
     * 非数据库字段，文件上传用户信息
     */
    @ApiModelProperty(value = "非数据库字段，文件上传用户信息")
    @TableField(exist = false, el = "user")
    private User user;

    /**
     * 非数据库字段，查询上传文件的用户名称
     */
    @ApiModelProperty(value = "非数据库字段，查询上传文件的用户名称")
    @TableField(exist = false, el = "queryUsername")
    private String queryUsername;

    /**
     * 非数据库字段，查询上传文件的时间范围开始时间
     */
    @ApiModelProperty(value = "非数据库字段，查询上传文件的时间范围开始时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(exist = false, el = "queryStartDate")
    private Date queryStartDate;

    /**
     * 非数据库字段，查询上传文件的范围结束时间
     */
    @ApiModelProperty(value = "非数据库字段，查询上传文件的范围结束时间")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(exist = false, el = "queryEndDate")
    private Date queryEndDate;



}