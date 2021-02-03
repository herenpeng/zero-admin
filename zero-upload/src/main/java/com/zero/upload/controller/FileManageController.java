package com.zero.upload.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.upload.entity.FileManage;
import com.zero.upload.service.FileManageService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 文件资源管理表的数据交互控制器
 *
 * @author herenpeng
 * @since 2021-01-30 18:46
 */
@Api(value = "文件资源管理表操作接口", tags = "FileManageController")
@RestController
@RequestMapping("file/manage")
public class FileManageController extends BaseController<FileManageService, FileManage> {

    @LogOperation
    @ApiOperation(value = "分页查询文件资源管理表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryFileManage", value = "文件资源管理表查询条件", dataTypeClass = FileManage.class)
    })
    @GetMapping("page/{currentPage}")
    public ResponseData<IPage<FileManage>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            FileManage queryFileManage) throws Exception {
        IPage<FileManage> page = baseService.page(currentPage, size, queryFileManage);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "查询所有的文件资源管理表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryFileManage", value = "文件资源管理表查询条件", dataTypeClass = FileManage.class)
    })
    @GetMapping("list")
    public ResponseData<List<FileManage>> list(FileManage queryFileManage) throws Exception {
        return ResponseData.ok(baseService.list(queryFileManage));
    }


    @LogOperation
    @ApiOperation(value = "分页查询逻辑删除的文件资源管理表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryFileManage", value = "文件资源管理表查询条件", dataTypeClass = FileManage.class)
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData<IPage<FileManage>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            FileManage queryFileManage) throws Exception {
        IPage<FileManage> page = baseService.recoverPage(currentPage, size, queryFileManage);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "通过主键恢复逻辑删除的文件资源管理表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "文件资源管理表ID", dataTypeClass = Integer.class, required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }


    @LogOperation
    @ApiOperation(value = "通过主键彻底删除一条文件资源管理表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "文件资源管理表ID", dataTypeClass = Integer.class, required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.ok().message("彻底删除该文件资源管理表数据");
    }


    @LogOperation
    @ApiOperation(value = "导出文件资源管理表数据的Excel文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryFileManage", value = "文件资源管理表查询条件", dataTypeClass = FileManage.class),
            @ApiImplicitParam(name = "response", value = "HttpServletResponse对象", dataTypeClass = HttpServletResponse.class),
    })
    @GetMapping("export/excel")
    public void exportExcel(FileManage queryFileManage, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryFileManage, response);
    }

    @LogOperation
    @ApiOperation(value = "通过主键备份一个文件资源")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "文件资源管理表主键", dataTypeClass = Integer.class, required = true)
    })
    @PostMapping("bak/{id}")
    public ResponseData<Void> bak(@PathVariable Integer id) throws Exception {
        baseService.bak(id);
        return ResponseData.ok().message("备份成功");
    }

    @LogOperation
    @ApiOperation(value = "通过主键替换一个文件资源")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "文件资源管理表主键", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "file", value = "文件资源", dataTypeClass = MultipartFile.class, required = true)
    })
    @PostMapping("replace")
    public ResponseData<Void> replace(@RequestParam("id") Integer id, @RequestParam("file") MultipartFile file) throws Exception {
        baseService.replace(id, file);
        return ResponseData.ok().message("替换成功");
    }

}