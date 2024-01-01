package com.zero.auth.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.Role;
import com.zero.auth.service.RoleService;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户角色的控制器
 *
 * @author herenpeng
 * @since 2020-09-13 23:18
 */
@Tag(description = "用户角色操作接口", name = "RoleController")
@RestController
@RequestMapping("role")
public class RoleController extends BaseController<RoleService, Role> {

    @LogOperation
    @Operation(description = "分页查询角色数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryRole", description = "角色查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData<IPage<Role>> page(
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
    @Operation(description = "获取所有的用户角色")
    @Parameters({
            @Parameter(name = "queryRole", description = "角色查询条件")
    })
    @GetMapping("list")
    public ResponseData<List<Role>> list(Role queryRole) throws Exception {
        return ResponseData.ok(baseService.list(queryRole));
    }

    @LogOperation
    @Operation(description = "检测角色名称是否已存在")
    @Parameters({
            @Parameter(name = "name", description = "角色名称", required = true)
    })
    @GetMapping("check/name")
    public ResponseData<Boolean> checkName(@RequestParam("name") String name) throws Exception {
        Boolean result = baseService.checkName(name);
        return ResponseData.ok(result);
    }

    @LogOperation
    @Operation(description = "通过主键设置或者取消默认角色")
    @Parameters({
            @Parameter(name = "role", description = "角色实体", required = true)
    })
    @PutMapping("acquiescence")
    public ResponseData<Void> updateAcquiescence(@RequestBody Role role) throws Exception {
        baseService.updateAcquiescence(role);
        return ResponseData.message("默认角色修改成功");
    }


    @LogOperation
    @Operation(description = "分页查询逻辑删除的系统角色表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryRole", description = "系统角色表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData<IPage<Role>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Role queryRole) throws Exception {
        IPage<Role> page = baseService.recoverPage(currentPage, size, queryRole);
        return ResponseData.ok(page);
    }


    @LogOperation
    @Operation(description = "通过主键恢复逻辑删除的系统角色表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统角色表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }

    @LogOperation
    @Operation(description = "通过主键彻底删除一条系统角色表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统角色表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.message("彻底删除该角色数据");
    }

    @LogOperation
    @Operation(description = "导出角色列表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryRole", description = "角色查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象")
    })
    @GetMapping("export/excel")
    public void exportExcel(Role queryRole, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryRole, response);
    }

}
