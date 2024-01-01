package com.zero.upload.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.base.service.BaseService;
import com.zero.upload.entity.FileManage;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 文件资源管理表业务逻辑层接口
 *
 * @author herenpeng
 * @since 2021-01-30 18:46
 */
public interface FileManageService extends BaseService<FileManage> {

    /**
     * 分页查询文件资源管理表数据
     *
     * @param currentPage     当前页面数，页面从1开始
     * @param size            当前页的大小，默认为10
     * @param queryFileManage 查询文件资源管理表的条件
     * @return 分页查询所有的文件资源管理表数据
     * @throws Exception 抛出异常
     */
    IPage<FileManage> page(Integer currentPage, Integer size, FileManage queryFileManage) throws Exception;

    /**
     * 查询所有的文件资源管理表数据
     *
     * @param queryFileManage 查询文件资源管理表的条件
     * @return 查询所有的文件资源管理表数据
     * @throws Exception 抛出异常
     */
    List<FileManage> list(FileManage queryFileManage) throws Exception;

    /**
     * 分页查询逻辑删除的文件资源管理表数据
     *
     * @param currentPage     当前页面数，页面从1开始
     * @param size            当前页的大小，默认为10
     * @param queryFileManage 查询文件资源管理表的条件
     * @return 分页查询逻辑删除的文件资源管理表数据
     * @throws Exception 抛出异常
     */
    IPage<FileManage> recoverPage(Integer currentPage, Integer size, FileManage queryFileManage) throws Exception;

    /**
     * 通过主键恢复逻辑删除的文件资源管理表数据
     *
     * @param id 文件资源管理表主键
     * @throws Exception 抛出异常
     */
    void recover(Integer id) throws Exception;

    /**
     * 回收站删除，通过文件资源管理表主键彻底删除文件资源管理表数据
     *
     * @param id 文件资源管理表主键
     * @throws Exception 抛出异常
     */
    void recoverDelete(Integer id) throws Exception;

    /**
     * 导出文件资源管理表列表数据的Excel文件
     *
     * @param queryFileManage 查询文件资源管理表的条件
     * @param response        HttpServletResponse对象
     * @throws Exception 抛出异常
     */
    void exportExcel(FileManage queryFileManage, HttpServletResponse response) throws Exception;

    /**
     * 通过主键备份一个文件资源
     *
     * @param id 文件资源管理表主键
     * @throws Exception 抛出异常
     */
    void bak(Integer id) throws Exception;

    /**
     * 通过主键替换一个文件资源
     *
     * @param id   文件资源管理表主键
     * @param file 文件资源
     * @throws Exception 抛出异常
     */
    void replace(Integer id, MultipartFile file) throws Exception;
}
