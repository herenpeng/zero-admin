package com.zero.upload.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.mapper.UserMapper;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.kit.ExcelKit;
import com.zero.upload.entity.FileManage;
import com.zero.upload.mapper.FileManageMapper;
import com.zero.upload.service.FileManageService;
import com.zero.upload.util.UploadUtils;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

/**
 * 文件资源管理表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2021-01-30 18:46
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class FileManageServiceImpl extends BaseServiceImpl<FileManageMapper, FileManage> implements FileManageService {

    private final UserMapper userMapper;

    private final UploadUtils uploadUtils;

    @Override
    public IPage<FileManage> page(Integer currentPage, Integer size, FileManage queryFileManage) throws Exception {
        IPage<FileManage> page = new Page<>(currentPage, size);
        IPage<FileManage> pageInfo = baseMapper.getPage(page, queryFileManage);
        for (FileManage fileManage : pageInfo.getRecords()) {
            fileManage.setUser(userMapper.selectById(fileManage.getUploadUserId()));
            fileManage.setBakFiles(baseMapper.getByParentId(fileManage.getId()));
            for (FileManage backupFile : fileManage.getBakFiles()) {
                backupFile.setUser(userMapper.selectById(backupFile.getUploadUserId()));
            }
        }
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
        for (FileManage fileManage : pageInfo.getRecords()) {
            fileManage.setUser(userMapper.selectById(fileManage.getUploadUserId()));
        }
        return pageInfo;
    }

    @Override
    public void recover(Integer id) throws Exception {
        baseMapper.recoverById(id);
    }

    @Override
    public void recoverDelete(Integer id) throws Exception {
        FileManage fileManage = baseMapper.selectRecoverById(id);
        String path = fileManage.getPath();
        FileUtils.forceDelete(new File(path));
        baseMapper.recoverDelete(id);
    }

    @Override
    public void exportExcel(FileManage queryFileManage, HttpServletResponse response) throws Exception {
        List<FileManage> exportData = list(queryFileManage);
        ExcelKit.exportExcel("文件资源管理表", FileManage.class, exportData, response);
    }

    @Override
    public void bak(Integer id) throws Exception {
        FileManage fileManage = baseMapper.selectById(id);
        // 统计源文件已有的备份文件个数
        Integer bakCount = baseMapper.countByParentId(id);
        // 备份文件
        uploadUtils.bakFile(fileManage, bakCount);
    }

    @Override
    public void replace(Integer id, MultipartFile file) throws Exception {
        FileManage fileManage = baseMapper.selectById(id);
        String path = fileManage.getPath();
        File oldFile = new File(path);
        // 如果旧文件存在，先将旧文件删除
        if (oldFile.exists()) {
            log.info("[文件管理功能]删除文件：{}", oldFile.getPath());
            FileUtils.forceDelete(oldFile);
        }
        System.out.println(file.getOriginalFilename());
        file.transferTo(new File(path));
    }

}