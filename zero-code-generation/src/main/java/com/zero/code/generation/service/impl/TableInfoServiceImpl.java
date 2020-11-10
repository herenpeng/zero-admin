package com.zero.code.generation.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.code.generation.domain.TableInfo;
import com.zero.code.generation.mapper.TableInfoMapper;
import com.zero.code.generation.service.TableInfoService;
import com.zero.common.service.impl.BaseServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 系统数据库表信息业务层实现
 *
 * @author herenpeng
 * @since 2020-11-08 20:29
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class TableInfoServiceImpl extends BaseServiceImpl<TableInfoMapper, TableInfo> implements TableInfoService {

    @Override
    public IPage<TableInfo> page(Integer currentPage, Integer size, TableInfo queryTableInfo) throws Exception {
        Page page = new Page(currentPage, size);
        IPage<TableInfo> pageInfo = baseMapper.getPage(page, queryTableInfo);
        return pageInfo;
    }

    @Override
    public List<TableInfo> getNotAddList() throws Exception {
        return baseMapper.getNotAddList();
    }
}
