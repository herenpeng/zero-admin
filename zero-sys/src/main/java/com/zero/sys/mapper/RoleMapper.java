package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.sys.entity.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 角色的Mapper接口
 *
 * @author herenpeng
 * @since 2020-09-07 22:34
 */
@Mapper
@Repository
public interface RoleMapper extends BaseMapper<Role> {

    /**
     * 分页获取角色数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page      分页查询
     * @param queryRole 用户查询条件
     * @return 角色分页集合
     * @throws Exception 抛出异常
     */
    IPage<Role> getPage(IPage page, @Param("queryRole") Role queryRole) throws Exception;

    /**
     * 通过用户主键信息获取该用户所有的角色，需要关联中间表sys_user_role
     *
     * @param userId 用户主键
     * @return
     * @throws Exception
     */
    List<Role> getByUserId(@Param("userId") Integer userId) throws Exception;

    /**
     * 获取该用户没有的角色信息
     *
     * @param userId 用户主键
     * @return 用户未拥有的角色集合
     * @throws Exception 抛出异常
     */
    List<Role> getUserNotRoleList(@Param("userId") Integer userId) throws Exception;

    /**
     * 通过资源主键信息获取该拥有该系统资源的角色，需要关联中间表sys_resources_role
     *
     * @param resourcesId 系统资源主键
     * @return
     * @throws Exception 抛出异常
     */
    List<Role> getByResourcesId(@Param("resourcesId") Integer resourcesId) throws Exception;


    /**
     * 获取没有该资源的角色信息
     *
     * @param resourcesId 用户主键
     * @return 没有该资源的角色集合
     * @throws Exception 抛出异常
     */
    List<Role> getResourcesNotRoleList(@Param("resourcesId") Integer resourcesId) throws Exception;

    /**
     * 获取拥有该菜单的所有角色信息
     *
     * @param menuId 菜单主键
     * @return
     * @throws Exception 抛出异常
     */
    List<Role> getByMenuId(@Param("menuId") Integer menuId) throws Exception;

    /**
     * 获取该菜单没有的角色信息
     *
     * @param menuId 菜单主键
     * @return 该菜单没有的角色信息
     * @throws Exception 抛出异常
     */
    List<Role> getMenuNotRoleList(@Param("menuId") Integer menuId) throws Exception;

}
