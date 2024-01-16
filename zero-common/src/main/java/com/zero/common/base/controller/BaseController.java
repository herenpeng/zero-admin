package com.zero.common.base.controller;

import com.zero.common.annotation.AppLog;
import com.zero.common.base.entity.BaseEntity;
import com.zero.common.base.service.BaseService;
import com.zero.common.domain.ResponseEntity;
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
public class BaseController<S extends BaseService<E>, E extends BaseEntity> {

    @Autowired
    protected S baseService;

    @AppLog
    @Operation(description = "[通用方法]通过主键获取一条对应实体类的数据库记录")
    @Parameters({
            @Parameter(name = "id", description = "实体主键", required = true)
    })
    @GetMapping("{id}")
    public ResponseEntity<E> getById(@PathVariable("id") Integer id) throws Exception {
        E entity = baseService.getById(id);
        return ResponseEntity.ok(entity);
    }

    @AppLog
    @Operation(description = "[通用方法]插入一条对应实体类的数据库记录")
    @Parameters({
            @Parameter(name = "entity", description = "实体对象", required = true)
    })
    @PostMapping
    public ResponseEntity<Void> save(@RequestBody E entity) throws Exception {
        baseService.save(entity);
        return ResponseEntity.message("添加成功");
    }


    @AppLog
    @Operation(description = "[通用方法]更新一条对应实体类的数据库记录")
    @Parameters({
            @Parameter(name = "entity", description = "实体对象", required = true)
    })
    @PutMapping
    public ResponseEntity<Void> updateById(@RequestBody E entity) throws Exception {
        baseService.updateById(entity);
        return ResponseEntity.message("更新成功");
    }


    @AppLog
    @Operation(description = "[通用方法]通过主键删除一条对应实体类的数据库记录")
    @Parameters({
            @Parameter(name = "id", description = "实体主键", required = true)
    })
    @DeleteMapping("{id}")
    public ResponseEntity<Void> deleteById(@PathVariable("id") Integer id) throws Exception {
        baseService.removeById(id);
        return ResponseEntity.message("删除成功");
    }

}
