package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.entity.Log;
import com.zero.sys.service.LogService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

/**
 * 系统操作日志表的数据交互控制器
 *
 * @author herenpeng
 * @since 2020-12-01 22:31
 */
@Api(value = "系统操作日志表操作接口", tags = "LogController")
@RestController
@RequestMapping("log")
public class LogController extends BaseController<LogService, Log> {

    @LogOperation
    @ApiOperation(value = "分页查询系统操作日志表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "8"),
            @ApiImplicitParam(name = "queryLog", value = "系统操作日志表查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "8") Integer size,
            Log queryLog) throws Exception {
        IPage<Log> page = baseService.page(currentPage, size, queryLog);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "查询所有的系统操作日志表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryLog", value = "系统操作日志表查询条件")
    })
    @GetMapping("list")
    public ResponseData list(Log queryLog) throws Exception {
        return ResponseData.ok(baseService.list(queryLog));
    }


    @LogOperation
    @ApiOperation(value = "分页查询逻辑删除的系统操作日志表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10"),
            @ApiImplicitParam(name = "queryLog", value = "系统操作日志表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Log queryLog) throws Exception {
        IPage<Log> page = baseService.recoverPage(currentPage, size, queryLog);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "通过主键恢复逻辑删除的系统操作日志表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统操作日志表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }

    @LogOperation
    @ApiOperation(value = "通过主键彻底删除一条系统操作日志表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统操作日志表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.ok().message("彻底删除该系统操作日志数据");
    }

}