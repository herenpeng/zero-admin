package com.zero.upload.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.upload.entity.FileManage;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 文件资源管理表的Mapper接口
 *
 * @author herenpeng
 * @since 2021-01-30 18:46
 */
@Mapper
@Repository
public interface FileManageMapper extends BaseMapper<FileManage> {

    /**
     * 分页查询文件资源管理表数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page            分页查询
     * @param queryFileManage FileManage查询条件
     * @return FileManage集合
     * @throws Exception 抛出异常
     */
    IPage<FileManage> getPage(IPage page, @Param("queryFileManage") FileManage queryFileManage) throws Exception;

    /**
     * 获取所有的文件资源管理表数据，区别于selectList的是，该方法添加了查询条件
     *
     * @param queryFileManage FileManage查询条件
     * @return FileManage集合
     * @throws Exception 抛出异常
     */
    List<FileManage> getList(@Param("queryFileManage") FileManage queryFileManage) throws Exception;

    /**
     * 分页查询逻辑删除的文件资源管理表数据
     *
     * @param page            分页查询
     * @param queryFileManage FileManage查询条件
     * @return FileManage集合
     * @throws Exception 抛出异常
     */
    IPage<FileManage> getRecoverPage(IPage page, @Param("queryFileManage") FileManage queryFileManage) throws Exception;

    /**
     * 通过主键恢复逻辑删除的文件资源管理表数据
     *
     * @param id 文件资源管理表主键
     * @throws Exception 抛出异常
     */
    @Update("update upload_file_manage set deleted = 0 where id = #{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过文件资源管理表主键彻底删除文件资源管理表数据
     *
     * @param id 文件资源管理表主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from upload_file_manage where id = #{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;

    /**
     * 通过父主键，获取原文件的备份文件集合
     *
     * @param parentId 文件主键Id
     * @return 文件的备份文件
     * @throws Exception 抛出异常
     */
    List<FileManage> getByParentId(@Param("parentId") Integer parentId) throws Exception;
}
