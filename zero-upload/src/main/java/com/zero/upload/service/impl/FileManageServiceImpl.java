package com.zero.upload.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.mapper.UserMapper;
import com.zero.auth.security.jwt.util.JwtUtils;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.upload.entity.FileManage;
import com.zero.upload.mapper.FileManageMapper;
import com.zero.upload.properties.FileUpload;
import com.zero.upload.properties.UploadProperties;
import com.zero.upload.service.FileManageService;
import com.zero.upload.util.UploadUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Date;
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

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private JwtUtils jwtUtils;

    @Autowired
    private UploadProperties uploadProperties;

    @Autowired
    private UploadUtils uploadUtils;

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

    @Override
    public void bak(Integer id) throws Exception {
        FileManage fileManage = baseMapper.selectById(id);
        FileUpload fileUpload = uploadProperties.getImage();
        // 创建一个备份文件对象
        FileManage bakFile = new FileManage();
        bakFile.setParentId(fileManage.getId());
        bakFile.setName(fileManage.getName());
        bakFile.setType(fileManage.getType());
        bakFile.setUploadTime(new Date());
        bakFile.setUploadUserId(jwtUtils.getUserId(request));
        // 源文件磁盘路径
        String path = fileManage.getPath();
        // 获取源文件
        File srcFile = new File(path);
        // 获取源文件名称
        String name = srcFile.getName();
        String bakFileName = uploadUtils.generateBakFileName(name, baseMapper.countByParentId(id));
        // 设置备份文件磁盘路径
        bakFile.setPath(uploadUtils.generateFilePath(fileUpload, bakFileName));
        // 设置备份文件http引用路径
        bakFile.setUri(uploadUtils.generateFileUri(fileUpload, bakFileName));
        baseMapper.insert(bakFile);
        File destFile = new File(bakFile.getPath());
        FileUtils.copyFile(srcFile, destFile);
    }

}