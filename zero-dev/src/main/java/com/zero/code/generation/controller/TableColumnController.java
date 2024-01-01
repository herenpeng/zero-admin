package com.zero.code.generation.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.code.generation.entity.TableColumn;
import com.zero.code.generation.service.TableColumnService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统数据库表字段信息表的数据交互控制器
 *
 * @author herenpeng
 * @since 2021-03-28 18:11
 */
@Tag(description = "系统数据库表字段信息表操作接口", name = "TableColumnController")
@RestController
@RequestMapping("table/column")
public class TableColumnController extends BaseController<TableColumnService, TableColumn> {

    @LogOperation
    @Operation(description = "分页查询系统数据库表字段信息表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryTableColumn", description = "系统数据库表字段信息表查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData<IPage<TableColumn>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            TableColumn queryTableColumn) throws Exception {
        IPage<TableColumn> page = baseService.page(currentPage, size, queryTableColumn);
        return ResponseData.ok(page);
    }


    @LogOperation
    @Operation(description = "查询所有的系统数据库表字段信息表数据")
    @Parameters({
            @Parameter(name = "queryTableColumn", description = "系统数据库表字段信息表查询条件")
    })
    @GetMapping("list")
    public ResponseData<List<TableColumn>> list(TableColumn queryTableColumn) throws Exception {
        return ResponseData.ok(baseService.list(queryTableColumn));
    }


    @LogOperation
    @Operation(description = "分页查询逻辑删除的系统数据库表字段信息表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryTableColumn", description = "系统数据库表字段信息表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData<IPage<TableColumn>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            TableColumn queryTableColumn) throws Exception {
        IPage<TableColumn> page = baseService.recoverPage(currentPage, size, queryTableColumn);
        return ResponseData.ok(page);
    }


    @LogOperation
    @Operation(description = "通过主键恢复逻辑删除的系统数据库表字段信息表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统数据库表字段信息表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }


    @LogOperation
    @Operation(description = "通过主键彻底删除一条系统数据库表字段信息表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统数据库表字段信息表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.message("彻底删除该系统数据库表字段信息表数据");
    }

    @LogOperation
    @Operation(description = "通过tableInfoId获取所有的字段信息")
    @Parameters({
            @Parameter(name = "tableInfoId", description = "tableInfo主键", required = true)
    })
    @GetMapping("table/info/{tableInfoId}")
    public ResponseData<List<TableColumn>> getByTableInfoId(@PathVariable("tableInfoId") Integer tableInfoId) throws Exception {
        List<TableColumn> tableColumns = baseService.getByTableInfoId(tableInfoId);
        return ResponseData.ok(tableColumns);
    }


    @LogOperation
    @Operation(description = "导出系统数据库表字段信息表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryTableColumn", description = "系统数据库表字段信息表查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(TableColumn queryTableColumn, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryTableColumn, response);
    }

}