package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.sys.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 用户的Mapper接口
 *
 * @author herenpeng
 * @since 2020-09-07 19:25
 */
@Repository
public interface UserMapper extends BaseMapper<User> {

    /**
     * 通过用户名查找对应的用户，以及用户所拥有的角色信息
     *
     * @param username 用户名，需要在数据库中保证唯一
     * @return 用户信息
     * @throws Exception 抛出异常
     */
    User loadUserByUsername(@Param("username") String username) throws Exception;

    /**
     * 分页获取用户数据，区别于selectPage的是，使用该方法能够关联获取User对象中的roles集合属性
     *
     * @param page 分页查询
     * @return 用户集合
     * @throws Exception 抛出异常
     */
    IPage<User> getPage(IPage page) throws Exception;

    /**
     * 删除用户的角色
     *
     * @param userId 用户主键
     * @param roleId 角色主键
     * @throws Exception 抛出异常
     */
    void deleteUserRole(@Param("userId") Integer userId, @Param("roleId") Integer roleId) throws Exception;


}
