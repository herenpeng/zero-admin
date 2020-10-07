package com.zero.common.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * @author herenpeng
 * @since 2020-10-07 14:50
 */
@Data
public class BaseEntity implements Serializable {

    /**
     * 主键
     */
    @ApiModelProperty(value = "主键ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 数据插入时间
     */
    @ApiModelProperty(value = "数据库数据创建时间")
    @TableField(value = "create_time", el = "createTime")
    private Date createTime;

    /**
     * 数据更新时间
     */
    @ApiModelProperty(value = "数据库数据更新时间")
    @TableField(value = "update_time", el = "updateTime")
    private Date updateTime;

    @ApiModelProperty(value = "数据库数据逻辑删除")
    @TableLogic
    private Integer deleted;

}
