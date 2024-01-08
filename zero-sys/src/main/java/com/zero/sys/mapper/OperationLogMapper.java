package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.sys.entity.OperationLog;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 系统操作日志表的Mapper接口
 *
 * @author herenpeng
 * @since 2020-12-01 22:31
 */
@Mapper
@Repository
public interface OperationLogMapper extends BaseMapper<OperationLog> {

    /**
     * 分页查询系统操作日志表数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page              分页查询
     * @param queryOperationLog OperationLog查询条件
     * @return OperationLog集合
     * @throws Exception 抛出异常
     */
    IPage<OperationLog> getPage(IPage page, @Param("queryOperationLog") OperationLog queryOperationLog) throws Exception;

    /**
     * 获取所有的系统操作日志表数据，区别于selectList的是，该方法添加了查询条件
     *
     * @param queryOperationLog OperationLog查询条件
     * @return OperationLog集合
     * @throws Exception 抛出异常
     */
    List<OperationLog> getList(@Param("queryOperationLog") OperationLog queryOperationLog) throws Exception;


    /**
     * 通过主键恢复逻辑删除的系统操作日志表数据
     *
     * @param id 系统操作日志表主键
     * @throws Exception 抛出异常
     */
    @Update("update sys_operation_log set deleted = 0 where id = #{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过系统操作日志表主键彻底删除系统操作日志表数据
     *
     * @param id 系统操作日志表主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from sys_operation_log where id = #{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;

}
