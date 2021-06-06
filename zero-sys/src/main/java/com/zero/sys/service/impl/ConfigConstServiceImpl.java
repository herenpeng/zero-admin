package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.sys.entity.ConfigConst;
import com.zero.sys.mapper.ConfigConstMapper;
import com.zero.sys.service.ConfigConstService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统配置常量表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2021-06-05 22:29
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class ConfigConstServiceImpl extends BaseServiceImpl<ConfigConstMapper, ConfigConst> implements ConfigConstService {

    @Override
    public IPage<ConfigConst> page(Integer currentPage, Integer size, ConfigConst queryConfigConst) throws Exception {
        IPage<ConfigConst> page = new Page<>(currentPage, size);
        IPage<ConfigConst> pageInfo = baseMapper.getPage(page, queryConfigConst);
        return pageInfo;
    }

    @Override
    public List<ConfigConst> list(ConfigConst queryConfigConst) throws Exception {
        QueryWrapper<ConfigConst> queryWrapper = new QueryWrapper<>(queryConfigConst);
        List<ConfigConst> configConstList = baseMapper.selectList(queryWrapper);
        return configConstList;
    }

    @Override
    public List<String> getKeyList(String key) throws Exception {
        return baseMapper.getKeyList(key);
    }

    @Override
    public IPage<ConfigConst> recoverPage(Integer currentPage, Integer size, ConfigConst queryConfigConst) throws Exception {
        IPage<ConfigConst> page = new Page<>(currentPage, size);
        IPage<ConfigConst> pageInfo = baseMapper.getRecoverPage(page, queryConfigConst);
        return pageInfo;
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
    public void exportExcel(ConfigConst queryConfigConst, HttpServletResponse response) throws Exception {
        List<ConfigConst> exportData = list(queryConfigConst);
        excelUtils.exportExcel("系统配置常量表", ConfigConst.class, exportData, response);
    }

}