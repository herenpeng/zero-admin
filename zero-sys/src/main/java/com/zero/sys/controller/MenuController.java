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

import javax.servlet.http.HttpServletResponse;
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
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryMenu", value = "系统菜单表查询条件", dataTypeClass = Menu.class)
    })
    @GetMapping("page/{currentPage}")
    public ResponseData<IPage<Menu>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Menu queryMenu) throws Exception {
        IPage<Menu> page = baseService.page(currentPage, size, queryMenu);
        return ResponseData.ok(page);
    }

    @LogOperation
    @ApiOperation(value = "[动态路由]获取所有启用的系统菜单")
    @GetMapping("routes")
    public ResponseData<List<Menu>> routes() throws Exception {
        List<Menu> routes = baseService.getRoutes();
        return ResponseData.ok(routes);
    }


    @LogOperation
    @ApiOperation(value = "启用或者禁用一个菜单")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "菜单ID", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "enabled", value = "true为启用，false为禁用", dataTypeClass = Boolean.class, required = true)
    })
    @PutMapping("enabled/{id}")
    public ResponseData<Void> enabled(
            @PathVariable("id") Integer id,
            @RequestParam("enabled") Boolean enabled) throws Exception {
        baseService.enabled(id, enabled);
        return ResponseData.ok();
    }


    @LogOperation
    @ApiOperation(value = "删除菜单角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "menuId", value = "菜单主键", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "roleId", value = "角色主键", dataTypeClass = Integer.class, required = true)
    })
    @DeleteMapping("role/{menuId}")
    public ResponseData<Void> deleteMenuRole(
            @PathVariable("menuId") Integer menuId,
            @RequestParam("roleId") Integer roleId) throws Exception {
        baseService.deleteMenuRole(menuId, roleId);
        return ResponseData.ok().message("删除菜单角色成功");
    }


    @LogOperation
    @ApiOperation(value = "获取该菜单未拥有的角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "menuId", value = "菜单主键", dataTypeClass = Integer.class, required = true)
    })
    @GetMapping("role/{menuId}")
    public ResponseData<List<Role>> getMenuNotRoleList(
            @PathVariable("menuId") Integer menuId) throws Exception {
        List<Role> roleList = baseService.getMenuNotRoleList(menuId);
        return ResponseData.ok(roleList);
    }


    @LogOperation
    @ApiOperation(value = "添加菜单角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "menuId", value = "菜单主键", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "roleId", value = "角色主键", dataTypeClass = Integer.class, required = true)
    })
    @PostMapping("role/{menuId}")
    public ResponseData<Void> addUserRole(
            @PathVariable("menuId") Integer menuId,
            @RequestParam Integer roleId) throws Exception {
        baseService.addMenuRole(menuId, roleId);
        return ResponseData.ok().message("添加菜单角色成功");
    }


    @LogOperation
    @ApiOperation(value = "分页查询逻辑删除的系统菜单表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryMenu", value = "系统菜单表查询条件", dataTypeClass = Menu.class)
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData<IPage<Menu>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Menu queryMenu) throws Exception {
        IPage<Menu> page = baseService.recoverPage(currentPage, size, queryMenu);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "通过主键恢复逻辑删除的系统菜单表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统菜单表ID", dataTypeClass = Integer.class, required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }

    @LogOperation
    @ApiOperation(value = "通过主键彻底删除一条系统菜单表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统菜单表ID", dataTypeClass = Integer.class, required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.ok().message("彻底删除该系统菜单表数据");
    }

    @LogOperation
    @ApiOperation(value = "导出系统菜单列表数据的Excel文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryMenu", value = "系统菜单查询条件", dataTypeClass = Menu.class),
            @ApiImplicitParam(name = "response", value = "HttpServletResponse对象", dataTypeClass = HttpServletResponse.class),
    })
    @GetMapping("export/excel")
    public void exportExcel(Menu queryMenu, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryMenu, response);

    }

}