package com.zero.code.generation.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.code.generation.entity.TableColumn;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 数据库表字段信息Mapper接口
 *
 * @author herenpeng
 * @since 2020-11-12 22:39
 */
@Mapper
@Repository
public interface TableColumnMapper extends BaseMapper<TableColumn> {

    /**
     * 获取数据表的所有字段信息
     *
     * @param tableName 表名
     * @return 表字段信息
     * @throws Exception 抛出异常
     */
    List<TableColumn> getTableColumnByInformationSchema(@Param("tableName") String tableName);

    /**
     * 通过tableInfoId查找表对应的所有字段信息
     *
     * @param tableInfoId 表信息主键
     * @return 表字段信息
     * @throws Exception 抛出异常
     */
    List<TableColumn> getByTableInfoId(@Param("tableInfoId") Integer tableInfoId) throws Exception;

    /**
     * 通过数据库表主键彻底删除表对应的字段信息
     *
     * @param tableInfoId 数据库表主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from dev_table_column where table_info_id = #{tableInfoId}")
    void deleteByTableInfoId(@Param("tableInfoId") Integer tableInfoId) throws Exception;


    /**
     * 分页查询系统数据库表字段信息表数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page             分页查询
     * @param queryTableColumn TableColumn查询条件
     * @return TableColumn集合
     * @throws Exception 抛出异常
     */
    IPage<TableColumn> getPage(IPage page, @Param("queryTableColumn") TableColumn queryTableColumn) throws Exception;

    /**
     * 获取所有的系统数据库表字段信息表数据，区别于selectList的是，该方法添加了查询条件
     *
     * @param queryTableColumn TableColumn查询条件
     * @return TableColumn集合
     * @throws Exception 抛出异常
     */
    List<TableColumn> getList(@Param("queryTableColumn") TableColumn queryTableColumn) throws Exception;


    /**
     * 通过主键恢复逻辑删除的系统数据库表字段信息表数据
     *
     * @param id 系统数据库表字段信息表主键
     * @throws Exception 抛出异常
     */
    @Update("update dev_table_column set deleted = 0 where id = #{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过系统数据库表字段信息表主键彻底删除系统数据库表字段信息表数据
     *
     * @param id 系统数据库表字段信息表主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from dev_table_column where id = #{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;


}
