package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.Role;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.entity.Menu;
import com.zero.sys.service.MenuService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统菜单表的数据交互控制器
 *
 * @author herenpeng
 * @since 2020-11-15 21:20
 */
@Tag(description = "系统菜单表操作接口", name = "MenuController")
@RestController
@RequestMapping("menu")
public class MenuController extends BaseController<MenuService, Menu> {

    @LogOperation
    @Operation(description = "分页查询系统菜单表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryMenu", description = "系统菜单表查询条件")
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
    @Operation(description = "[动态路由]获取所有启用的系统菜单")
    @GetMapping("routes")
    public ResponseData<List<Menu>> routes() throws Exception {
        List<Menu> routes = baseService.getRoutes();
        return ResponseData.ok(routes);
    }


    @LogOperation
    @Operation(description = "隐藏或者显示一个菜单")
    @Parameters({
            @Parameter(name = "id", description = "菜单ID", required = true),
            @Parameter(name = "hidden", description = "true为隐藏，false为显示", required = true)
    })
    @PutMapping("hidden/{id}")
    public ResponseData<Void> hidden(
            @PathVariable("id") Integer id,
            @RequestParam("hidden") Boolean hidden) throws Exception {
        baseService.hidden(id, hidden);
        return ResponseData.ok();
    }

    @LogOperation
    @Operation(description = "启用或者禁用一个菜单")
    @Parameters({
            @Parameter(name = "id", description = "菜单ID", required = true),
            @Parameter(name = "enabled", description = "true为启用，false为禁用", required = true)
    })
    @PutMapping("enabled/{id}")
    public ResponseData<Void> enabled(
            @PathVariable("id") Integer id,
            @RequestParam("enabled") Boolean enabled) throws Exception {
        baseService.enabled(id, enabled);
        return ResponseData.ok();
    }


    @LogOperation
    @Operation(description = "删除菜单角色")
    @Parameters({
            @Parameter(name = "menuId", description = "菜单主键", required = true),
            @Parameter(name = "roleId", description = "角色主键", required = true)
    })
    @DeleteMapping("role/{menuId}")
    public ResponseData<Void> deleteMenuRole(
            @PathVariable("menuId") Integer menuId,
            @RequestParam("roleId") Integer roleId) throws Exception {
        baseService.deleteMenuRole(menuId, roleId);
        return ResponseData.message("删除菜单角色成功");
    }


    @LogOperation
    @Operation(description = "获取该菜单未拥有的角色")
    @Parameters({
            @Parameter(name = "menuId", description = "菜单主键", required = true)
    })
    @GetMapping("role/{menuId}")
    public ResponseData<List<Role>> getMenuNotRoleList(
            @PathVariable("menuId") Integer menuId) throws Exception {
        List<Role> roleList = baseService.getMenuNotRoleList(menuId);
        return ResponseData.ok(roleList);
    }


    @LogOperation
    @Operation(description = "添加菜单角色")
    @Parameters({
            @Parameter(name = "menuId", description = "菜单主键", required = true),
            @Parameter(name = "roleId", description = "角色主键", required = true)
    })
    @PostMapping("role/{menuId}")
    public ResponseData<Void> addUserRole(
            @PathVariable("menuId") Integer menuId,
            @RequestParam Integer roleId) throws Exception {
        baseService.addMenuRole(menuId, roleId);
        return ResponseData.message("添加菜单角色成功");
    }


    @LogOperation
    @Operation(description = "分页查询逻辑删除的系统菜单表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryMenu", description = "系统菜单表查询条件")
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
    @Operation(description = "通过主键恢复逻辑删除的系统菜单表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统菜单表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }

    @LogOperation
    @Operation(description = "通过主键彻底删除一条系统菜单表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统菜单表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.message("彻底删除该系统菜单表数据");
    }

    @LogOperation
    @Operation(description = "导出系统菜单列表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryMenu", description = "系统菜单查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(Menu queryMenu, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryMenu, response);

    }

}