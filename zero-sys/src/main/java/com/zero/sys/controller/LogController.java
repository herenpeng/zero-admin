package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.entity.Log;
import com.zero.sys.service.LogService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统操作日志表的数据交互控制器
 *
 * @author herenpeng
 * @since 2020-12-01 22:31
 */
@Tag(description = "系统操作日志表操作接口", name = "LogController")
@RestController
@RequestMapping("log")
public class LogController extends BaseController<LogService, Log> {

    @LogOperation
    @Operation(description = "分页查询系统操作日志表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryLog", description = "系统操作日志表查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData<IPage<Log>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Log queryLog) throws Exception {
        IPage<Log> page = baseService.page(currentPage, size, queryLog);
        return ResponseData.ok(page);
    }


    @LogOperation
    @Operation(description = "查询所有的系统操作日志表数据")
    @Parameters({
            @Parameter(name = "queryLog", description = "系统操作日志表查询条件")
    })
    @GetMapping("list")
    public ResponseData<List<Log>> list(Log queryLog) throws Exception {
        return ResponseData.ok(baseService.list(queryLog));
    }


    @LogOperation
    @Operation(description = "分页查询逻辑删除的系统操作日志表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryLog", description = "系统操作日志表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData<IPage<Log>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Log queryLog) throws Exception {
        IPage<Log> page = baseService.recoverPage(currentPage, size, queryLog);
        return ResponseData.ok(page);
    }


    @LogOperation
    @Operation(description = "通过主键恢复逻辑删除的系统操作日志表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统操作日志表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }

    @LogOperation
    @Operation(description = "通过主键彻底删除一条系统操作日志表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统操作日志表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.message("彻底删除该系统操作日志数据");
    }

    @LogOperation
    @Operation(description = "导出操作日志列表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryLog", description = "操作日志查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(Log queryLog, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryLog, response);
    }

}