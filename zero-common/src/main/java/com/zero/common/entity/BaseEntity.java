package com.zero.common.entity;

import com.baomidou.mybatisplus.annotation.*;
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
     * 主键ID
     */
    @ApiModelProperty(value = "主键ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 数据库数据创建时间
     */
    @ApiModelProperty(value = "数据库数据创建时间")
    @TableField(value = "create_time", el = "createTime")
    private Date createTime;

    /**
     * 数据库数据插入用户主键，由MyBatisPlus拦截器处理，在数据插入时更新
     */
    @ApiModelProperty(value = "数据库数据插入用户主键")
    @TableField(value = "create_user_id", fill = FieldFill.INSERT)
    private Integer createUserId;

    /**
     * 数据库数据更新时间
     */
    @ApiModelProperty(value = "数据库数据更新时间")
    @TableField(value = "update_time", el = "updateTime")
    private Date updateTime;

    /**
     * 数据库数据更新用户主键，由MyBatisPlus拦截器处理，在数据更新时更新
     */
    @ApiModelProperty(value = "数据库数据更新用户主键")
    @TableField(value = "update_user_id", fill = FieldFill.INSERT_UPDATE)
    private Integer updateUserId;

    /**
     * 数据库数据标识逻辑删除字段
     */
    @ApiModelProperty(value = "数据库数据标识逻辑删除字段")
    @TableLogic
    private Integer deleted;

}
