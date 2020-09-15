package com.zero.sys.service;

import com.zero.sys.domain.Role;

import java.util.List;

/**
 * 用户角色的业务逻辑层接口
 *
 * @author herenpeng
 * @since 2020-09-14 20:28
 */
public interface RoleService {

    /**
     * 获取所有的用户角色信息
     *
     * @return
     */
    List<Role> list() throws Exception;

}
