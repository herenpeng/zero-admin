package com.zero.quartz.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.AppLog;
import com.zero.common.base.controller.BaseController;
import com.zero.common.domain.ResponseEntity;
import com.zero.quartz.entity.QuartzJob;
import com.zero.quartz.service.QuartzJobService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 定时任务表的数据交互控制器
 *
 * @author root
 * @since 2025-02-05 21:36
 */
@Tag(description = "定时任务表操作接口", name = "QuartzJobController")
@RestController
@RequestMapping("quartz/job")
public class QuartzJobController extends BaseController<QuartzJobService, QuartzJob> {

    @AppLog
    @Operation(description = "分页查询定时任务表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryQuartzJob", description = "定时任务表查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseEntity<IPage<QuartzJob>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            QuartzJob queryQuartzJob) throws Exception {
        IPage<QuartzJob> page = baseService.page(currentPage, size, queryQuartzJob);
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "查询所有的定时任务表数据")
    @Parameters({
            @Parameter(name = "queryQuartzJob", description = "定时任务表查询条件")
    })
    @GetMapping("list")
    public ResponseEntity<List<QuartzJob>> list(QuartzJob queryQuartzJob) throws Exception {
        return ResponseEntity.ok(baseService.list(queryQuartzJob));
    }




    @AppLog
    @Operation(description = "分页查询逻辑删除的定时任务表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryQuartzJob", description = "定时任务表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseEntity<IPage<QuartzJob>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            QuartzJob queryQuartzJob) throws Exception {
        IPage<QuartzJob> page = baseService.recoverPage(currentPage, size, queryQuartzJob);
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "通过主键恢复逻辑删除的定时任务表数据")
    @Parameters({
            @Parameter(name = "id", description = "定时任务表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseEntity<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseEntity.ok();
    }


    @AppLog
    @Operation(description = "通过主键彻底删除一条定时任务表数据")
    @Parameters({
            @Parameter(name = "id", description = "定时任务表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseEntity<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseEntity.message("彻底删除该定时任务表数据");
    }


    @AppLog
    @Operation(description = "导出定时任务表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryQuartzJob", description = "定时任务表查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(QuartzJob queryQuartzJob, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryQuartzJob, response);
    }

}