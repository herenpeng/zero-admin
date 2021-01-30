package com.zero.upload.entity;

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
    @TableField(value = "type", el = "type")
    private String type;
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
    @ApiModelProperty(value = "文件磁盘路径")
    @Excel(name = "文件磁盘路径", width = 15, needMerge = true)
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
    private List<FileManage> backupFileList;


}