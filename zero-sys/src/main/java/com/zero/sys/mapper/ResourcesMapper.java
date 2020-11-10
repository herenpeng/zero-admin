package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.sys.domain.Resources;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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
     * 通过uri正则表达式字段（regex）匹配获取对应的资源
     *
     * @param uri        请求路径
     * @param methodType 方法类型
     * @return 返回资源信息
     * @throws Exception
     */
    Resources getByRegexUriAndMethodType(@Param("uri") String uri, @Param("methodType") String methodType);

    /**
     * 分页获取系统资源数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page           分页查询
     * @param queryResources 系统资源查询条件
     * @return 系统集合
     * @throws Exception 抛出异常
     */
    IPage<Resources> getPage(Page page, @Param("queryResources") Resources queryResources) throws Exception;


    /**
     * 删除全部的系统资源数据，【注意】该删除为物理删除，主要是用于系统停止事件的时候进行销毁资源，然后重新扫描资源
     *
     * @throws Exception
     */
    void deleteAll() throws Exception;

    /**
     * 删除系统资源角色
     *
     * @param resourcesId 系统资源主键
     * @param roleId      角色主键
     * @throws Exception 抛出异常
     */
    void deleteResourcesRole(@Param("resourcesId") Integer resourcesId, @Param("roleId") Integer roleId) throws Exception;


}
