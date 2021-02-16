package com.zero.auth.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zero.auth.entity.UserRole;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 用户和角色之间的关系表
 *
 * @author herenpeng
 * @since 2020-10-09 22:37
 */
@Mapper
@Repository
public interface UserRoleMapper extends BaseMapper<UserRole> {

    /**
     * 删除用户的角色（彻底删除）
     *
     * @param userId 用户主键
     * @param roleId 角色主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from auth_user_role where user_id = #{userId} and role_id = #{roleId}")
    void deleteUserRole(@Param("userId") Integer userId, @Param("roleId") Integer roleId) throws Exception;

    /**
     * 删除一个用户的所有角色关系
     *
     * @param userId 用户主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from auth_user_role where user_id = #{userId}")
    void deleteByUserId(@Param("userId") Integer userId) throws Exception;

}
