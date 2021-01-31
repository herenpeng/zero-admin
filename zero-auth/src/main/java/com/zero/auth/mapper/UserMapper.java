package com.zero.auth.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 用户的Mapper接口
 *
 * @author herenpeng
 * @since 2020-09-07 19:25
 */
@Mapper
@Repository
public interface UserMapper extends BaseMapper<User> {

    /**
     * 分页获取用户数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page      分页查询
     * @param queryUser 用户查询条件
     * @return 用户集合
     * @throws Exception 抛出异常
     */
    IPage<User> getPage(IPage page, @Param("queryUser") User queryUser) throws Exception;

    /**
     * 查询所有的用户数据
     *
     * @param queryUser 查询用户的条件
     * @return 查询所有的用户数据
     * @throws Exception 抛出异常
     */
    List<User> getList(@Param("queryUser") User queryUser) throws Exception;

    /**
     * 通过用户名查找对应的用户，以及用户所拥有的角色信息
     *
     * @param username 用户名，需要在数据库中保证唯一
     * @return 用户信息
     * @throws Exception 抛出异常
     */
    User loadUserByUsername(@Param("username") String username);

    /**
     * 分页查询逻辑删除的用户数据
     *
     * @param page      分页查询
     * @param queryUser 用户查询条件
     * @return 用户集合
     * @throws Exception 抛出异常
     */
    IPage<User> getRecoverPage(IPage page, @Param("queryUser") User queryUser) throws Exception;

    /**
     * 通过用户主键恢复逻辑删除的用户数据
     *
     * @param id 用户主键
     * @throws Exception 抛出异常
     */
    @Update("update sys_user set deleted = 0 where id = #{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过用户主键彻底删除用户数据
     *
     * @param id 用户主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from sys_user where id = #{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;

    /**
     * 检测用户名是否已存在
     *
     * @param username 用户名
     * @return 如果该用户名已存在，返回true，否则返回false
     * @throws Exception 抛出异常
     */
    @Select("select count(*) from sys_user where username = #{username}")
    Boolean checkUsername(@Param("username") String username) throws Exception;

}
