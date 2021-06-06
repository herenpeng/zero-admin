package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.sys.entity.UserConfig;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 系统用户配置表的Mapper接口
 *
 * @author herenpeng
 * @since 2021-06-06 18:28
 */
@Mapper
@Repository
public interface UserConfigMapper extends BaseMapper<UserConfig> {

    /**
     * 分页查询系统用户配置表数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page            分页查询
     * @param queryUserConfig UserConfig查询条件
     * @return UserConfig集合
     * @throws Exception 抛出异常
     */
    IPage<UserConfig> getPage(IPage page, @Param("queryUserConfig") UserConfig queryUserConfig) throws Exception;

    /**
     * 获取所有的系统用户配置表数据，区别于selectList的是，该方法添加了查询条件
     *
     * @param queryUserConfig UserConfig查询条件
     * @return UserConfig集合
     * @throws Exception 抛出异常
     */
    List<UserConfig> getList(@Param("queryUserConfig") UserConfig queryUserConfig) throws Exception;

    /**
     * 通过用户主键和配置主键定位用户配置的信息
     *
     * @param userId   用户主键
     * @param configId 配置主键
     * @return 用户配置
     * @throws Exception 抛出异常
     */
    UserConfig getByUserIdAndConfigId(@Param("userId") Integer userId, @Param("configId") Integer configId) throws Exception;

    /**
     * 分页查询逻辑删除的系统用户配置表数据
     *
     * @param page            分页查询
     * @param queryUserConfig UserConfig查询条件
     * @return UserConfig集合
     * @throws Exception 抛出异常
     */
    IPage<UserConfig> getRecoverPage(IPage page, @Param("queryUserConfig") UserConfig queryUserConfig) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统用户配置表数据
     *
     * @param id 系统用户配置表主键
     * @throws Exception 抛出异常
     */
    @Update("update sys_user_config set deleted = 0 where id = #{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过系统用户配置表主键彻底删除系统用户配置表数据
     *
     * @param id 系统用户配置表主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from sys_user_config where id = #{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;

}
