package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.domain.ResponseEntity;
import com.zero.sys.entity.OperationLog;
import com.zero.sys.service.OperationLogService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 系统操作日志表的数据交互控制器
 *
 * @author herenpeng
 * @since 2020-12-01 22:31
 */
@Tag(description = "系统操作日志表操作接口", name = "OperationLogController")
@RestController
@RequestMapping("operation/log")
public class OperationLogController extends BaseController<OperationLogService, OperationLog> {

    @LogOperation
    @Operation(description = "分页查询系统操作日志表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryOperationLog", description = "系统操作日志表查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseEntity<IPage<OperationLog>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            OperationLog queryOperationLog) throws Exception {
        IPage<OperationLog> page = baseService.page(currentPage, size, queryOperationLog);
        return ResponseEntity.ok(page);
    }


    @LogOperation
    @Operation(description = "查询所有的系统操作日志表数据")
    @Parameters({
            @Parameter(name = "queryOperationLog", description = "系统操作日志表查询条件")
    })
    @GetMapping("list")
    public ResponseEntity<List<OperationLog>> list(OperationLog queryOperationLog) throws Exception {
        return ResponseEntity.ok(baseService.list(queryOperationLog));
    }


    @LogOperation
    @Operation(description = "分页查询逻辑删除的系统操作日志表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryOperationLog", description = "系统操作日志表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseEntity<IPage<OperationLog>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            OperationLog queryOperationLog) throws Exception {
        IPage<OperationLog> page = baseService.recoverPage(currentPage, size, queryOperationLog);
        return ResponseEntity.ok(page);
    }


    @LogOperation
    @Operation(description = "通过主键恢复逻辑删除的系统操作日志表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统操作日志表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseEntity<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseEntity.ok();
    }

    @LogOperation
    @Operation(description = "通过主键彻底删除一条系统操作日志表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统操作日志表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseEntity<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseEntity.message("彻底删除该系统操作日志数据");
    }

    @LogOperation
    @Operation(description = "导出操作日志列表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryOperationLog", description = "操作日志查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(OperationLog queryOperationLog, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryOperationLog, response);
    }

}