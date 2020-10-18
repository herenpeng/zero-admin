package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.domain.Role;
import com.zero.sys.domain.User;
import com.zero.sys.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户的数据交互控制器
 *
 * @author herenpeng
 * @since 2020-08-04 22:34
 */
@Api(value = "用户操作接口", tags = "UserController")
@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @ApiOperation(value = "分页查询用户数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size) throws Exception {
        IPage<User> page = userService.page(currentPage, size);
        return ResponseData.ok(page);
    }


    @ApiOperation(value = "启用或者禁用一个用户账号")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户ID", required = true),
            @ApiImplicitParam(name = "enabled", value = "true为启用，false为禁用", required = true)
    })
    @PutMapping("enabled/{id}")
    public ResponseData enabled(
            @PathVariable("id") Integer id,
            @RequestParam("enabled") Boolean enabled) throws Exception {
        userService.enabled(id, enabled);
        return ResponseData.ok();
    }


    @ApiOperation(value = "插入一条用户记录")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "user", value = "用户对象", required = true)
    })
    @PostMapping
    public ResponseData insert(@RequestBody User user) throws Exception {
        userService.insert(user);
        return ResponseData.ok("添加用户成功");
    }


    @ApiOperation(value = "通过主键删除用户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户主键", required = true)
    })
    @DeleteMapping("{id}")
    public ResponseData delete(@PathVariable("id") Integer id) throws Exception {
        userService.delete(id);
        return ResponseData.ok("删除用户成功");
    }


    @ApiOperation(value = "获取请求头上的accessToken，并根据accessToken返回用户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "accessToken", value = "用户请求token", required = true)
    })
    @GetMapping("info")
    public ResponseData info(@RequestHeader("accessToken") String accessToken) throws Exception {
        User user = userService.info(accessToken);
        return ResponseData.ok(user);
    }


    @ApiOperation(value = "删除用户角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId", value = "用户主键", required = true),
            @ApiImplicitParam(name = "roleId", value = "角色主键", required = true)
    })
    @DeleteMapping("role/{userId}")
    public ResponseData deleteUserRole(
            @PathVariable("userId") Integer userId,
            @RequestParam("roleId") Integer roleId) throws Exception {
        userService.deleteUserRole(userId, roleId);
        return ResponseData.ok("删除用户角色成功");
    }


    @ApiOperation(value = "获取该用户未拥有的角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId", value = "用户主键", required = true)
    })
    @GetMapping("role/{userId}")
    public ResponseData getRoleList(
            @PathVariable("userId") Integer userId) throws Exception {
        List<Role> roleList = userService.getRoleList(userId);
        return ResponseData.ok(roleList);
    }

    @ApiOperation(value = "添加用户角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId", value = "用户主键", required = true),
            @ApiImplicitParam(name = "roleId", value = "角色主键", required = true)
    })
    @PostMapping("role/{userId}")
    public ResponseData addUserRole(
            @PathVariable("userId") Integer userId,
            @RequestParam Integer roleId) throws Exception {
        userService.addUserRole(userId, roleId);
        return ResponseData.ok("添加用户角色成功");
    }

}
