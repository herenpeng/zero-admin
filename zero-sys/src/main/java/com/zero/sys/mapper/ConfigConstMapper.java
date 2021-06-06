package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.sys.entity.ConfigConst;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 系统配置常量表的Mapper接口
 *
 * @author herenpeng
 * @since 2021-06-05 22:29
 */
@Mapper
@Repository
public interface ConfigConstMapper extends BaseMapper<ConfigConst> {

    /**
     * 分页查询系统配置常量表数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page             分页查询
     * @param queryConfigConst ConfigConst查询条件
     * @return ConfigConst集合
     * @throws Exception 抛出异常
     */
    IPage<ConfigConst> getPage(IPage page, @Param("queryConfigConst") ConfigConst queryConfigConst) throws Exception;

    /**
     * 获取所有的系统配置常量表数据，区别于selectList的是，该方法添加了查询条件
     *
     * @param queryConfigConst ConfigConst查询条件
     * @return ConfigConst集合
     * @throws Exception 抛出异常
     */
    List<ConfigConst> getList(@Param("queryConfigConst") ConfigConst queryConfigConst) throws Exception;

    /**
     * 通过 key 值模糊查询所有的 Key
     *
     * @param key key 值
     * @return
     * @throws Exception
     */
    List<String> getKeyList(@Param("key") String key) throws Exception;

    /**
     * 分页查询逻辑删除的系统配置常量表数据
     *
     * @param page             分页查询
     * @param queryConfigConst ConfigConst查询条件
     * @return ConfigConst集合
     * @throws Exception 抛出异常
     */
    IPage<ConfigConst> getRecoverPage(IPage page, @Param("queryConfigConst") ConfigConst queryConfigConst) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统配置常量表数据
     *
     * @param id 系统配置常量表主键
     * @throws Exception 抛出异常
     */
    @Update("update sys_config_const set deleted = 0 where id = #{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过系统配置常量表主键彻底删除系统配置常量表数据
     *
     * @param id 系统配置常量表主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from sys_config_const where id = #{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;

}
