package com.zero.sys.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @author herenpeng
 * @since 2023-09-04 21:15
 */
@Schema(name = "用户组织机构关系表")
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@TableName("sys_user_organ")
public class UserOrgan extends BaseEntity {

    /**
     * 用户主键
     */
    @Schema(name = "用户主键")
    @TableField(value = "user_id")
    private Integer userId;
    /**
     * 组织机构主键
     */
    @Schema(name = "组织机构主键")
    @TableField(value = "organ_id")
    private Integer organId;

}
