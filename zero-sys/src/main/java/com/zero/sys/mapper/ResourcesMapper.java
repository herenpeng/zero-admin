package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.sys.domain.Resources;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 系统资源的Mapper接口
 *
 * @author herenpeng
 * @since 2020-09-07 22:38
 */
@Repository
public interface ResourcesMapper extends BaseMapper<Resources> {

    /**
     * 通过uri获取授权对象
     *
     * @param uri 资源定位符（URI）
     * @return 返回资源信息
     * @throws Exception
     */
    Resources getByUri(@Param("uri") String uri) throws Exception;

    /**
     * 分页获取权限数据，区别于selectPage的是，使用该方法能够关联获取Resources对象中的roles集合属性
     *
     * @param page 分页对象
     * @return 分页权限集合
     * @throws Exception
     */
    IPage<Resources> getPage(IPage page) throws Exception;

    /**
     * 删除全部的系统资源数据，【注意】该删除为物理删除，主要是用于系统停止事件的时候进行销毁资源，然后重新扫描资源
     * @throws Exception
     */
    void deleteAll() throws Exception;
}
