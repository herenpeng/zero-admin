package com.zero.auth.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.Resources;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 系统资源的Mapper接口
 *
 * @author herenpeng
 * @since 2020-09-07 22:38
 */
@Mapper
@Repository
public interface ResourcesMapper extends BaseMapper<Resources> {

    /**
     * 分页获取系统资源数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page           分页查询
     * @param queryResources 系统资源查询条件
     * @return 系统资源集合
     * @throws Exception 抛出异常
     */
    IPage<Resources> getPage(IPage<Resources> page, @Param("queryResources") Resources queryResources) throws Exception;

    /**
     * 查询所有的系统资源数据
     *
     * @param queryResources 系统资源查询条件
     * @return 系统资源集合
     * @throws Exception 抛出异常
     */
    List<Resources> getList(@Param("queryResources") Resources queryResources) throws Exception;

    /**
     * 通过uri匹配获取对应的资源
     *
     * @param uri        请求路径
     * @param methodType 方法类型
     * @return 返回资源信息
     * @throws Exception 抛出异常
     */
    Resources getByUriAndMethodType(@Param("uri") String uri, @Param("methodType") String methodType);

    /**
     * 删除全部的系统资源数据，【注意】该删除为物理删除，主要是用于系统停止事件的时候进行销毁资源，然后重新扫描资源
     *
     * @throws Exception 抛出异常
     */
    @Delete("delete from auth_resources")
    void deleteAll() throws Exception;


    /**
     * 通过主键恢复逻辑删除的系统资源表数据
     *
     * @param id 系统资源表主键
     * @throws Exception 抛出异常
     */
    @Update("update auth_resources set deleted = 0 where id = #{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过系统资源表主键彻底删除系统资源表数据
     *
     * @param id 系统资源表主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from auth_resources where id = #{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;

}
