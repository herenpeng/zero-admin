package com.zero.auth.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.LoginLog;
import com.zero.auth.service.LoginLogService;
import com.zero.common.annotation.AppLog;
import com.zero.common.base.controller.BaseController;
import com.zero.common.domain.ResponseEntity;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统账号登录日志表的数据交互控制器
 *
 * @author herenpeng
 * @since 2021-02-17 10:04
 */
@Tag(description = "系统账号登录日志表操作接口", name = "LoginLogController")
@RestController
@RequestMapping("login/log")
public class LoginLogController extends BaseController<LoginLogService, LoginLog> {

    @AppLog
    @Operation(description = "分页查询系统账号登录日志表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryLoginLog", description = "系统账号登录日志表查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseEntity<IPage<LoginLog>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            LoginLog queryLoginLog) throws Exception {
        IPage<LoginLog> page = baseService.page(currentPage, size, queryLoginLog);
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "查询所有的系统账号登录日志表数据")
    @Parameters({
            @Parameter(name = "queryLoginLog", description = "系统账号登录日志表查询条件")
    })
    @GetMapping("list")
    public ResponseEntity<List<LoginLog>> list(LoginLog queryLoginLog) throws Exception {
        return ResponseEntity.ok(baseService.list(queryLoginLog));
    }


    @AppLog
    @Operation(description = "分页查询逻辑删除的系统账号登录日志表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryLoginLog", description = "系统账号登录日志表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseEntity<IPage<LoginLog>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            LoginLog queryLoginLog) throws Exception {
        IPage<LoginLog> page = baseService.recoverPage(currentPage, size, queryLoginLog);
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "通过主键恢复逻辑删除的系统账号登录日志表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统账号登录日志表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseEntity<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseEntity.ok();
    }


    @AppLog
    @Operation(description = "通过主键彻底删除一条系统账号登录日志表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统账号登录日志表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseEntity<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseEntity.message("彻底删除该系统账号登录日志表数据");
    }


    @AppLog
    @Operation(description = "导出系统账号登录日志表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryLoginLog", description = "系统账号登录日志表查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(LoginLog queryLoginLog, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryLoginLog, response);
    }

    @AppLog
    @Operation(description = "获取当前在线的用户记录")
    @Parameters({
            @Parameter(name = "userId", description = "当前在线的用户主键", required = true)
    })
    @GetMapping("online/{userId}")
    public ResponseEntity<List<LoginLog>> online(@PathVariable("userId") Integer userId) throws Exception {
        List<LoginLog> loginLogs = baseService.online(userId);
        return ResponseEntity.ok(loginLogs);
    }

    @AppLog
    @Operation(description = "通过tokenId下线用户")
    @Parameters({
            @Parameter(name = "userId", description = "指定下线的用户主键", required = true),
            @Parameter(name = "tokenId", description = "指定下线的用户tokenId", required = true)
    })
    @PutMapping("offline/{userId}")
    public ResponseEntity<Void> offline(
            @PathVariable("userId") Integer userId,
            @RequestParam("tokenId") String tokenId) throws Exception {
        baseService.offline(userId, tokenId);
        return ResponseEntity.ok();
    }

}