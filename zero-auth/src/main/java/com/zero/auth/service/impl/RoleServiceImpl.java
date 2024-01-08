package com.zero.auth.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zero.auth.entity.Role;
import com.zero.auth.entity.UserRole;
import com.zero.auth.mapper.RoleMapper;
import com.zero.auth.mapper.UserRoleMapper;
import com.zero.auth.properties.RoleProperties;
import com.zero.auth.service.RoleService;
import com.zero.common.base.service.impl.BaseServiceImpl;
import com.zero.common.exception.AppException;
import com.zero.common.exception.AppExceptionEnum;
import com.zero.common.kit.ExcelKit;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

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

    private final UserRoleMapper userRoleMapper;

    @Override
    public IPage<Role> page(Integer currentPage, Integer size, Role queryRole) throws Exception {
        IPage<Role> page = new Page<>(currentPage, size);
        QueryWrapper<Role> queryWrapper = new QueryWrapper<>(queryRole);
        return baseMapper.selectPage(page, queryWrapper);
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
    public void updateAcquiescence(Role role) throws Exception {
        // 如果默认值为true，则说明是由非默认角色修改为默认角色
        // 如果传入的默认值为false，则说明是由默认角色修改为非默认角色
        if (role.getAcquiescence()) {
            // 先将原来的默认角色设置为false
            Role acquiescenceRole = baseMapper.selectAcquiescence();
            // 如果存在默认角色
            if (!ObjectUtils.isEmpty(acquiescenceRole)) {
                acquiescenceRole.setAcquiescence(false);
                baseMapper.updateById(acquiescenceRole);
            }
        }
        baseMapper.updateById(role);
    }

    @Override
    public void setAcquiescence(Integer userId) {
        // 赋予该用户默认角色
        Role role = baseMapper.selectAcquiescence();
        if (!ObjectUtils.isEmpty(role)) {
            UserRole userRole = new UserRole();
            userRole.setUserId(userId);
            userRole.setRoleId(role.getId());
            userRoleMapper.insert(userRole);
        }
    }

    @Override
    public IPage<Role> recoverPage(Integer currentPage, Integer size, Role queryRole) throws Exception {
        queryRole.setDeleted(true);
        IPage<Role> page = new Page<>(currentPage, size);
        return baseMapper.getPage(page, queryRole);
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
        ExcelKit.exportExcel("角色列表", Role.class, exportData, response);
    }


    /**
     * 校验Root角色的权限，不允许所有用户对该Root角色进行修改，删除等等操作
     *
     * @param id 角色主键
     */
    private void verifyRootPermissions(Serializable id) {
        Role role = baseMapper.selectById(id);
        if (roleProperties.getRootName().equals(role.getName())) {
            throw new AppException(AppExceptionEnum.INSUFFICIENT_AUTHENTICATION);
        }
    }

}
