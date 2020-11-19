package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.sys.entity.Menu;
import com.zero.sys.mapper.MenuMapper;
import com.zero.sys.service.MenuService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 系统菜单表业务逻辑层的实现类
 *
 * @author herenpeng
 * @since 2020-11-15 21:20
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class MenuServiceImpl extends BaseServiceImpl<MenuMapper, Menu> implements MenuService {

    @Override
    public IPage<Menu> page(Integer currentPage, Integer size, Menu queryMenu) throws Exception {
        Page page = new Page(currentPage, size);
        IPage<Menu> pageInfo = baseMapper.getPage(page, queryMenu);
        for (Menu menu : pageInfo.getRecords()) {
            menu.setChildrenMenuList(baseMapper.getChildrenMenuList(menu.getId()));
        }
        return pageInfo;
    }

    @Override
    public List<Menu> getList() throws Exception {
        List<Menu> parentList = baseMapper.getParentList();
        for (Menu menu : parentList) {
            menu.setChildrenMenuList(baseMapper.getChildrenMenuList(menu.getId()));
        }
        return parentList;
    }

}