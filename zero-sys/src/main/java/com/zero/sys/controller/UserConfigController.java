package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.AppLog;
import com.zero.common.base.controller.BaseController;
import com.zero.common.domain.ResponseEntity;
import com.zero.sys.entity.UserConfig;
import com.zero.sys.service.UserConfigService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统用户配置表的数据交互控制器
 *
 * @author herenpeng
 * @since 2021-06-06 18:28
 */
@Tag(description = "系统用户配置表操作接口", name = "UserConfigController")
@RestController
@RequestMapping("user/config")
public class UserConfigController extends BaseController<UserConfigService, UserConfig> {

    @AppLog
    @Operation(description = "分页查询系统用户配置表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryUserConfig", description = "系统用户配置表查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseEntity<IPage<UserConfig>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            UserConfig queryUserConfig) throws Exception {
        IPage<UserConfig> page = baseService.page(currentPage, size, queryUserConfig);
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "查询所有的系统用户配置表数据")
    @Parameters({
            @Parameter(name = "queryUserConfig", description = "系统用户配置表查询条件")
    })
    @GetMapping("list")
    public ResponseEntity<List<UserConfig>> list(UserConfig queryUserConfig) throws Exception {
        return ResponseEntity.ok(baseService.list(queryUserConfig));
    }


    @AppLog
    @Operation(description = "更新用户配置数据")
    @Parameters({
            @Parameter(name = "key", description = "常量键值"),
            @Parameter(name = "value", description = "用户配置值")
    })
    @PutMapping("key")
    public ResponseEntity<Void> key(@RequestParam("key") String key, @RequestParam("value") String value) throws Exception {
        baseService.updateByKey(key, value);
        return ResponseEntity.ok();
    }


    @AppLog
    @Operation(description = "分页查询逻辑删除的系统用户配置表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryUserConfig", description = "系统用户配置表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseEntity<IPage<UserConfig>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            UserConfig queryUserConfig) throws Exception {
        IPage<UserConfig> page = baseService.recoverPage(currentPage, size, queryUserConfig);
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "通过主键恢复逻辑删除的系统用户配置表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统用户配置表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseEntity<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseEntity.ok();
    }


    @AppLog
    @Operation(description = "通过主键彻底删除一条系统用户配置表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统用户配置表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseEntity<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseEntity.message("彻底删除该系统用户配置表数据");
    }


    @AppLog
    @Operation(description = "导出系统用户配置表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryUserConfig", description = "系统用户配置表查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(UserConfig queryUserConfig, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryUserConfig, response);
    }

}