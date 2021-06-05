package com.zero.code.generation.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.code.generation.entity.TableColumn;
import com.zero.code.generation.service.TableColumnService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统数据库表字段信息表的数据交互控制器
 *
 * @author herenpeng
 * @since 2021-03-28 18:11
 */
@Api(value = "系统数据库表字段信息表操作接口", tags = "TableColumnController")
@RestController
@RequestMapping("table/column")
public class TableColumnController extends BaseController<TableColumnService, TableColumn> {

    @LogOperation
    @ApiOperation(value = "分页查询系统数据库表字段信息表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryTableColumn", value = "系统数据库表字段信息表查询条件", dataTypeClass = TableColumn.class)
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
    @ApiOperation(value = "查询所有的系统数据库表字段信息表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryTableColumn", value = "系统数据库表字段信息表查询条件", dataTypeClass = TableColumn.class)
    })
    @GetMapping("list")
    public ResponseData<List<TableColumn>> list(TableColumn queryTableColumn) throws Exception {
        return ResponseData.ok(baseService.list(queryTableColumn));
    }


    @LogOperation
    @ApiOperation(value = "分页查询逻辑删除的系统数据库表字段信息表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryTableColumn", value = "系统数据库表字段信息表查询条件", dataTypeClass = TableColumn.class)
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
    @ApiOperation(value = "通过主键恢复逻辑删除的系统数据库表字段信息表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统数据库表字段信息表ID", dataTypeClass = Integer.class, required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }


    @LogOperation
    @ApiOperation(value = "通过主键彻底删除一条系统数据库表字段信息表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统数据库表字段信息表ID", dataTypeClass = Integer.class, required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.ok().message("彻底删除该系统数据库表字段信息表数据");
    }

    @LogOperation
    @ApiOperation(value = "通过tableInfoId获取所有的字段信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "tableInfoId", value = "tableInfo主键", dataTypeClass = Integer.class, required = true)
    })
    @GetMapping("table/info/{tableInfoId}")
    public ResponseData<List<TableColumn>> getByTableInfoId(@PathVariable("tableInfoId") Integer tableInfoId) throws Exception {
        List<TableColumn> tableColumns = baseService.getByTableInfoId(tableInfoId);
        return ResponseData.ok().data(tableColumns);
    }


    @LogOperation
    @ApiOperation(value = "导出系统数据库表字段信息表数据的Excel文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryTableColumn", value = "系统数据库表字段信息表查询条件", dataTypeClass = TableColumn.class),
            @ApiImplicitParam(name = "response", value = "HttpServletResponse对象", dataTypeClass = HttpServletResponse.class),
    })
    @GetMapping("export/excel")
    public void exportExcel(TableColumn queryTableColumn, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryTableColumn, response);
    }

}