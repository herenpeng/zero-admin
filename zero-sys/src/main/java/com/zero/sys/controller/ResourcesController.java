package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.domain.Role;
import com.zero.sys.domain.Resources;
import com.zero.sys.service.ResourcesService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
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
public class ResourcesController {

    @Autowired
    private ResourcesService resourcesService;

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
        IPage<Resources> page = resourcesService.page(currentPage, size, queryResources);
        return ResponseData.ok(page);
    }

    @ApiOperation(value = "插入一条系统资源记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "resources", value = "系统资源对象", required = true)
    })
    @PostMapping
    public ResponseData insert(@RequestBody Resources resources) throws Exception {
        resourcesService.insert(resources);
        return ResponseData.ok("添加系统资源成功");
    }


    @ApiOperation(value = "更新系统资源记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "resources", value = "系统资源对象", required = true)
    })
    @PutMapping
    public ResponseData update(@RequestBody Resources resources) throws Exception {
        resourcesService.updateById(resources);
        return ResponseData.ok("更新系统资源成功");
    }


    @ApiOperation(value = "通过主键删除系统资源信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统资源主键", required = true)
    })
    @DeleteMapping("{id}")
    public ResponseData delete(@PathVariable("id") Integer id) throws Exception {
        resourcesService.delete(id);
        return ResponseData.ok("删除系统资源成功");
    }


    @ApiOperation(value = "删除系统资源角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "ResourcesId", value = "系统资源主键", required = true),
            @ApiImplicitParam(name = "roleId", value = "角色主键", required = true)
    })
    @DeleteMapping("role/{resourcesId}")
    public ResponseData deleteResourcesRole(
            @PathVariable("resourcesId") Integer resourcesId,
            @RequestParam("roleId") Integer roleId) throws Exception {
        resourcesService.deleteResourcesRole(resourcesId, roleId);
        return ResponseData.ok("删除系统资源角色成功");
    }


    @ApiOperation(value = "获取未拥有该系统资源的角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "resourcesId", value = "系统资源主键", required = true)
    })
    @GetMapping("role/{resourcesId}")
    public ResponseData getResourcesNotRoleList(
            @PathVariable("resourcesId") Integer resourcesId) throws Exception {
        List<Role> roleList = resourcesService.getResourcesNotRoleList(resourcesId);
        return ResponseData.ok(roleList);
    }

    @ApiOperation(value = "添加系统资源角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "ResourcesId", value = "系统资源主键", required = true),
            @ApiImplicitParam(name = "roleId", value = "角色主键", required = true)
    })
    @PostMapping("role/{resourcesId}")
    public ResponseData addResourcesRole(
            @PathVariable("resourcesId") Integer resourcesId,
            @RequestParam Integer roleId) throws Exception {
        resourcesService.addResourcesRole(resourcesId, roleId);
        return ResponseData.ok("添加系统资源角色成功");
    }
    
}
