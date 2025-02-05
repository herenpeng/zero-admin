package com.zero.quartz.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.quartz.entity.QuartzJob;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 定时任务表的Mapper接口
 *
 * @author root
 * @since 2025-02-05 21:36
 */
@Mapper
@Repository
public interface QuartzJobMapper extends BaseMapper<QuartzJob> {

    /**
     * 分页查询定时任务表数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page      分页查询
     * @param queryQuartzJob QuartzJob查询条件
     * @return QuartzJob集合
     * @throws Exception 抛出异常
     */
    IPage<QuartzJob> getPage(IPage<QuartzJob> page, @Param("queryQuartzJob") QuartzJob queryQuartzJob) throws Exception;

    /**
     * 获取所有的定时任务表数据，区别于selectList的是，该方法添加了查询条件
     *
     * @param queryQuartzJob QuartzJob查询条件
     * @return QuartzJob集合
     * @throws Exception 抛出异常
     */
    List<QuartzJob> getList(@Param("queryQuartzJob") QuartzJob queryQuartzJob) throws Exception;


    /**
     * 通过主键恢复逻辑删除的定时任务表数据
     *
     * @param id 定时任务表主键
     * @throws Exception 抛出异常
     */
    @Update("update quartz_job set deleted = 0 where id = #{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过定时任务表主键彻底删除定时任务表数据
     *
     * @param id 定时任务表主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from quartz_job where id = #{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;

}
