package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.entity.Role;
import com.zero.sys.entity.User;
import com.zero.sys.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
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

    @LogOperation
    @ApiOperation(value = "分页查询用户数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10"),
            @ApiImplicitParam(name = "queryUser", value = "用户查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            User queryUser) throws Exception {
        IPage<User> page = baseService.page(currentPage, size, queryUser);
        return ResponseData.ok(page);
    }


    @LogOperation
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


    @LogOperation
    @ApiOperation(value = "获取请求头上的accessToken，并根据accessToken返回用户信息")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "accessToken", value = "用户请求token", required = true)
    })
    @GetMapping("info")
    public ResponseData info(@RequestHeader("accessToken") String accessToken) throws Exception {
        User user = baseService.info(accessToken);
        return ResponseData.ok(user);
    }


    @LogOperation
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


    @LogOperation
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


    @LogOperation
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


    @LogOperation
    @ApiOperation(value = "检测用户名是否已存在")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "username", value = "用户名", required = true)
    })
    @GetMapping("check/username")
    public ResponseData checkUsername(@RequestParam("username") String username) throws Exception {
        Boolean result = baseService.checkUsername(username);
        return ResponseData.ok(result);
    }



    @LogOperation
    @ApiOperation(value = "分页查询逻辑删除的用户数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10"),
            @ApiImplicitParam(name = "queryUser", value = "用户查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            User queryUser) throws Exception {
        IPage<User> page = baseService.recoverPage(currentPage, size, queryUser);
        return ResponseData.ok(page);
    }


    @LogOperation
    @ApiOperation(value = "通过主键恢复逻辑删除的用户数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }


    @LogOperation
    @ApiOperation(value = "通过主键彻底删除一条用户数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "用户ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.ok().message("彻底删除该用户数据");
    }


    @LogOperation
    @ApiOperation(value = "导出用户列表数据的Excel文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryUser", value = "用户查询条件"),
            @ApiImplicitParam(name = "response", value = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(User queryUser, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryUser, response);
    }

}
