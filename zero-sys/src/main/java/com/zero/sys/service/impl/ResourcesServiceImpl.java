package com.zero.sys.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.sys.entity.Resources;
import com.zero.sys.entity.ResourcesRole;
import com.zero.sys.entity.Role;
import com.zero.sys.mapper.ResourcesMapper;
import com.zero.sys.mapper.ResourcesRoleMapper;
import com.zero.sys.mapper.RoleMapper;
import com.zero.sys.service.ResourcesService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 系统资源的业务逻辑层实现
 *
 * @author herenpeng
 * @since 2020-10-20 21:56
 */
@Slf4j
@Service
@Transactional(rollbackFor = Exception.class)
public class ResourcesServiceImpl extends BaseServiceImpl<ResourcesMapper, Resources> implements ResourcesService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private ResourcesRoleMapper resourcesRoleMapper;

    @Override
    public IPage<Resources> page(Integer currentPage, Integer size, Resources queryResources) throws Exception {
        Page page = new Page(currentPage, size);
        IPage<Resources> pageInfo = baseMapper.getPage(page, queryResources);
        for (Resources resources : pageInfo.getRecords()) {
            resources.setRoles(roleMapper.getByResourcesId(resources.getId()));
        }
        return pageInfo;
    }

    @Override
    public void deleteResourcesRole(Integer resourcesId, Integer roleId) throws Exception {
        baseMapper.deleteResourcesRole(resourcesId, roleId);
    }

    @Override
    public List<Role> getResourcesNotRoleList(Integer resourcesId) throws Exception {
        return roleMapper.getResourcesNotRoleList(resourcesId);
    }

    @Override
    public void addResourcesRole(Integer resourcesId, Integer roleId) throws Exception {
        ResourcesRole resourcesRole = new ResourcesRole();
        resourcesRole.setResourcesId(resourcesId);
        resourcesRole.setRoleId(roleId);
        resourcesRoleMapper.insert(resourcesRole);
    }


}
