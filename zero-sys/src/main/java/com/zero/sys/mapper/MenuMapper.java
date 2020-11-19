package com.zero.sys.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.sys.entity.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 系统菜单表的Mapper接口
 *
 * @author herenpeng
 * @since 2020-11-15 21:20
 */
@Mapper
@Repository
public interface MenuMapper extends BaseMapper<Menu> {

    /**
     * 分页获取系统菜单表数据，区别于selectPage的是，该方法添加了查询条件
     *
     * @param page      分页查询
     * @param queryMenu Menu查询条件
     * @return Menu集合
     * @throws Exception 抛出异常
     */
    IPage<Menu> getPage(IPage page, @Param("queryMenu") Menu queryMenu) throws Exception;

    /**
     * 获取菜单的所有下级子菜单
     *
     * @param parentId 菜单主键Id
     * @return 菜单下级的所有子菜单
     * @throws Exception 抛出异常
     */
    List<Menu> getChildrenMenuList(@Param("parentId") Integer parentId) throws Exception;


    /**
     * 获取所有的父级菜单信息
     *
     * @return 所有的父级菜单信息
     * @throws Exception 抛出异常
     */
    List<Menu> getParentList() throws Exception;
}