package com.zero.auth.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.Resources;
import com.zero.auth.entity.Role;
import com.zero.auth.service.ResourcesService;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.domain.ResponseEntity;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 权限的控制器
 *
 * @author herenpeng
 * @since 2020-09-17 18:56
 */
@Tag(description = "系统资源操作接口", name = "ResourcesController")
@RestController
@RequestMapping("resources")
public class ResourcesController extends BaseController<ResourcesService, Resources> {

    @LogOperation
    @Operation(description = "分页查询系统资源数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryResources", description = "系统资源查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseEntity<IPage<Resources>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Resources queryResources) throws Exception {
        IPage<Resources> page = baseService.page(currentPage, size, queryResources);
        return ResponseEntity.ok(page);
    }


    @LogOperation
    @Operation(description = "删除系统资源角色")
    @Parameters({
            @Parameter(name = "ResourcesId", description = "系统资源主键", required = true),
            @Parameter(name = "roleId", description = "角色主键", required = true)
    })
    @DeleteMapping("role/{resourcesId}")
    public ResponseEntity<Void> deleteResourcesRole(
            @PathVariable("resourcesId") Integer resourcesId,
            @RequestParam("roleId") Integer roleId) throws Exception {
        baseService.deleteResourcesRole(resourcesId, roleId);
        return ResponseEntity.message("删除系统资源角色成功");
    }


    @LogOperation
    @Operation(description = "获取未拥有该系统资源的角色")
    @Parameters({
            @Parameter(name = "resourcesId", description = "系统资源主键", required = true)
    })
    @GetMapping("role/{resourcesId}")
    public ResponseEntity<List<Role>> getResourcesNotRoleList(
            @PathVariable("resourcesId") Integer resourcesId) throws Exception {
        List<Role> roleList = baseService.getResourcesNotRoleList(resourcesId);
        return ResponseEntity.ok(roleList);
    }


    @LogOperation
    @Operation(description = "添加系统资源角色")
    @Parameters({
            @Parameter(name = "ResourcesId", description = "系统资源主键", required = true),
            @Parameter(name = "roleId", description = "角色主键", required = true)
    })
    @PostMapping("role/{resourcesId}")
    public ResponseEntity<Void> addResourcesRole(
            @PathVariable("resourcesId") Integer resourcesId,
            @RequestParam Integer roleId) throws Exception {
        baseService.addResourcesRole(resourcesId, roleId);
        return ResponseEntity.message("添加系统资源角色成功");
    }


    @LogOperation
    @Operation(description = "分页查询逻辑删除的系统资源表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryResources", description = "系统资源表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseEntity<IPage<Resources>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Resources queryResources) throws Exception {
        IPage<Resources> page = baseService.recoverPage(currentPage, size, queryResources);
        return ResponseEntity.ok(page);
    }


    @LogOperation
    @Operation(description = "通过主键恢复逻辑删除的系统资源表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统资源表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseEntity<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseEntity.ok();
    }

    @LogOperation
    @Operation(description = "通过主键彻底删除一条系统资源表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统资源表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseEntity<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseEntity.message("彻底删除该系统资源数据");
    }

    @LogOperation
    @Operation(description = "导出系统资源列表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryResources", description = "系统资源查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(Resources queryResources, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryResources, response);
    }

}
