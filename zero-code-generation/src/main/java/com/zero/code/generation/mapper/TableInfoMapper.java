package com.zero.code.generation.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.code.generation.entity.TableInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 系统数据库表信息Mapper接口
 *
 * @author herenpeng
 * @since 2020-11-08 17:53
 */
@Mapper
@Repository
public interface TableInfoMapper extends BaseMapper<TableInfo> {

    /**
     * 分页获取数据库表信息数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page           分页查询
     * @param queryTableInfo 数据库表信息查询条件
     * @return 数据库表信息集合
     * @throws Exception 抛出异常
     */
    IPage<TableInfo> getPage(IPage page, @Param("queryTableInfo") TableInfo queryTableInfo) throws Exception;

    /**
     * 获取数据的所有表信息
     *
     * @return
     * @throws Exception
     */
    List<TableInfo> getTableInfoListByInformationSchema() throws Exception;


    /**
     * 获取没有添加到table_info表中的数据库表信息
     *
     * @return
     * @throws Exception
     */
    List<TableInfo> getNotAddList() throws Exception;


}
