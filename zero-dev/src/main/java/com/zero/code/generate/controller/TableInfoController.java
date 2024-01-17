package com.zero.code.generate.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.code.generate.entity.TableInfo;
import com.zero.code.generate.service.TableInfoService;
import com.zero.common.annotation.AppLog;
import com.zero.common.base.controller.BaseController;
import com.zero.common.domain.ResponseEntity;
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

    @AppLog
    @Operation(description = "分页查询系统数据库表信息数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryUser", description = "系统数据库表信息查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseEntity<IPage<TableInfo>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            TableInfo queryTableInfo) throws Exception {
        IPage<TableInfo> page = baseService.page(currentPage, size, queryTableInfo);
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "获取还没有插入数据库中的数据库表信息")
    @GetMapping("not/list")
    public ResponseEntity<List<TableInfo>> getNotAddList() throws Exception {
        List<TableInfo> list = baseService.getNotAddList();
        return ResponseEntity.ok(list);
    }


    @AppLog
    @Operation(description = "生成代码")
    @PostMapping("code/generate/{id}")
    public ResponseEntity<Void> codeGenerate(@PathVariable("id") Integer id) throws Exception {
        baseService.codeGenerate(id);
        return ResponseEntity.message("代码生成成功");
    }

    @AppLog
    @Operation(description = "分页查询逻辑删除的系统数据库表信息表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryTableInfo", description = "系统数据库表信息表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseEntity<IPage<TableInfo>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            TableInfo queryTableInfo) throws Exception {
        IPage<TableInfo> page = baseService.recoverPage(currentPage, size, queryTableInfo);
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "通过主键恢复逻辑删除的系统数据库表信息表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统数据库表信息表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseEntity<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseEntity.ok();
    }

    @AppLog
    @Operation(description = "通过主键彻底删除一条系统数据库表信息表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统数据库表信息表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseEntity<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseEntity.message("彻底删除该系统数据库表信息数据");
    }


}
