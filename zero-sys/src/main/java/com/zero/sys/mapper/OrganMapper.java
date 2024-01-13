package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.sys.entity.Organ;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 系统组织机构表的Mapper接口
 *
 * @author herenpeng
 * @since 2024-01-13 15:53
 */
@Mapper
@Repository
public interface OrganMapper extends BaseMapper<Organ> {

    /**
     * 分页查询系统组织机构表数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page      分页查询
     * @param queryOrgan Organ查询条件
     * @return Organ集合
     * @throws Exception 抛出异常
     */
    IPage<Organ> getPage(IPage<Organ> page, @Param("queryOrgan") Organ queryOrgan) throws Exception;

    /**
     * 获取所有的系统组织机构表数据，区别于selectList的是，该方法添加了查询条件
     *
     * @param queryOrgan Organ查询条件
     * @return Organ集合
     * @throws Exception 抛出异常
     */
    List<Organ> getList(@Param("queryOrgan") Organ queryOrgan) throws Exception;

    /**
     * 通过父节点主键，获取节点的所有子节点系统组织机构表数据
     *
     * @param parentId 父节点主键Id
     * @return 节点的所有子节点系统组织机构表数据
     * @throws Exception 抛出异常
     */
    List<Organ> getByParentId(@Param("parentId") Integer parentId) throws Exception;

    /**
     * 通过主键恢复逻辑删除的系统组织机构表数据
     *
     * @param id 系统组织机构表主键
     * @throws Exception 抛出异常
     */
    @Update("update sys_organ set deleted = 0 where id = #{id}")
    void recoverById(@Param("id") Integer id) throws Exception;

    /**
     * 回收站删除，通过系统组织机构表主键彻底删除系统组织机构表数据
     *
     * @param id 系统组织机构表主键
     * @throws Exception 抛出异常
     */
    @Delete("delete from sys_organ where id = #{id}")
    void recoverDelete(@Param("id") Integer id) throws Exception;

}
