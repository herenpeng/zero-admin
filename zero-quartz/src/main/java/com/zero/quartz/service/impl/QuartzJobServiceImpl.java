package com.zero.quartz.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.kit.ExcelKit;
import com.zero.quartz.entity.QuartzJob;
import com.zero.quartz.mapper.QuartzJobMapper;
import com.zero.quartz.service.QuartzJobService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 定时任务表业务逻辑层的实现类
 *
 * @author root
 * @since 2025-02-05 21:36
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class QuartzJobServiceImpl extends BaseServiceImpl<QuartzJobMapper, QuartzJob> implements QuartzJobService {

    @Override
    public IPage<QuartzJob> page(Integer currentPage, Integer size, QuartzJob queryQuartzJob) throws Exception {
        return page(currentPage, size, queryQuartzJob, false);
    }

    private IPage<QuartzJob> page(Integer currentPage, Integer size, QuartzJob queryQuartzJob, Boolean deleted) throws Exception {
        queryQuartzJob.setDeleted(deleted);
        IPage<QuartzJob> page = new Page<>(currentPage, size);
        return baseMapper.getPage(page, queryQuartzJob);
    }


    @Override
    public List<QuartzJob> list(QuartzJob queryQuartzJob) throws Exception {
        QueryWrapper<QuartzJob> queryWrapper = new QueryWrapper<>(queryQuartzJob);
        return baseMapper.selectList(queryWrapper);
    }




    @Override
    public IPage<QuartzJob> recoverPage(Integer currentPage, Integer size, QuartzJob queryQuartzJob) throws Exception {
        return page(currentPage, size, queryQuartzJob, true);
    }

    @Override
    public void recover(Integer id) throws Exception {
        baseMapper.recoverById(id);
    }

    @Override
    public void recoverDelete(Integer id) throws Exception {
        baseMapper.recoverDelete(id);
    }

    @Override
    public void exportExcel(QuartzJob queryQuartzJob, HttpServletResponse response) throws Exception {
        List<QuartzJob> exportData = list(queryQuartzJob);
        ExcelKit.exportExcel("定时任务表", QuartzJob.class, exportData, response);
    }

}