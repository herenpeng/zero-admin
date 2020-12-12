package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.entity.Role;
import com.zero.sys.service.RoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;

/**
 * 用户角色的控制器
 *
 * @author herenpeng
 * @since 2020-09-13 23:18
 */
@Api(value = "用户角色操作接口", tags = "RoleController")
@RestController
@RequestMapping("role")
public class RoleController extends BaseController<RoleService, Role> {

    @LogOperation
    @ApiOperation(value = "分页查询角色数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10"),
            @ApiImplicitParam(name = "queryRole", value = "角色查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Role queryRole) throws Exception {
        IPage<Role> page = baseService.page(currentPage, size, queryRole);
        return ResponseData.ok(page);
    }

    /**
     * 获取所有的用户角色
     *
     * @return 所有的用户角色集合
     */
    @LogOperation
    @ApiOperation(value = "获取所有的用户角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryRole", value = "角色查询条件")
    })
    @GetMapping("list")
    public ResponseData list(Role queryRole) throws Exception {
        return ResponseData.ok(baseService.list(queryRole));
    }

    @LogOperation
    @ApiOperation(value = "检测角色名称是否已存在")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "name", value = "角色名称", required = true)
    })
    @GetMapping("check/name")
    public ResponseData checkName(@RequestParam("name") String name) throws Exception {
        Boolean result = baseService.checkName(name);
        return ResponseData.ok(result);
    }


    @LogOperation
    @ApiOperation(value = "分页查询逻辑删除的系统角色表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10"),
            @ApiImplicitParam(name = "queryRole", value = "系统角色表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Role queryRole) throws Exception {
        IPage<Role> page = baseService.recoverPage(currentPage, size, queryRole);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "通过主键恢复逻辑删除的系统角色表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统角色表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }

    @LogOperation
    @ApiOperation(value = "通过主键彻底删除一条系统角色表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统角色表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.ok().message("彻底删除该角色数据");
    }

    @LogOperation
    @ApiOperation(value = "导出角色列表数据的Excel文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryRole", value = "角色查询条件"),
            @ApiImplicitParam(name = "response", value = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(Role queryRole, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryRole, response);
    }

}
