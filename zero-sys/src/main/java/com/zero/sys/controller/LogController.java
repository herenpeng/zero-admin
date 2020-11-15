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
 * @author herenpeng
 * @since 2020-10-30 22:29
 */
@Api(value = "操作日志接口", tags = "LogController")
@RestController
@RequestMapping("log")
public class LogController extends BaseController<LogService, Log> {


    @LogOperation
    @ApiOperation(value = "分页查询操作日志数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "8"),
            @ApiImplicitParam(name = "queryLog", value = "操作日志查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "8") Integer size,
            Log queryLog) throws Exception {
        IPage<Log> page = baseService.page(currentPage, size, queryLog);
        return ResponseData.ok(page);
    }

}
