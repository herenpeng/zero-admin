package com.zero.auth.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.entity.Role;
import com.zero.auth.mapper.RoleMapper;
import com.zero.auth.properties.RoleProperties;
import com.zero.auth.service.RoleService;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.exception.MyException;
import com.zero.common.exception.MyExceptionEnum;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.io.Serializable;
import java.util.List;

/**
 * 用户角色的业务逻辑层实现
 *
 * @author herenpeng
 * @since 2020-09-14 20:30
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class RoleServiceImpl extends BaseServiceImpl<RoleMapper, Role> implements RoleService {

    private final RoleProperties roleProperties;

    @Override
    public IPage<Role> page(Integer currentPage, Integer size, Role queryRole) throws Exception {
        IPage<Role> page = new Page<>(currentPage, size);
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>(queryRole);
        IPage<Role> pageInfo = baseMapper.selectPage(page, queryWrapper);
        return pageInfo;
    }

    @Override
    public List<Role> list(Role queryRole) throws Exception {
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>(queryRole);
        List<Role> roleList = baseMapper.selectList(queryWrapper);
        return roleList;
    }

    @Override
    public boolean updateById(Role role) {
        verifyRootPermissions(role.getId());
        return super.updateById(role);
    }

    @Override
    public boolean removeById(Serializable id) {
        verifyRootPermissions(id);
        return super.removeById(id);
    }

    @Override
    public Boolean checkName(String name) throws Exception {
        return baseMapper.checkName(name);
    }

    @Override
    public IPage<Role> recoverPage(Integer currentPage, Integer size, Role queryRole) throws Exception {
        IPage<Role> page = new Page<>(currentPage, size);
        IPage<Role> pageInfo = baseMapper.getRecoverPage(page, queryRole);
        return pageInfo;
    }

    @Override
    public void recover(Integer id) throws Exception {
        baseMapper.recoverById(id);
    }

    @Override
    public void recoverDelete(Integer id) throws Exception {
        baseMapper.recoverDelete(id);
    }

    @Override
    public void exportExcel(Role queryRole, HttpServletResponse response) throws Exception {
        List<Role> exportData = list(queryRole);
        excelUtils.exportExcel("角色列表", Role.class, exportData, response);
    }

    /**
     * 校验Root角色的权限，不允许所有用户对该Root角色进行修改，删除等等操作
     *
     * @param id 角色主键
     */
    private void verifyRootPermissions(Serializable id) {
        Role role = baseMapper.selectById(id);
        if (roleProperties.getRootName().equals(role.getName())) {
            throw new MyException(MyExceptionEnum.ACCESS_DENIED);
        }
    }

}
