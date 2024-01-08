package com.zero.code.generation.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.code.generation.entity.TableColumn;
import com.zero.code.generation.mapper.TableColumnMapper;
import com.zero.code.generation.service.TableColumnService;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.kit.ExcelKit;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 系统数据库表字段信息表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2021-03-28 18:11
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class TableColumnServiceImpl extends BaseServiceImpl<TableColumnMapper, TableColumn> implements TableColumnService {

    @Override
    public IPage<TableColumn> page(Integer currentPage, Integer size, TableColumn queryTableColumn) throws Exception {
        IPage<TableColumn> page = new Page<>(currentPage, size);
        QueryWrapper<TableColumn> queryWrapper = new QueryWrapper<>(queryTableColumn);
        return baseMapper.selectPage(page, queryWrapper);
    }

    @Override
    public List<TableColumn> list(TableColumn queryTableColumn) throws Exception {
        QueryWrapper<TableColumn> queryWrapper = new QueryWrapper<>(queryTableColumn);
        return baseMapper.selectList(queryWrapper);
    }

    @Override
    public IPage<TableColumn> recoverPage(Integer currentPage, Integer size, TableColumn queryTableColumn) throws Exception {
        queryTableColumn.setDeleted(true);
        IPage<TableColumn> page = new Page<>(currentPage, size);
        return baseMapper.getPage(page, queryTableColumn);
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
    public List<TableColumn> getByTableInfoId(Integer tableInfoId) throws Exception {
        return baseMapper.getByTableInfoId(tableInfoId);
    }

    @Override
    public void exportExcel(TableColumn queryTableColumn, HttpServletResponse response) throws Exception {
        List<TableColumn> exportData = list(queryTableColumn);
        ExcelKit.exportExcel("系统数据库表字段信息表", TableColumn.class, exportData, response);
    }

}