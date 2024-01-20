package ${javaPackageName}.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.AppLog;
import com.zero.common.base.controller.BaseController;
import com.zero.common.domain.ResponseEntity;
import ${javaPackageName}.entity.${entityName};
import ${javaPackageName}.service.${entityName}Service;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ${comment}的数据交互控制器
 *
 * @author ${codeAuthor}
 * @since ${.now?string("yyyy-MM-dd HH:mm")}
 */
@Tag(description = "${comment}操作接口", name = "${entityName}Controller")
@RestController
@RequestMapping("${requestMapping}")
public class ${entityName}Controller extends BaseController<${entityName}Service, ${entityName}> {

    @AppLog
    @Operation(description = "分页查询${comment}数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "query${entityName}", description = "${comment}查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseEntity<IPage<${entityName}>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            ${entityName} query${entityName}) throws Exception {
        IPage<${entityName}> page = baseService.page(currentPage, size, query${entityName});
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "查询所有的${comment}数据")
    @Parameters({
            @Parameter(name = "query${entityName}", description = "${comment}查询条件")
    })
    @GetMapping("list")
    public ResponseEntity<List<${entityName}>> list(${entityName} query${entityName}) throws Exception {
        return ResponseEntity.ok(baseService.list(query${entityName}));
    }


    <#if tree>
    @AppLog
    @Operation(description = "查询${comment}数据并构建树状结构")
    @GetMapping("tree")
    public ResponseEntity<List<${entityName}>> tree() throws Exception {
        List<${entityName}> tree = baseService.tree();
        return ResponseEntity.ok(tree);
    }


    @AppLog
    @Operation(description = "移动${comment}树状结构节点")
    @Parameters({
        @Parameter(name = "${entityName?uncap_first}", description = "${comment}树状结构节节点")
    })
    @PutMapping("move")
    public ResponseEntity<List<${entityName}>> move(@RequestBody ${entityName} ${entityName?uncap_first}) throws Exception {
        baseService.move(${entityName?uncap_first});
        return ResponseEntity.message("操作成功");
    }
    </#if>


    @AppLog
    @Operation(description = "分页查询逻辑删除的${comment}数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "query${entityName}", description = "${comment}查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseEntity<IPage<${entityName}>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            ${entityName} query${entityName}) throws Exception {
        IPage<${entityName}> page = baseService.recoverPage(currentPage, size, query${entityName});
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "通过主键恢复逻辑删除的${comment}数据")
    @Parameters({
            @Parameter(name = "id", description = "${comment}ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseEntity<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseEntity.ok();
    }


    @AppLog
    @Operation(description = "通过主键彻底删除一条${comment}数据")
    @Parameters({
            @Parameter(name = "id", description = "${comment}ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseEntity<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseEntity.message("彻底删除该${comment}数据");
    }


    @AppLog
    @Operation(description = "导出${comment}数据的Excel文件")
    @Parameters({
            @Parameter(name = "query${entityName}", description = "${comment}查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(${entityName} query${entityName}, HttpServletResponse response) throws Exception {
        baseService.exportExcel(query${entityName}, response);
    }

}