package com.zero.common.base.controller;

import com.zero.common.annotation.LogOperation;
import com.zero.common.base.service.BaseService;
import com.zero.common.response.domain.ResponseData;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Controller类的通用抽象类
 *
 * @author herenpeng
 * @since 2020-10-22 14:25
 */
public class BaseController<S extends BaseService<E>, E> {

    @Autowired
    protected S baseService;

    @LogOperation
    @Operation(description = "[通用方法]通过主键获取一条对应实体类的数据库记录")
    @Parameters({
            @Parameter(name = "id", description = "实体主键", required = true)
    })
    @GetMapping("{id}")
    public ResponseData<E> getById(@PathVariable("id") Integer id) throws Exception {
        E entity = baseService.getById(id);
        return ResponseData.ok(entity);
    }

    @LogOperation
    @Operation(description = "[通用方法]插入一条对应实体类的数据库记录")
    @Parameters({
            @Parameter(name = "entity", description = "实体对象", required = true)
    })
    @PostMapping
    public ResponseData<Void> save(@RequestBody E entity) throws Exception {
        baseService.save(entity);
        return ResponseData.message("添加成功");
    }


    @LogOperation
    @Operation(description = "[通用方法]更新一条对应实体类的数据库记录")
    @Parameters({
            @Parameter(name = "entity", description = "实体对象", required = true)
    })
    @PutMapping
    public ResponseData<Void> updateById(@RequestBody E entity) throws Exception {
        baseService.updateById(entity);
        return ResponseData.message("更新成功");
    }


    @LogOperation
    @Operation(description = "[通用方法]通过主键删除一条对应实体类的数据库记录")
    @Parameters({
            @Parameter(name = "id", description = "实体主键", required = true)
    })
    @DeleteMapping("{id}")
    public ResponseData<Void> deleteById(@PathVariable("id") Integer id) throws Exception {
        baseService.removeById(id);
        return ResponseData.message("删除成功");
    }

}
