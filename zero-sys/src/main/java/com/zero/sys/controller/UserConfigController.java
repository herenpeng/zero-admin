package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.entity.UserConfig;
import com.zero.sys.service.UserConfigService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统用户配置表的数据交互控制器
 *
 * @author herenpeng
 * @since 2021-06-06 18:28
 */
@Api(value = "系统用户配置表操作接口", tags = "UserConfigController")
@RestController
@RequestMapping("user/config")
public class UserConfigController extends BaseController<UserConfigService, UserConfig> {

    @LogOperation
    @ApiOperation(value = "分页查询系统用户配置表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryUserConfig", value = "系统用户配置表查询条件", dataTypeClass = UserConfig.class)
    })
    @GetMapping("page/{currentPage}")
    public ResponseData<IPage<UserConfig>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            UserConfig queryUserConfig) throws Exception {
        IPage<UserConfig> page = baseService.page(currentPage, size, queryUserConfig);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "查询所有的系统用户配置表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryUserConfig", value = "系统用户配置表查询条件", dataTypeClass = UserConfig.class)
    })
    @GetMapping("list")
    public ResponseData<List<UserConfig>> list(UserConfig queryUserConfig) throws Exception {
        return ResponseData.ok(baseService.list(queryUserConfig));
    }


    @LogOperation
    @ApiOperation(value = "分页查询逻辑删除的系统用户配置表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryUserConfig", value = "系统用户配置表查询条件", dataTypeClass = UserConfig.class)
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData<IPage<UserConfig>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            UserConfig queryUserConfig) throws Exception {
        IPage<UserConfig> page = baseService.recoverPage(currentPage, size, queryUserConfig);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "通过主键恢复逻辑删除的系统用户配置表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统用户配置表ID", dataTypeClass = Integer.class, required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }


    @LogOperation
    @ApiOperation(value = "通过主键彻底删除一条系统用户配置表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统用户配置表ID", dataTypeClass = Integer.class, required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.ok().message("彻底删除该系统用户配置表数据");
    }


    @LogOperation
    @ApiOperation(value = "导出系统用户配置表数据的Excel文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryUserConfig", value = "系统用户配置表查询条件", dataTypeClass = UserConfig.class),
            @ApiImplicitParam(name = "response", value = "HttpServletResponse对象", dataTypeClass = HttpServletResponse.class),
    })
    @GetMapping("export/excel")
    public void exportExcel(UserConfig queryUserConfig, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryUserConfig, response);
    }

}