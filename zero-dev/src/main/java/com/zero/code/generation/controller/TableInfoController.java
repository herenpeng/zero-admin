package com.zero.code.generation.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.code.generation.entity.TableInfo;
import com.zero.code.generation.service.TableInfoService;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 系统数据库表信息控制器
 *
 * @author herenpeng
 * @since 2020-11-08 20:24
 */
@Tag(description = "系统数据库表信息操作接口", name = "TableInfoController")
@RestController
@RequestMapping("table/info")
public class TableInfoController extends BaseController<TableInfoService, TableInfo> {

    @LogOperation
    @Operation(description = "分页查询系统数据库表信息数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryUser", description = "系统数据库表信息查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData<IPage<TableInfo>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            TableInfo queryTableInfo) throws Exception {
        IPage<TableInfo> page = baseService.page(currentPage, size, queryTableInfo);
        return ResponseData.ok(page);
    }


    @LogOperation
    @Operation(description = "获取还没有插入数据库中的数据库表信息")
    @GetMapping("not/list")
    public ResponseData<List<TableInfo>> getNotAddList() throws Exception {
        List<TableInfo> list = baseService.getNotAddList();
        return ResponseData.ok(list);
    }


    @LogOperation
    @Operation(description = "生成代码")
    @PostMapping("code/generation/{id}")
    public ResponseData<Void> codeGeneration(@PathVariable("id") Integer id) throws Exception {
        baseService.codeGeneration(id);
        return ResponseData.message("代码生成成功");
    }

    @LogOperation
    @Operation(description = "分页查询逻辑删除的系统数据库表信息表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryTableInfo", description = "系统数据库表信息表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData<IPage<TableInfo>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            TableInfo queryTableInfo) throws Exception {
        IPage<TableInfo> page = baseService.recoverPage(currentPage, size, queryTableInfo);
        return ResponseData.ok(page);
    }


    @LogOperation
    @Operation(description = "通过主键恢复逻辑删除的系统数据库表信息表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统数据库表信息表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }

    @LogOperation
    @Operation(description = "通过主键彻底删除一条系统数据库表信息表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统数据库表信息表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.message("彻底删除该系统数据库表信息数据");
    }


}
