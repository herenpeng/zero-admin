package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.domain.ResponseEntity;
import com.zero.sys.entity.Organ;
import com.zero.sys.service.OrganService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统组织机构表的数据交互控制器
 *
 * @author herenpeng
 * @since 2023-09-03 16:42
 */
@Tag(description = "系统组织机构表操作接口", name = "OrganController")
@RestController
@RequestMapping("organ")
public class OrganController extends BaseController<OrganService, Organ> {

    @LogOperation
    @Operation(description = "分页查询系统组织机构表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryOrgan", description = "系统组织机构表查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseEntity<IPage<Organ>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Organ queryOrgan) throws Exception {
        IPage<Organ> page = baseService.page(currentPage, size, queryOrgan);
        return ResponseEntity.ok(page);
    }


    @LogOperation
    @Operation(description = "查询所有的系统组织机构表数据")
    @Parameters({
            @Parameter(name = "queryOrgan", description = "系统组织机构表查询条件")
    })
    @GetMapping("list")
    public ResponseEntity<List<Organ>> list(Organ queryOrgan) throws Exception {
        return ResponseEntity.ok(baseService.list(queryOrgan));
    }


    @LogOperation
    @Operation(description = "分页查询逻辑删除的系统组织机构表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryOrgan", description = "系统组织机构表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseEntity<IPage<Organ>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Organ queryOrgan) throws Exception {
        IPage<Organ> page = baseService.recoverPage(currentPage, size, queryOrgan);
        return ResponseEntity.ok(page);
    }


    @LogOperation
    @Operation(description = "通过主键恢复逻辑删除的系统组织机构表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统组织机构表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseEntity<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseEntity.ok();
    }


    @LogOperation
    @Operation(description = "通过主键彻底删除一条系统组织机构表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统组织机构表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseEntity<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseEntity.message("彻底删除该系统组织机构表数据");
    }


    @LogOperation
    @Operation(description = "导出系统组织机构表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryOrgan", description = "系统组织机构表查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(Organ queryOrgan, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryOrgan, response);
    }

}