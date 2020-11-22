package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.entity.Menu;
import com.zero.sys.entity.Role;
import com.zero.sys.service.MenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 系统菜单表的数据交互控制器
 *
 * @author herenpeng
 * @since 2020-11-15 21:20
 */
@Api(value = "系统菜单表操作接口", tags = "MenuController")
@RestController
@RequestMapping("menu")
public class MenuController extends BaseController<MenuService, Menu> {

    @LogOperation
    @ApiOperation(value = "分页查询系统菜单表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "8"),
            @ApiImplicitParam(name = "queryMenu", value = "系统菜单表查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "8") Integer size,
            Menu queryMenu) throws Exception {
        IPage<Menu> page = baseService.page(currentPage, size, queryMenu);
        return ResponseData.ok(page);
    }

    @LogOperation
    @ApiOperation(value = "[动态路由]获取所有启用的系统菜单")
    @GetMapping("routes")
    public ResponseData routes() throws Exception {
        List<Menu> routes = baseService.getRoutes();
        return ResponseData.ok(routes);
    }


    @LogOperation
    @ApiOperation(value = "启用或者禁用一个菜单")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "菜单ID", required = true),
            @ApiImplicitParam(name = "enabled", value = "true为启用，false为禁用", required = true)
    })
    @PutMapping("enabled/{id}")
    public ResponseData enabled(
            @PathVariable("id") Integer id,
            @RequestParam("enabled") Boolean enabled) throws Exception {
        baseService.enabled(id, enabled);
        return ResponseData.ok();
    }


    @LogOperation
    @ApiOperation(value = "删除菜单角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "menuId", value = "菜单主键", required = true),
            @ApiImplicitParam(name = "roleId", value = "角色主键", required = true)
    })
    @DeleteMapping("role/{menuId}")
    public ResponseData deleteMenuRole(
            @PathVariable("menuId") Integer menuId,
            @RequestParam("roleId") Integer roleId) throws Exception {
        baseService.deleteMenuRole(menuId, roleId);
        return ResponseData.ok().message("删除菜单角色成功");
    }


    @LogOperation
    @ApiOperation(value = "获取该菜单未拥有的角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "menuId", value = "菜单主键", required = true)
    })
    @GetMapping("role/{menuId}")
    public ResponseData getMenuNotRoleList(
            @PathVariable("menuId") Integer menuId) throws Exception {
        List<Role> roleList = baseService.getMenuNotRoleList(menuId);
        return ResponseData.ok(roleList);
    }


    @LogOperation
    @ApiOperation(value = "添加菜单角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "menuId", value = "菜单主键", required = true),
            @ApiImplicitParam(name = "roleId", value = "角色主键", required = true)
    })
    @PostMapping("role/{menuId}")
    public ResponseData addUserRole(
            @PathVariable("menuId") Integer menuId,
            @RequestParam Integer roleId) throws Exception {
        baseService.addMenuRole(menuId, roleId);
        return ResponseData.ok().message("添加菜单角色成功");
    }

}