package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.sys.domain.Authority;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * 权限的Mapper接口
 * @author herenpeng
 * @since 2020-09-07 22:38
 */
@Repository
public interface AuthorityMapper extends BaseMapper<Authority> {

    /**
     * 通过pattern获取授权对象
     *
     * @param pattern 权限格式（URI）
     * @return 返回权限信息
     * @throws Exception
     */
    Authority getByPattern(@Param("pattern") String pattern) throws Exception;

    /**
     * 分页获取权限数据，区别于selectPage的是，使用该方法能够关联获取Authority对象中的roles集合属性
     *
     * @param page 分页对象
     * @return 分页权限集合
     * @throws Exception
     */
    IPage<Authority> getPage(IPage page) throws Exception;
}
