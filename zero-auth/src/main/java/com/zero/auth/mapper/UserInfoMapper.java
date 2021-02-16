package com.zero.auth.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.UserInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 系统用户信息表的Mapper接口
 *
 * @author herenpeng
 * @since 2021-01-12 22:19
 */
@Mapper
@Repository
public interface UserInfoMapper extends BaseMapper<UserInfo> {

    /**
     * 分页查询系统用户信息表数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page          分页查询
     * @param queryUserInfo UserInfo查询条件
     * @return UserInfo集合
     * @throws Exception 抛出异常
     */
    IPage<UserInfo> getPage(IPage page, @Param("queryUserInfo") UserInfo queryUserInfo) throws Exception;

    /**
     * 获取所有的系统用户信息表数据，区别于selectList的是，该方法添加了查询条件
     *
     * @param queryUserInfo UserInfo查询条件
     * @return UserInfo集合
     * @throws Exception 抛出异常
     */
    List<UserInfo> getList(@Param("queryUserInfo") UserInfo queryUserInfo) throws Exception;

    /**
     * 分页查询逻辑删除的系统用户信息表数据
     *
     * @param page          分页查询
     * @param queryUserInfo UserInfo查询条件
     * @return UserInfo集合
     * @throws Exception 抛出异常
     */
    IPage<UserInfo> getRecoverPage(IPage page, @Param("queryUserInfo") UserInfo queryUserInfo) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统用户信息表数据
     *
     * @param id 系统用户信息表主键
     * @throws Exception 抛出异常
     */
    @Update("update auth_user_info set deleted = 0 where id = #{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过系统用户信息表主键彻底删除系统用户信息表数据
     *
     * @param id 系统用户信息表主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from auth_user_info where id = #{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;

}
