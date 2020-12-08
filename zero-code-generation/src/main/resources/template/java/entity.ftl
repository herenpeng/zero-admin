package ${basePackageName}.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * ${comment}
 *
 * @author ${codeAuthor}
 * @since ${.now?string("yyyy-MM-dd HH:mm")}
 */
@ApiModel(value = "${comment}")
@Data
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
    @Excel(name = "${column.comment}", width = 15, needMerge = true, replace = {"_null"})
    @TableField(value = "${column.name}", el = "${column.javaName}")
    private ${column.javaType} ${column.javaName};
</#if>
</#list>

}