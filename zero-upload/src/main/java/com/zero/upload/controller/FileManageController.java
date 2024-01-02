package com.zero.upload.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.domain.ResponseEntity;
import com.zero.upload.entity.FileManage;
import com.zero.upload.service.FileManageService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 文件资源管理表的数据交互控制器
 *
 * @author herenpeng
 * @since 2021-01-30 18:46
 */
@Tag(description = "文件资源管理表操作接口", name = "FileManageController")
@RestController
@RequestMapping("file/manage")
public class FileManageController extends BaseController<FileManageService, FileManage> {

    @LogOperation
    @Operation(description = "分页查询文件资源管理表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryFileManage", description = "文件资源管理表查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseEntity<IPage<FileManage>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            FileManage queryFileManage) throws Exception {
        IPage<FileManage> page = baseService.page(currentPage, size, queryFileManage);
        return ResponseEntity.ok(page);
    }


    @LogOperation
    @Operation(description = "查询所有的文件资源管理表数据")
    @Parameters({
            @Parameter(name = "queryFileManage", description = "文件资源管理表查询条件")
    })
    @GetMapping("list")
    public ResponseEntity<List<FileManage>> list(FileManage queryFileManage) throws Exception {
        return ResponseEntity.ok(baseService.list(queryFileManage));
    }


    @LogOperation
    @Operation(description = "分页查询逻辑删除的文件资源管理表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryFileManage", description = "文件资源管理表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseEntity<IPage<FileManage>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            FileManage queryFileManage) throws Exception {
        IPage<FileManage> page = baseService.recoverPage(currentPage, size, queryFileManage);
        return ResponseEntity.ok(page);
    }


    @LogOperation
    @Operation(description = "通过主键恢复逻辑删除的文件资源管理表数据")
    @Parameters({
            @Parameter(name = "id", description = "文件资源管理表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseEntity<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseEntity.ok();
    }


    @LogOperation
    @Operation(description = "通过主键彻底删除一条文件资源管理表数据")
    @Parameters({
            @Parameter(name = "id", description = "文件资源管理表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseEntity<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseEntity.message("彻底删除该文件资源管理表数据");
    }


    @LogOperation
    @Operation(description = "导出文件资源管理表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryFileManage", description = "文件资源管理表查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(FileManage queryFileManage, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryFileManage, response);
    }

    @LogOperation
    @Operation(description = "通过主键备份一个文件资源")
    @Parameters({
            @Parameter(name = "id", description = "文件资源管理表主键", required = true)
    })
    @PostMapping("bak/{id}")
    public ResponseEntity<Void> bak(@PathVariable Integer id) throws Exception {
        baseService.bak(id);
        return ResponseEntity.message("备份成功");
    }

    @LogOperation
    @Operation(description = "通过主键替换一个文件资源")
    @Parameters({
            @Parameter(name = "id", description = "文件资源管理表主键", required = true),
            @Parameter(name = "file", description = "文件资源", required = true)
    })
    @PostMapping("replace")
    public ResponseEntity<Void> replace(@RequestParam("id") Integer id, @RequestParam("file") MultipartFile file) throws Exception {
        baseService.replace(id, file);
        return ResponseEntity.message("替换成功");
    }

}