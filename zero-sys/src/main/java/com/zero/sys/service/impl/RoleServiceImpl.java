package com.zero.sys.service.impl;

import com.zero.sys.domain.Role;
import com.zero.sys.mapper.RoleMapper;
import com.zero.sys.service.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
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
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> list() throws Exception {
        return roleMapper.selectList(null);
    }
}
