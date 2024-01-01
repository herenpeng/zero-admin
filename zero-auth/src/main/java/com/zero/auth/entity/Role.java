package com.zero.auth.entity;


import cn.afterturn.easypoi.excel.annotation.Excel;
import com.baomidou.mybatisplus.annotation.SqlCondition;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.zero.common.base.entity.BaseEntity;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
//import org.springframework.security.core.GrantedAuthority;

/**
 * 角色实体类信息
 *
 * @author herenpeng
 * @since 2020-09-07 08:05
 */
@Schema(name = "角色信息实体类")
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@TableName("auth_role")
public class Role extends BaseEntity  {
    //implements GrantedAuthority

    /**
     * 角色名称
     */
    @Schema(name = "角色名称")
    @Excel(name = "角色名称", width = 15)
    @TableField(value = "name", condition = SqlCondition.LIKE)
    private String name;

    /**
     * 角色描述信息
     */
    @Schema(name = "角色描述信息")
    @Excel(name = "角色描述信息", width = 30)
    @TableField(value = "description", condition = SqlCondition.LIKE)
    private String description;

    /**
     * 是否为默认角色，所有角色中只允许一个角色值为1(true)
     */
    @Schema(name = "是否为默认角色")
    @Excel(name = "是否为默认角色", width = 30)
    @TableField(value = "acquiescence")
    private Boolean acquiescence;

//    @Override
//    public String getAuthority() {
//        return SecurityConst.ROLE_ + this.name;
//    }
}
