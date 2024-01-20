package com.zero.auth.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.Role;
import org.apache.ibatis.annotations.*;
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
     * @param queryRole 角色查询条件
     * @return 角色分页集合
     * @throws Exception 抛出异常
     */
    IPage<Role> getPage(IPage page, @Param("queryRole") Role queryRole) throws Exception;

    /**
     * 获取所有的用户角色信息
     *
     * @param queryRole 角色查询条件
     * @return 所有用户集合
     * @throws Exception 抛出异常
     */
    List<Role> getList(@Param("queryRole") Role queryRole) throws Exception;

    /**
     * 通过用户主键信息获取该用户所有的角色，需要关联中间表auth_user_role
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
     * 通过资源主键信息获取该拥有该系统资源的角色，需要关联中间表auth_resources_role
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
     * @return 菜单拥有的角色信息
     */
    List<Role> getByMenuId(@Param("menuId") Integer menuId);

    /**
     * 获取该菜单没有的角色信息
     *
     * @param menuId 菜单主键
     * @return 该菜单没有的角色信息
     * @throws Exception 抛出异常
     */
    List<Role> getMenuNotRoleList(@Param("menuId") Integer menuId) throws Exception;

    /**
     * 检测角色名称是否已存在
     *
     * @param name 角色名称
     * @return 如果该角色名称已存在，返回true，否则返回false
     * @throws Exception 抛出异常
     */
    @Select("select count(*) from auth_role where name = #{name}")
    Boolean checkName(@Param("name") String name) throws Exception;


    /**
     * 通过主键恢复逻辑删除的系统角色表数据
     *
     * @param id 系统角色表主键
     * @throws Exception 抛出异常
     */
    @Update("update auth_role set deleted = 0 where id = #{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过系统角色表主键彻底删除系统角色表数据
     *
     * @param id 系统角色表主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from auth_role where id = #{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;

    /**
     * 通过角色名称获取角色对象
     *
     * @param name 角色名称
     * @return 角色对象
     * @throws Exception 抛出异常
     */
    @Select("select id,name,description,acquiescence from auth_role where name = #{name}")
    Role getByName(@Param("name") String name);

    /**
     * 查找默认的角色信息，默认角色永远只允许存在一个
     *
     * @return 默认的角色
     */
    @Select("select id,name,description,acquiescence from auth_role where acquiescence = 1")
    Role selectAcquiescence();
}
