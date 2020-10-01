package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.domain.User;
import com.zero.sys.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 用户的数据交互控制器
 *
 * @author herenpeng
 * @since 2020-08-04 22:34
 */
@RestController
@RequestMapping("user")
@Api(value = "用户测试接口", tags = "UserController")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 分页查询用户数据
     *
     * @param currentPage 当前页面数，页面从1开始
     * @param size        当前页的大小，默认为10
     * @return 分页查询的所有分页用户数据
     * @throws Exception 抛出异常
     */
    @GetMapping("page/{currentPage}")
    @ApiOperation(value = "分页查询用户", notes = "查询用户数据", httpMethod = "POST")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10")
    })
    public ResponseData page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size) throws Exception {
        IPage<User> page = userService.page(currentPage, size);
        return ResponseData.ok(page);
    }

    /**
     * 启用或者禁用一个用户账号
     *
     * @param id      用户id
     * @param enabled true为启用，false为禁用
     * @return 业务状态码
     * @throws Exception 抛出异常
     */
    @PutMapping("enabled/{id}")
    public ResponseData page(
            @PathVariable("id") Integer id,
            @RequestParam("enabled") Boolean enabled) throws Exception {
        userService.enabled(id, enabled);
        return ResponseData.ok();
    }

    /**
     * 插入一条用户记录
     *
     * @param user 用户对象
     * @return 业务状态码
     * @throws Exception 抛出异常
     */
    @PostMapping
    public ResponseData insert(@RequestBody User user) throws Exception {
        userService.insert(user);
        return ResponseData.ok("添加用户成功");
    }

    /**
     * 通过主键删除用户信息
     *
     * @param id 用户主键
     * @return
     * @throws Exception 抛出异常
     */
    @DeleteMapping("{id}")
    public ResponseData delete(@PathVariable("id") Integer id) throws Exception {
        userService.delete(id);
        return ResponseData.ok("删除用户成功");
    }

    @GetMapping("info")
    public ResponseData info(@RequestHeader("accessToken") String accessToken) throws Exception {
        User user = userService.info(accessToken);
        return ResponseData.ok(user);
    }


}
