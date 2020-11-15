package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import ${basePackageName}.entity.${entityName};
import ${basePackageName}.service.${entityName}Service;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

/**
 * ${comment}的数据交互控制器
 *
 * @author ${codeAuthor}
 * @since ${.now?string("yyyy-MM-dd HH:mm")}
 */
@Api(value = "${entityName}操作接口", tags = "${entityName}Controller")
@RestController
@RequestMapping("${entityName?uncap_first}")
public class ${entityName}Controller extends BaseController<${entityName}Service, ${entityName}> {

    @LogOperation
    @ApiOperation(value = "分页查询${entityName}数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "8"),
            @ApiImplicitParam(name = "query${entityName}", value = "${entityName}查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "8") Integer size,
            ${entityName} query${entityName}) throws Exception {
        IPage<${entityName}> page = baseService.page(currentPage, size, query${entityName});
        return ResponseData.ok(page);
    }

}