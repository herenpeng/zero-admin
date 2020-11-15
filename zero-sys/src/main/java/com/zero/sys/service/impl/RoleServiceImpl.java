package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.sys.entity.Role;
import com.zero.sys.mapper.RoleMapper;
import com.zero.sys.service.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 用户角色的业务逻辑层实现
 *
 * @author herenpeng
 * @since 2020-09-14 20:30
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class RoleServiceImpl extends BaseServiceImpl<RoleMapper, Role> implements RoleService {


    @Override
    public IPage<Role> page(Integer currentPage, Integer size, Role queryRole) throws Exception {
        Page page = new Page(currentPage, size);
        IPage<Role> pageInfo = baseMapper.getPage(page, queryRole);
        return pageInfo;
    }

    @Override
    public List<Role> list() throws Exception {
        return baseMapper.selectList(null);
    }

}
