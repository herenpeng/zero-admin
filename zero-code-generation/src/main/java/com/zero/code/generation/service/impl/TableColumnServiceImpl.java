package com.zero.code.generation.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.code.generation.entity.TableColumn;
import com.zero.code.generation.mapper.TableColumnMapper;
import com.zero.code.generation.service.TableColumnService;
import com.zero.common.base.service.impl.BaseServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
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
        IPage<TableColumn> pageInfo = baseMapper.selectPage(page, queryWrapper);
        return pageInfo;
    }

    @Override
    public List<TableColumn> list(TableColumn queryTableColumn) throws Exception {
        QueryWrapper<TableColumn> queryWrapper = new QueryWrapper<>(queryTableColumn);
        List<TableColumn> tableColumnList = baseMapper.selectList(queryWrapper);
        return tableColumnList;
    }

    @Override
    public IPage<TableColumn> recoverPage(Integer currentPage, Integer size, TableColumn queryTableColumn) throws Exception {
        IPage<TableColumn> page = new Page<>(currentPage, size);
        IPage<TableColumn> pageInfo = baseMapper.getRecoverPage(page, queryTableColumn);
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
    public List<TableColumn> getByTableInfoId(Integer tableInfoId) throws Exception {
        return baseMapper.getByTableInfoId(tableInfoId);
    }

    @Override
    public void exportExcel(TableColumn queryTableColumn, HttpServletResponse response) throws Exception {
        List<TableColumn> exportData = list(queryTableColumn);
        excelUtils.exportExcel("系统数据库表字段信息表", TableColumn.class, exportData, response);
    }

}