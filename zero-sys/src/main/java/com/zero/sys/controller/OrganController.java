package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.entity.Organ;
import com.zero.sys.service.OrganService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统组织机构表的数据交互控制器
 *
 * @author herenpeng
 * @since 2023-09-03 16:42
 */
@Api(value = "系统组织机构表操作接口", tags = "OrganController")
@RestController
@RequestMapping("organ")
public class OrganController extends BaseController<OrganService, Organ> {

    @LogOperation
    @ApiOperation(value = "分页查询系统组织机构表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryOrgan", value = "系统组织机构表查询条件", dataTypeClass = Organ.class)
    })
    @GetMapping("page/{currentPage}")
    public ResponseData<IPage<Organ>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Organ queryOrgan) throws Exception {
        IPage<Organ> page = baseService.page(currentPage, size, queryOrgan);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "查询所有的系统组织机构表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryOrgan", value = "系统组织机构表查询条件", dataTypeClass = Organ.class)
    })
    @GetMapping("list")
    public ResponseData<List<Organ>> list(Organ queryOrgan) throws Exception {
        return ResponseData.ok(baseService.list(queryOrgan));
    }


    @LogOperation
    @ApiOperation(value = "分页查询逻辑删除的系统组织机构表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryOrgan", value = "系统组织机构表查询条件", dataTypeClass = Organ.class)
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData<IPage<Organ>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            Organ queryOrgan) throws Exception {
        IPage<Organ> page = baseService.recoverPage(currentPage, size, queryOrgan);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "通过主键恢复逻辑删除的系统组织机构表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统组织机构表ID", dataTypeClass = Integer.class, required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }


    @LogOperation
    @ApiOperation(value = "通过主键彻底删除一条系统组织机构表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统组织机构表ID", dataTypeClass = Integer.class, required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.ok().message("彻底删除该系统组织机构表数据");
    }


    @LogOperation
    @ApiOperation(value = "导出系统组织机构表数据的Excel文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryOrgan", value = "系统组织机构表查询条件", dataTypeClass = Organ.class),
            @ApiImplicitParam(name = "response", value = "HttpServletResponse对象", dataTypeClass = HttpServletResponse.class),
    })
    @GetMapping("export/excel")
    public void exportExcel(Organ queryOrgan, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryOrgan, response);
    }

}