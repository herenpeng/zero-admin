package com.zero.auth.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.LoginLog;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 系统账号登录日志表的Mapper接口
 *
 * @author herenpeng
 * @since 2021-02-17 10:04
 */
@Mapper
@Repository
public interface LoginLogMapper extends BaseMapper<LoginLog> {

    /**
     * 分页查询系统账号登录日志表数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page      分页查询
     * @param queryLoginLog LoginLog查询条件
     * @return LoginLog集合
     * @throws Exception 抛出异常
     */
    IPage<LoginLog> getPage(IPage page, @Param("queryLoginLog") LoginLog queryLoginLog) throws Exception;

    /**
     * 获取所有的系统账号登录日志表数据，区别于selectList的是，该方法添加了查询条件
     *
     * @param queryLoginLog LoginLog查询条件
     * @return LoginLog集合
     * @throws Exception 抛出异常
     */
    List<LoginLog> getList(@Param("queryLoginLog") LoginLog queryLoginLog) throws Exception;

    /**
     * 分页查询逻辑删除的系统账号登录日志表数据
     *
     * @param page      分页查询
     * @param queryLoginLog LoginLog查询条件
     * @return LoginLog集合
     * @throws Exception 抛出异常
     */
    IPage<LoginLog> getRecoverPage(IPage page, @Param("queryLoginLog") LoginLog queryLoginLog) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统账号登录日志表数据
     *
     * @param id 系统账号登录日志表主键
     * @throws Exception 抛出异常
     */
    @Update("update auth_login_log set deleted = 0 where id = #{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过系统账号登录日志表主键彻底删除系统账号登录日志表数据
     *
     * @param id 系统账号登录日志表主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from auth_login_log where id = #{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;

}
