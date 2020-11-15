package com.zero.code.generation.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zero.code.generation.entity.TableColumn;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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


}
