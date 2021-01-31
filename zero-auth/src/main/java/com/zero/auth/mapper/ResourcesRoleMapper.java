package com.zero.auth.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zero.auth.entity.ResourcesRole;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 系统资源和角色关系表
 *
 * @author herenpeng
 * @since 2020-10-20 22:44
 */
@Mapper
@Repository
public interface ResourcesRoleMapper extends BaseMapper<ResourcesRole> {

    /**
     * 删除所有的系统资源和角色之间的关系
     *
     * @throws Exception
     */
    @Delete("delete from sys_resources_role")
    void deleteAll() throws Exception;


    /**
     * 删除系统资源角色
     *
     * @param resourcesId 系统资源主键
     * @param roleId      角色主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from sys_resources_role where resources_id = #{resourcesId} and role_id = #{roleId}")
    void deleteResourcesRole(@Param("resourcesId") Integer resourcesId, @Param("roleId") Integer roleId) throws Exception;
}
