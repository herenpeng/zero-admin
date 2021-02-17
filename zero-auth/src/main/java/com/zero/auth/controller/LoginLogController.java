package com.zero.auth.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.LoginLog;
import com.zero.auth.service.LoginLogService;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统账号登录日志表的数据交互控制器
 *
 * @author herenpeng
 * @since 2021-02-17 10:04
 */
@Api(value = "系统账号登录日志表操作接口", tags = "LoginLogController")
@RestController
@RequestMapping("login/log")
public class LoginLogController extends BaseController<LoginLogService, LoginLog> {

    @LogOperation
    @ApiOperation(value = "分页查询系统账号登录日志表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryLoginLog", value = "系统账号登录日志表查询条件", dataTypeClass = LoginLog.class)
    })
    @GetMapping("page/{currentPage}")
    public ResponseData<IPage<LoginLog>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            LoginLog queryLoginLog) throws Exception {
        IPage<LoginLog> page = baseService.page(currentPage, size, queryLoginLog);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "查询所有的系统账号登录日志表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryLoginLog", value = "系统账号登录日志表查询条件", dataTypeClass = LoginLog.class)
    })
    @GetMapping("list")
    public ResponseData<List<LoginLog>> list(LoginLog queryLoginLog) throws Exception {
        return ResponseData.ok(baseService.list(queryLoginLog));
    }


    @LogOperation
    @ApiOperation(value = "分页查询逻辑删除的系统账号登录日志表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryLoginLog", value = "系统账号登录日志表查询条件", dataTypeClass = LoginLog.class)
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData<IPage<LoginLog>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            LoginLog queryLoginLog) throws Exception {
        IPage<LoginLog> page = baseService.recoverPage(currentPage, size, queryLoginLog);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "通过主键恢复逻辑删除的系统账号登录日志表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统账号登录日志表ID", dataTypeClass = Integer.class, required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }


    @LogOperation
    @ApiOperation(value = "通过主键彻底删除一条系统账号登录日志表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统账号登录日志表ID", dataTypeClass = Integer.class, required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.ok().message("彻底删除该系统账号登录日志表数据");
    }


    @LogOperation
    @ApiOperation(value = "导出系统账号登录日志表数据的Excel文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryLoginLog", value = "系统账号登录日志表查询条件", dataTypeClass = LoginLog.class),
            @ApiImplicitParam(name = "response", value = "HttpServletResponse对象", dataTypeClass = HttpServletResponse.class),
    })
    @GetMapping("export/excel")
    public void exportExcel(LoginLog queryLoginLog, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryLoginLog, response);
    }

    @LogOperation
    @ApiOperation(value = "获取当前在线的用户记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId", value = "当前在线的用户主键", dataTypeClass = Integer.class, required = true)
    })
    @GetMapping("online/{userId}")
    public ResponseData<List<LoginLog>> online(@PathVariable("userId") Integer userId) throws Exception {
        List<LoginLog> loginLogs = baseService.online(userId);
        return ResponseData.ok(loginLogs);
    }

    @LogOperation
    @ApiOperation(value = "通过tokenId下线用户")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId", value = "指定下线的用户主键", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "tokenId", value = "指定下线的用户tokenId", dataTypeClass = String.class, required = true)
    })
    @PutMapping("offline/{userId}")
    public ResponseData<Void> offline(
            @PathVariable("userId") Integer userId,
            @RequestParam("tokenId") String tokenId) throws Exception {
        baseService.offline(userId, tokenId);
        return ResponseData.ok();
    }

}