package com.zero.code.generation.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.code.generation.entity.TableInfo;
import com.zero.code.generation.service.TableInfoService;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 系统数据库表信息控制器
 *
 * @author herenpeng
 * @since 2020-11-08 20:24
 */
@Api(value = "系统数据库表信息操作接口", tags = "TableInfoController")
@RestController
@RequestMapping("table/info")
public class TableInfoController extends BaseController<TableInfoService, TableInfo> {

    @LogOperation
    @ApiOperation(value = "分页查询系统数据库表信息数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10"),
            @ApiImplicitParam(name = "queryUser", value = "系统数据库表信息查询条件")
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
    @ApiOperation(value = "获取还没有插入数据库中的数据库表信息")
    @GetMapping("not/list")
    public ResponseData<List<TableInfo>> getNotAddList() throws Exception {
        List<TableInfo> list = baseService.getNotAddList();
        return ResponseData.ok(list);
    }


    @LogOperation
    @ApiOperation(value = "生成代码")
    @PostMapping("code/generation/{id}")
    public ResponseData<Void> codeGeneration(@PathVariable("id") Integer id) throws Exception {
        baseService.codeGeneration(id);
        return ResponseData.ok().message("代码生成成功");
    }

    @LogOperation
    @ApiOperation(value = "分页查询逻辑删除的系统数据库表信息表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10"),
            @ApiImplicitParam(name = "queryTableInfo", value = "系统数据库表信息表查询条件")
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
    @ApiOperation(value = "通过主键恢复逻辑删除的系统数据库表信息表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统数据库表信息表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }

    @LogOperation
    @ApiOperation(value = "通过主键彻底删除一条系统数据库表信息表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统数据库表信息表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.ok().message("彻底删除该系统数据库表信息数据");
    }


}
