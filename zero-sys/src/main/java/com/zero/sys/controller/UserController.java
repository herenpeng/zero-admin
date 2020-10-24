package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.domain.Role;
import com.zero.sys.domain.User;
import com.zero.sys.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
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
public class UserController extends BaseController<UserService, User> {

    @ApiOperation(value = "分页查询用户数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "8"),
            @ApiImplicitParam(name = "queryUser", value = "用户查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "8") Integer size,
            User queryUser) throws Exception {
        IPage<User> page = baseService.page(currentPage, size, queryUser);
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
        baseService.enabled(id, enabled);
        return ResponseData.ok();
    }


    @ApiOperation(value = "获取请求头上的accessToken，并根据accessToken返回用户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "accessToken", value = "用户请求token", required = true)
    })
    @GetMapping("info")
    public ResponseData info(@RequestHeader("accessToken") String accessToken) throws Exception {
        User user = baseService.info(accessToken);
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
        baseService.deleteUserRole(userId, roleId);
        return ResponseData.ok().message("删除用户角色成功");
    }


    @ApiOperation(value = "获取该用户未拥有的角色")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "userId", value = "用户主键", required = true)
    })
    @GetMapping("role/{userId}")
    public ResponseData getUserNotRoleList(
            @PathVariable("userId") Integer userId) throws Exception {
        List<Role> roleList = baseService.getUserNotRoleList(userId);
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
        baseService.addUserRole(userId, roleId);
        return ResponseData.ok().message("添加用户角色成功");
    }

}
