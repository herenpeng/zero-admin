package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.sys.domain.Log;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 系统操作日志Mapper接口
 *
 * @author herenpeng
 * @since 2020-10-27 23:23
 */
@Mapper
@Repository
public interface LogMapper extends BaseMapper<Log> {

    /**
     * 分页查询操作日志
     *
     * @param page     分页查询
     * @param queryLog 查询条件
     * @return 分页操作日志数据
     * @throws Exception 抛出异常
     */
    IPage<Log> getPage(Page page, @Param("queryLog") Log queryLog) throws Exception;
}
