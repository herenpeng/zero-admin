package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.entity.ConfigConst;
import com.zero.sys.service.ConfigConstService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 系统配置常量表的数据交互控制器
 *
 * @author herenpeng
 * @since 2021-06-05 22:29
 */
@Api(value = "系统配置常量表操作接口", tags = "ConfigConstController")
@RestController
@RequestMapping("config/const")
public class ConfigConstController extends BaseController<ConfigConstService, ConfigConst> {

    @LogOperation
    @ApiOperation(value = "分页查询系统配置常量表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryConfigConst", value = "系统配置常量表查询条件", dataTypeClass = ConfigConst.class)
    })
    @GetMapping("page/{currentPage}")
    public ResponseData<IPage<ConfigConst>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            ConfigConst queryConfigConst) throws Exception {
        IPage<ConfigConst> page = baseService.page(currentPage, size, queryConfigConst);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "查询所有的系统配置常量表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryConfigConst", value = "系统配置常量表查询条件", dataTypeClass = ConfigConst.class)
    })
    @GetMapping("list")
    public ResponseData<List<ConfigConst>> list(ConfigConst queryConfigConst) throws Exception {
        return ResponseData.ok(baseService.list(queryConfigConst));
    }


    @LogOperation
    @ApiOperation(value = "查询所有的常量键值数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "key", value = "常量键值", dataTypeClass = String.class),
            @ApiImplicitParam(name = "userable", value = "是否允许用户配置", dataTypeClass = Boolean.class)
    })
    @GetMapping("list/key")
    public ResponseData<List<String>> keyList(String key, Boolean userable) throws Exception {
        return ResponseData.ok(baseService.getKeyList(key, userable));
    }

    @LogOperation
    @ApiOperation(value = "查询常量键值配置数据")
    @ApiImplicitParams({

    })
    @GetMapping("key")
    public ResponseData<String> key(String key) throws Exception {
        return ResponseData.ok(baseService.getByKey(key));
    }


    @LogOperation
    @ApiOperation(value = "批量查询常量键值配置数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "keys", value = "常量键值集合", dataTypeClass = String.class)
    })
    @PostMapping("keys")
    public ResponseData<Map<String, String>> keys(@RequestBody List<String> keys) throws Exception {
        return ResponseData.ok(baseService.getByKeys(keys));
    }


    @LogOperation
    @ApiOperation(value = "分页查询逻辑删除的系统配置常量表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryConfigConst", value = "系统配置常量表查询条件", dataTypeClass = ConfigConst.class)
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData<IPage<ConfigConst>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            ConfigConst queryConfigConst) throws Exception {
        IPage<ConfigConst> page = baseService.recoverPage(currentPage, size, queryConfigConst);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "通过主键恢复逻辑删除的系统配置常量表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统配置常量表ID", dataTypeClass = Integer.class, required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }


    @LogOperation
    @ApiOperation(value = "通过主键彻底删除一条系统配置常量表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统配置常量表ID", dataTypeClass = Integer.class, required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.ok().message("彻底删除该系统配置常量表数据");
    }


    @LogOperation
    @ApiOperation(value = "导出系统配置常量表数据的Excel文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryConfigConst", value = "系统配置常量表查询条件", dataTypeClass = ConfigConst.class),
            @ApiImplicitParam(name = "response", value = "HttpServletResponse对象", dataTypeClass = HttpServletResponse.class),
    })
    @GetMapping("export/excel")
    public void exportExcel(ConfigConst queryConfigConst, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryConfigConst, response);
    }

}