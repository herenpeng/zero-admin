package com.zero.common.controller;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zero.common.response.domain.ResponseData;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @author herenpeng
 * @since 2020-10-22 14:25
 */
public class BaseController<S extends IService<E>, E> {

    @Autowired
    protected S baseService;

    @ApiOperation(value = "[通用方法]插入一条对应实体类的数据库记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "user", value = "用户对象", required = true)
    })
    @PostMapping
    public ResponseData save(@RequestBody E entity) throws Exception {
        baseService.save(entity);
        return ResponseData.ok().message("添加成功");
    }


    @ApiOperation(value = "[通用方法]更新一条对应实体类的数据库记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "user", value = "用户对象", required = true)
    })
    @PutMapping
    public ResponseData updateById(@RequestBody E entity) throws Exception {
        baseService.updateById(entity);
        return ResponseData.ok().message("更新成功");
    }


    @ApiOperation(value = "[通用方法]通过主键删除一条对应实体类的数据库记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户主键", required = true)
    })
    @DeleteMapping("{id}")
    public ResponseData deleteById(@PathVariable("id") Integer id) throws Exception {
        baseService.removeById(id);
        return ResponseData.ok().message("删除成功");
    }

}
