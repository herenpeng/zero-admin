package com.zero.common.base.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class BaseTreeEntity extends BaseEntity {

    @Schema(name = "父节点主键，如果为顶级节点，值为0")
    @Excel(name = "父节点主键", width = 15, needMerge = true)
    @TableField(value = "parent_id")
    private Integer parentId;

    @Schema(name = "节点排序")
    @Excel(name = "节点排序", width = 15, needMerge = true)
    @TableField(value = "sort")
    private Integer sort;

    /**
     * 节点的子节点，非数据库字段
     */
    @Schema(name = "节点的子节点")
    @TableField(exist = false)
    private List<? extends BaseTreeEntity> children;


}
