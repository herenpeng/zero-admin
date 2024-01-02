package com.zero.code.generation.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.code.generation.entity.TableColumn;
import com.zero.code.generation.entity.TableInfo;
import com.zero.code.generation.mapper.TableColumnMapper;
import com.zero.code.generation.mapper.TableInfoMapper;
import com.zero.code.generation.service.TableInfoService;
import com.zero.code.generation.util.CodeGenerationKit;
import com.zero.code.generation.util.DataBaseTypeKit;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.kit.CamelCaseKit;
import lombok.RequiredArgsConstructor;
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
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class TableInfoServiceImpl extends BaseServiceImpl<TableInfoMapper, TableInfo> implements TableInfoService {

    private final TableInfoMapper tableInfoMapper;
    private final TableColumnMapper tableColumnMapper;

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

    @Override
    public boolean save(TableInfo tableInfo) {
        boolean result = super.save(tableInfo);
        List<TableColumn> tableColumnList = tableColumnMapper.getTableColumnByInformationSchema(tableInfo.getName());
        for (TableColumn tableColumn : tableColumnList) {
            tableColumn.setTableInfoId(tableInfo.getId());
            tableColumn.setJavaName(CamelCaseKit.toCamelCase(tableColumn.getName()));
            tableColumn.setJdbcType(DataBaseTypeKit.getJdbcType(tableColumn.getDatabaseType()));
            tableColumn.setJavaType(DataBaseTypeKit.getJavaType(tableColumn.getDatabaseType()));
            tableColumnMapper.insert(tableColumn);
        }
        return result;
    }

    @Override
    public void codeGeneration(Integer id) throws Exception {
        TableInfo tableInfo = tableInfoMapper.selectById(id);
        List<TableColumn> tableColumnList = tableColumnMapper.getByTableInfoId(tableInfo.getId());
        tableInfo.setTableColumnList(tableColumnList);
        CodeGenerationKit.generation(tableInfo);
    }

    @Override
    public IPage<TableInfo> recoverPage(Integer currentPage, Integer size, TableInfo queryTableInfo) throws Exception {
        Page page = new Page(currentPage, size);
        IPage<TableInfo> pageInfo = baseMapper.getRecoverPage(page, queryTableInfo);
        return pageInfo;
    }

    @Override
    public void recover(Integer id) throws Exception {
        baseMapper.recoverById(id);
    }

    @Override
    public void recoverDelete(Integer id) throws Exception {
        baseMapper.recoverDelete(id);
        tableColumnMapper.deleteByTableInfoId(id);
    }
}
