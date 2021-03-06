package com.zero.auth.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.Resources;
import com.zero.auth.entity.Role;
import com.zero.auth.service.ResourcesService;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 权限的控制器
 *
 * @author herenpeng
 * @since 2020-09-17 18:56
 */
@Api(value = "系统资源操作接口", tags = "ResourcesController")
@RestController
@RequestMapping("resources")
public class ResourcesController extends BaseController<ResourcesService, Resources> {

    @LogOperation
    @ApiOperation(value = "分页查询系统资源数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryResources", value = "系统资源查询条件", dataTypeClass = Resources.class)
    })
    @GetMapping("page/{currentPage}")
    public ResponseData<IPage<Resources>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Resources queryResources) throws Exception {
        IPage<Resources> page = baseService.page(currentPage, size, queryResources);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "删除系统资源角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "ResourcesId", value = "系统资源主键", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "roleId", value = "角色主键", dataTypeClass = Integer.class, required = true)
    })
    @DeleteMapping("role/{resourcesId}")
    public ResponseData<Void> deleteResourcesRole(
            @PathVariable("resourcesId") Integer resourcesId,
            @RequestParam("roleId") Integer roleId) throws Exception {
        baseService.deleteResourcesRole(resourcesId, roleId);
        return ResponseData.ok().message("删除系统资源角色成功");
    }


    @LogOperation
    @ApiOperation(value = "获取未拥有该系统资源的角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "resourcesId", value = "系统资源主键", dataTypeClass = Integer.class, required = true)
    })
    @GetMapping("role/{resourcesId}")
    public ResponseData<List<Role>> getResourcesNotRoleList(
            @PathVariable("resourcesId") Integer resourcesId) throws Exception {
        List<Role> roleList = baseService.getResourcesNotRoleList(resourcesId);
        return ResponseData.ok(roleList);
    }


    @LogOperation
    @ApiOperation(value = "添加系统资源角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "ResourcesId", value = "系统资源主键", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "roleId", value = "角色主键", dataTypeClass = Integer.class, required = true)
    })
    @PostMapping("role/{resourcesId}")
    public ResponseData<Void> addResourcesRole(
            @PathVariable("resourcesId") Integer resourcesId,
            @RequestParam Integer roleId) throws Exception {
        baseService.addResourcesRole(resourcesId, roleId);
        return ResponseData.ok().message("添加系统资源角色成功");
    }


    @LogOperation
    @ApiOperation(value = "分页查询逻辑删除的系统资源表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryResources", value = "系统资源表查询条件", dataTypeClass = Resources.class)
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData<IPage<Resources>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Resources queryResources) throws Exception {
        IPage<Resources> page = baseService.recoverPage(currentPage, size, queryResources);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "通过主键恢复逻辑删除的系统资源表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统资源表ID", dataTypeClass = Integer.class, required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }

    @LogOperation
    @ApiOperation(value = "通过主键彻底删除一条系统资源表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统资源表ID", dataTypeClass = Integer.class, required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.ok().message("彻底删除该系统资源数据");
    }

    @LogOperation
    @ApiOperation(value = "导出系统资源列表数据的Excel文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryResources", value = "系统资源查询条件", dataTypeClass = Resources.class),
            @ApiImplicitParam(name = "response", value = "HttpServletResponse对象", dataTypeClass = HttpServletResponse.class),
    })
    @GetMapping("export/excel")
    public void exportExcel(Resources queryResources, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryResources, response);
    }

}
