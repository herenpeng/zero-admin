package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.AppLog;
import com.zero.common.base.controller.BaseController;
import com.zero.common.domain.ResponseEntity;
import com.zero.sys.entity.Organ;
import com.zero.sys.service.OrganService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 系统组织机构表的数据交互控制器
 *
 * @author herenpeng
 * @since 2024-01-18 22:28
 */
@Tag(description = "系统组织机构表操作接口", name = "OrganController")
@RestController
@RequestMapping("organ")
public class OrganController extends BaseController<OrganService, Organ> {

    @AppLog
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


    @AppLog
    @Operation(description = "查询所有的系统组织机构表数据")
    @Parameters({
            @Parameter(name = "queryOrgan", description = "系统组织机构表查询条件")
    })
    @GetMapping("list")
    public ResponseEntity<List<Organ>> list(Organ queryOrgan) throws Exception {
        return ResponseEntity.ok(baseService.list(queryOrgan));
    }


    @AppLog
    @Operation(description = "查询系统组织机构表数据并构建树状结构")
    @GetMapping("tree")
    public ResponseEntity<List<Organ>> tree() throws Exception {
        List<Organ> tree = baseService.tree();
        return ResponseEntity.ok(tree);
    }


    @AppLog
    @Operation(description = "移动系统组织机构表树状结构节点")
    @Parameters({
            @Parameter(name = "organ", description = "系统组织机构树状结构节节点")
    })
    @PutMapping("move")
    public ResponseEntity<List<Organ>> move(@RequestBody Organ organ) throws Exception {
        baseService.move(organ);
        return ResponseEntity.message("操作成功");
    }


    @AppLog
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


    @AppLog
    @Operation(description = "通过主键恢复逻辑删除的系统组织机构表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统组织机构表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseEntity<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseEntity.ok();
    }


    @AppLog
    @Operation(description = "通过主键彻底删除一条系统组织机构表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统组织机构表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseEntity<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseEntity.message("彻底删除该系统组织机构表数据");
    }


    @AppLog
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