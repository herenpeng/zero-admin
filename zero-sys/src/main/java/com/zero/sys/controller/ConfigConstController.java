package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.domain.ResponseEntity;
import com.zero.sys.entity.ConfigConst;
import com.zero.sys.service.ConfigConstService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 系统配置常量表的数据交互控制器
 *
 * @author herenpeng
 * @since 2021-06-05 22:29
 */
@Tag(description = "系统配置常量表操作接口", name = "ConfigConstController")
@RestController
@RequestMapping("config/const")
public class ConfigConstController extends BaseController<ConfigConstService, ConfigConst> {

    @LogOperation
    @Operation(description = "分页查询系统配置常量表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryConfigConst", description = "系统配置常量表查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseEntity<IPage<ConfigConst>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            ConfigConst queryConfigConst) throws Exception {
        IPage<ConfigConst> page = baseService.page(currentPage, size, queryConfigConst);
        return ResponseEntity.ok(page);
    }


    @LogOperation
    @Operation(description = "查询所有的系统配置常量表数据")
    @Parameters({
            @Parameter(name = "queryConfigConst", description = "系统配置常量表查询条件")
    })
    @GetMapping("list")
    public ResponseEntity<List<ConfigConst>> list(ConfigConst queryConfigConst) throws Exception {
        return ResponseEntity.ok(baseService.list(queryConfigConst));
    }


    @LogOperation
    @Operation(description = "查询所有的常量键值数据")
    @Parameters({
            @Parameter(name = "key", description = "常量键值"),
            @Parameter(name = "userable", description = "是否允许用户配置")
    })
    @GetMapping("list/key")
    public ResponseEntity<List<String>> keyList(String key, Boolean userable) throws Exception {
        return ResponseEntity.ok(baseService.getKeyList(key, userable));
    }

    @LogOperation
    @Operation(description = "查询常量键值配置数据")
    @Parameters({

    })
    @GetMapping("key")
    public ResponseEntity<String> key(String key) throws Exception {
        return ResponseEntity.ok(baseService.getByKey(key));
    }


    @LogOperation
    @Operation(description = "批量查询常量键值配置数据")
    @Parameters({
            @Parameter(name = "keys", description = "常量键值集合")
    })
    @PostMapping("keys")
    public ResponseEntity<Map<String, String>> keys(@RequestBody List<String> keys) throws Exception {
        return ResponseEntity.ok(baseService.getByKeys(keys));
    }


    @LogOperation
    @Operation(description = "分页查询逻辑删除的系统配置常量表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryConfigConst", description = "系统配置常量表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseEntity<IPage<ConfigConst>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            ConfigConst queryConfigConst) throws Exception {
        IPage<ConfigConst> page = baseService.recoverPage(currentPage, size, queryConfigConst);
        return ResponseEntity.ok(page);
    }


    @LogOperation
    @Operation(description = "通过主键恢复逻辑删除的系统配置常量表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统配置常量表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseEntity<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseEntity.ok();
    }


    @LogOperation
    @Operation(description = "通过主键彻底删除一条系统配置常量表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统配置常量表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseEntity<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseEntity.message("彻底删除该系统配置常量表数据");
    }


    @LogOperation
    @Operation(description = "导出系统配置常量表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryConfigConst", description = "系统配置常量表查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(ConfigConst queryConfigConst, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryConfigConst, response);
    }

}