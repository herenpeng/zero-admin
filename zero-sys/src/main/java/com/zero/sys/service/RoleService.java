package com.zero.sys.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zero.sys.domain.Role;

import java.util.List;

/**
 * 用户角色的业务逻辑层接口
 *
 * @author herenpeng
 * @since 2020-09-14 20:28
 */
public interface RoleService extends IService<Role> {

    /**
     * 分页查询角色信息
     *
     * @param currentPage 当前页码
     * @param size        每页大小
     * @param queryRole   角色查询条件
     * @return
     * @throws Exception 抛出异常
     */
    IPage<Role> page(Integer currentPage, Integer size, Role queryRole) throws Exception;

    /**
     * 获取所有的用户角色信息
     *
     * @return
     * @throws Exception
     */
    List<Role> list() throws Exception;


}
