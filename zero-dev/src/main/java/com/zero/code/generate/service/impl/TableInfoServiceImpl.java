package com.zero.code.generate.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.code.generate.entity.TableColumn;
import com.zero.code.generate.entity.TableInfo;
import com.zero.code.generate.mapper.TableColumnMapper;
import com.zero.code.generate.mapper.TableInfoMapper;
import com.zero.code.generate.service.TableInfoService;
import com.zero.code.generate.kit.CodeGenerateKit;
import com.zero.code.generate.kit.DataBaseTypeKit;
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
        return page(currentPage, size, queryTableInfo, false);
    }

    private IPage<TableInfo> page(Integer currentPage, Integer size, TableInfo queryTableInfo, Boolean deleted) throws Exception {
        queryTableInfo.setDeleted(deleted);
        IPage<TableInfo> page = new Page<>(currentPage, size);
        return baseMapper.getPage(page, queryTableInfo);
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
    public void codeGenerate(Integer id) throws Exception {
        TableInfo tableInfo = tableInfoMapper.selectById(id);
        List<TableColumn> tableColumnList = tableColumnMapper.getByTableInfoId(tableInfo.getId());
        tableInfo.setTableColumnList(tableColumnList);
        CodeGenerateKit.generate(tableInfo);
    }

    @Override
    public IPage<TableInfo> recoverPage(Integer currentPage, Integer size, TableInfo queryTableInfo) throws Exception {
        return page(currentPage, size, queryTableInfo, true);
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
