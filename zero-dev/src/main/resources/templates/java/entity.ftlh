package ${javaPackageName}.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.SqlCondition;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

<#assign HasBigDecimal = true>
<#assign HasDate = true>
<#list tableColumnList as column>
    <#if column.javaType == "BigDecimal" && HasBigDecimal>
import java.math.BigDecimal;
    <#assign HasBigDecimal = false>
    </#if>
    <#if column.javaType == "Date" && HasDate && column.name != "create_time" && column.name != "update_time">
import java.util.Date;
    <#assign HasDate = false>
    </#if>
</#list>

/**
 * ${comment}
 *
 * @author ${codeAuthor}
 * @since ${.now?string("yyyy-MM-dd HH:mm")}
 */
@ApiModel(value = "${comment}")
@Data
@EqualsAndHashCode(callSuper = false)
@NoArgsConstructor
@AllArgsConstructor
@TableName("${name}")
public class ${entityName} extends BaseEntity {

<#list tableColumnList as column>
<#if column.name != "id" && column.name != "create_time" && column.name != "create_user_id" && column.name != "update_time" && column.name != "update_user_id" && column.name != "deleted">
    /**
     * ${column.comment}
     */
    @ApiModelProperty(value = "${column.comment}")
    @Excel(name = "${column.comment}", width = 15, needMerge = true)
    @TableField(value = "${column.name}")
    private ${column.javaType} ${column.javaName};
</#if>
</#list>

}