package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zero.sys.entity.MenuRole;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 系统菜单角色关系表的Mapper接口
 *
 * @author herenpeng
 * @since 2020-11-22 09:46
 */
@Mapper
@Repository
public interface MenuRoleMapper extends BaseMapper<MenuRole> {

    /**
     * 删除菜单角色
     *
     * @param menuId 菜单主键
     * @param roleId 角色主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from sys_menu_role where menu_id = #{menuId} and role_id = #{roleId}")
    void deleteMenuRole(@Param("menuId") Integer menuId, @Param("roleId") Integer roleId) throws Exception;

}
