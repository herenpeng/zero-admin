package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.domain.Role;
import com.zero.sys.service.RoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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


    @ApiOperation(value = "分页查询角色数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "8"),
            @ApiImplicitParam(name = "queryRole", value = "角色查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "8") Integer size,
            Role queryRole) throws Exception {
        IPage<Role> page = roleService.page(currentPage, size, queryRole);
        return ResponseData.ok(page);
    }

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

    @ApiOperation(value = "插入一条角色记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "role", value = "角色对象", required = true)
    })
    @PostMapping
    public ResponseData insert(@RequestBody Role role) throws Exception {
        roleService.insert(role);
        return ResponseData.ok("添加角色成功");
    }


    @ApiOperation(value = "更新角色记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "role", value = "角色对象", required = true)
    })
    @PutMapping
    public ResponseData update(@RequestBody Role role) throws Exception {
        roleService.updateById(role);
        return ResponseData.ok("更新角色成功");
    }


    @ApiOperation(value = "通过主键删除角色信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "角色主键", required = true)
    })
    @DeleteMapping("{id}")
    public ResponseData delete(@PathVariable("id") Integer id) throws Exception {
        roleService.delete(id);
        return ResponseData.ok("删除角色成功");
    }

}
