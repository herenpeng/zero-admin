package com.zero.upload.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.upload.entity.FileManage;
import com.zero.upload.mapper.FileManageMapper;
import com.zero.upload.service.FileManageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 文件资源管理表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2021-01-30 18:46
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class FileManageServiceImpl extends BaseServiceImpl<FileManageMapper, FileManage> implements FileManageService {

    @Override
    public IPage<FileManage> page(Integer currentPage, Integer size, FileManage queryFileManage) throws Exception {
        IPage<FileManage> page = new Page<>(currentPage, size);
        IPage<FileManage> pageInfo = baseMapper.getPage(page, queryFileManage);
        return pageInfo;
    }

    @Override
    public List<FileManage> list(FileManage queryFileManage) throws Exception {
        return baseMapper.getList(queryFileManage);
    }

    @Override
    public IPage<FileManage> recoverPage(Integer currentPage, Integer size, FileManage queryFileManage) throws Exception {
        IPage<FileManage> page = new Page<>(currentPage, size);
        IPage<FileManage> pageInfo = baseMapper.getRecoverPage(page, queryFileManage);
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
    public void exportExcel(FileManage queryFileManage, HttpServletResponse response) throws Exception {
        List<FileManage> exportData = list(queryFileManage);
        excelUtils.exportExcel("文件资源管理表", FileManage.class, exportData, response);
    }

}