package com.zero.common.base.controller;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zero.common.annotation.LogOperation;
import com.zero.common.response.domain.ResponseData;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Controller类的通用抽象类
 *
 * @author herenpeng
 * @since 2020-10-22 14:25
 */
public class BaseController<S extends IService<E>, E> {

    @Autowired
    protected S baseService;

    @LogOperation
    @ApiOperation(value = "[通用方法]通过主键获取一条对应实体类的数据库记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "entity", value = "实体对象", dataTypeClass = Object.class, required = true)
    })
    @GetMapping("{id}")
    public ResponseData<E> save(@PathVariable("id") Integer id) throws Exception {
        E entity = baseService.getById(id);
        return ResponseData.ok(entity);
    }

    @LogOperation
    @ApiOperation(value = "[通用方法]插入一条对应实体类的数据库记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "entity", value = "实体对象", dataTypeClass = Object.class, required = true)
    })
    @PostMapping
    public ResponseData<Void> save(@RequestBody E entity) throws Exception {
        baseService.save(entity);
        return ResponseData.ok().message("添加成功");
    }


    @LogOperation
    @ApiOperation(value = "[通用方法]更新一条对应实体类的数据库记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "entity", value = "实体对象", dataTypeClass = Object.class, required = true)
    })
    @PutMapping
    public ResponseData<Void> updateById(@RequestBody E entity) throws Exception {
        baseService.updateById(entity);
        return ResponseData.ok().message("更新成功");
    }


    @LogOperation
    @ApiOperation(value = "[通用方法]通过主键删除一条对应实体类的数据库记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "实体主键", dataTypeClass = Integer.class, required = true)
    })
    @DeleteMapping("{id}")
    public ResponseData<Void> deleteById(@PathVariable("id") Integer id) throws Exception {
        baseService.removeById(id);
        return ResponseData.ok().message("删除成功");
    }

}
