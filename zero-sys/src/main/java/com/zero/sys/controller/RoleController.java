package com.zero.sys.controller;

import com.zero.common.response.domain.ResponseData;
import com.zero.sys.service.RoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户角色的控制器
 *
 * @author herenpeng
 * @since 2020-09-13 23:18
 */
@Api(value = "用户角色操作接口", tags = "RoleController")
@RestController
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    /**
     * 获取所有的用户角色
     *
     * @return 所有的用户角色集合
     */
    @ApiOperation(value = "获取所有的用户角色")
    @GetMapping("list")
    public ResponseData list() throws Exception {
        return ResponseData.ok(roleService.list());
    }

}
