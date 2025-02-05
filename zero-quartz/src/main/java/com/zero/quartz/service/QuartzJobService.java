package com.zero.quartz.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import com.zero.quartz.entity.QuartzJob;
import jakarta.servlet.http.HttpServletResponse;

import java.util.List;

/**
 * 定时任务表业务逻辑层接口
 *
 * @author root
 * @since 2025-02-05 21:36
 */
public interface QuartzJobService extends BaseService<QuartzJob> {

    /**
     * 分页查询定时任务表数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryQuartzJob  查询定时任务表的条件
     * @return 分页查询所有的定时任务表数据
     * @throws Exception 抛出异常
     */
    IPage<QuartzJob> page(Integer currentPage, Integer size, QuartzJob queryQuartzJob) throws Exception;

    /**
     * 查询所有的定时任务表数据
     *
     * @param queryQuartzJob 查询定时任务表的条件
     * @return 查询所有的定时任务表数据
     * @throws Exception 抛出异常
     */
    List<QuartzJob> list(QuartzJob queryQuartzJob) throws Exception;


    /**
     * 分页查询逻辑删除的定时任务表数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @param queryQuartzJob  查询定时任务表的条件
     * @return 分页查询逻辑删除的定时任务表数据
     * @throws Exception 抛出异常
     */
    IPage<QuartzJob> recoverPage(Integer currentPage, Integer size, QuartzJob queryQuartzJob) throws Exception;

    /**
     * 通过主键恢复逻辑删除的定时任务表数据
     *
     * @param id 定时任务表主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过定时任务表主键彻底删除定时任务表数据
     *
     * @param id 定时任务表主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;

    /**
     * 导出定时任务表列表数据的Excel文件
     *
     * @param queryQuartzJob 查询定时任务表的条件
     * @param response  HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(QuartzJob queryQuartzJob, HttpServletResponse response) throws Exception;

}
