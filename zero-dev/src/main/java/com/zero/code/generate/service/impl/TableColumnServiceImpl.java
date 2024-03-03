package com.zero.code.generate.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.code.generate.entity.TableColumn;
import com.zero.code.generate.entity.TableInfo;
import com.zero.code.generate.kit.DataBaseTypeKit;
import com.zero.code.generate.mapper.TableColumnMapper;
import com.zero.code.generate.mapper.TableInfoMapper;
import com.zero.code.generate.service.TableColumnService;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.exception.AppException;
import com.zero.common.exception.AppExceptionEnum;
import com.zero.common.kit.CamelCaseKit;
import com.zero.common.kit.ExcelKit;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

    private final TableInfoMapper tableInfoMapper;

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
    public void synchron(Integer tableInfoId) throws Exception {
        TableInfo tableInfo = tableInfoMapper.selectById(tableInfoId);
        if (tableInfo == null) {
            throw new AppException(AppExceptionEnum.TABLE_INFO_NOT_EXIST);
        }
        List<TableColumn> list = new ArrayList<>();
        List<TableColumn> tableColumnList = baseMapper.getTableColumnByInformationSchema(tableInfo.getName());
        List<TableColumn> tableColumns = baseMapper.getByTableInfoId(tableInfoId);
        Map<String, TableColumn> columnMap = tableColumns.stream().collect(Collectors.toMap(TableColumn::getName, v -> v));
        for (TableColumn tableColumn : tableColumnList) {
            tableColumn.setTableInfoId(tableInfo.getId());
            tableColumn.setJavaName(CamelCaseKit.toCamelCase(tableColumn.getName()));
            tableColumn.setJdbcType(DataBaseTypeKit.getJdbcType(tableColumn.getDatabaseType()));
            tableColumn.setJavaType(DataBaseTypeKit.getJavaType(tableColumn.getDatabaseType()));
            TableColumn column = columnMap.remove(tableColumn.getName());
            if (column != null) {
                tableColumn.setId(column.getId());
            }
            list.add(tableColumn);
        }
        if (!list.isEmpty()) {
            saveOrUpdateBatch(list);
        }
        if (!columnMap.isEmpty()) {
            baseMapper.deleteBatchIds(columnMap.values().stream().map(TableColumn::getId).collect(Collectors.toList()));
        }
    }


    @Override
    public void exportExcel(TableColumn queryTableColumn, HttpServletResponse response) throws Exception {
        List<TableColumn> exportData = list(queryTableColumn);
        ExcelKit.exportExcel("系统数据库表字段信息表", TableColumn.class, exportData, response);
    }

}