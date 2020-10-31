package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.domain.Resources;
import com.zero.sys.domain.Role;
import com.zero.sys.service.ResourcesService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

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
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "8"),
            @ApiImplicitParam(name = "queryResources", value = "系统资源查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "8") Integer size,
            Resources queryResources) throws Exception {
        IPage<Resources> page = baseService.page(currentPage, size, queryResources);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "删除系统资源角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "ResourcesId", value = "系统资源主键", required = true),
            @ApiImplicitParam(name = "roleId", value = "角色主键", required = true)
    })
    @DeleteMapping("role/{resourcesId}")
    public ResponseData deleteResourcesRole(
            @PathVariable("resourcesId") Integer resourcesId,
            @RequestParam("roleId") Integer roleId) throws Exception {
        baseService.deleteResourcesRole(resourcesId, roleId);
        return ResponseData.ok().message("删除系统资源角色成功");
    }


    @LogOperation
    @ApiOperation(value = "获取未拥有该系统资源的角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "resourcesId", value = "系统资源主键", required = true)
    })
    @GetMapping("role/{resourcesId}")
    public ResponseData getResourcesNotRoleList(
            @PathVariable("resourcesId") Integer resourcesId) throws Exception {
        List<Role> roleList = baseService.getResourcesNotRoleList(resourcesId);
        return ResponseData.ok(roleList);
    }


    @LogOperation
    @ApiOperation(value = "添加系统资源角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "ResourcesId", value = "系统资源主键", required = true),
            @ApiImplicitParam(name = "roleId", value = "角色主键", required = true)
    })
    @PostMapping("role/{resourcesId}")
    public ResponseData addResourcesRole(
            @PathVariable("resourcesId") Integer resourcesId,
            @RequestParam Integer roleId) throws Exception {
        baseService.addResourcesRole(resourcesId, roleId);
        return ResponseData.ok().message("添加系统资源角色成功");
    }

}
