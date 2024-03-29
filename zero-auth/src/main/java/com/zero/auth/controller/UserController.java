package com.zero.auth.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.Role;
import com.zero.auth.entity.User;
import com.zero.auth.service.UserService;
import com.zero.common.annotation.AppLog;
import com.zero.common.base.controller.BaseController;
import com.zero.common.domain.ResponseEntity;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户的数据交互控制器
 *
 * @author herenpeng
 * @since 2020-08-04 22:34
 */
@Tag(name = "UserController", description = "用户操作接口")
@RestController
@RequestMapping("user")
public class UserController extends BaseController<UserService, User> {

    @AppLog
    @Operation(description = "分页查询用户数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryUser", description = "用户查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseEntity<IPage<User>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            User queryUser) throws Exception {
        IPage<User> page = baseService.page(currentPage, size, queryUser);
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "启用或者禁用一个用户账号")
    @Parameters({
            @Parameter(name = "id", description = "用户ID", required = true),
            @Parameter(name = "enabled", description = "true为启用，false为禁用", required = true)
    })
    @PutMapping("enabled/{id}")
    public ResponseEntity<Void> enabled(
            @PathVariable("id") Integer id,
            @RequestParam("enabled") Boolean enabled) throws Exception {
        baseService.enabled(id, enabled);
        return ResponseEntity.message("更新用户状态成功");
    }


    @Operation(description = "获取请求头上的accessToken，并根据accessToken返回用户信息")
    @Parameters({
            @Parameter(name = "accessToken", description = "用户请求token", required = true)
    })
    @GetMapping("token")
    public ResponseEntity<User> token(@RequestHeader("accessToken") String accessToken) throws Exception {
        User user = baseService.token(accessToken);
        return ResponseEntity.ok(user);
    }


    @AppLog
    @Operation(description = "删除用户角色")
    @Parameters({
            @Parameter(name = "userId", description = "用户主键", required = true),
            @Parameter(name = "roleId", description = "角色主键", required = true)
    })
    @DeleteMapping("role/{userId}")
    public ResponseEntity<Void> deleteUserRole(
            @PathVariable("userId") Integer userId,
            @RequestParam("roleId") Integer roleId) throws Exception {
        baseService.deleteUserRole(userId, roleId);
        return ResponseEntity.message("删除用户角色成功");
    }


    @AppLog
    @Operation(description = "获取该用户未拥有的角色")
    @Parameters({
            @Parameter(name = "userId", description = "用户主键", required = true)
    })
    @GetMapping("role/{userId}")
    public ResponseEntity<List<Role>> getUserNotRoleList(
            @PathVariable("userId") Integer userId) throws Exception {
        List<Role> roleList = baseService.getUserNotRoleList(userId);
        return ResponseEntity.ok(roleList);
    }


    @AppLog
    @Operation(description = "添加用户角色")
    @Parameters({
            @Parameter(name = "userId", description = "用户主键", required = true),
            @Parameter(name = "roleId", description = "角色主键", required = true)
    })
    @PostMapping("role/{userId}")
    public ResponseEntity<Void> addUserRole(
            @PathVariable("userId") Integer userId,
            @RequestParam Integer roleId) throws Exception {
        baseService.addUserRole(userId, roleId);
        return ResponseEntity.message("添加用户角色成功");
    }


    @AppLog
    @Operation(description = "检测用户名是否已存在")
    @Parameters({
            @Parameter(name = "username", description = "用户名", required = true)
    })
    @GetMapping("check/username")
    public ResponseEntity<Boolean> checkUsername(@RequestParam("username") String username) throws Exception {
        Boolean result = baseService.checkUsername(username);
        return ResponseEntity.ok(result);
    }

    @AppLog
    @Operation(description = "检测用户密码是否正确")
    @Parameters({
            @Parameter(name = "password", description = "用户密码", required = true)
    })
    @GetMapping("check/password")
    public ResponseEntity<Boolean> checkPassword(@RequestParam("password") String password) throws Exception {
        Boolean result = baseService.checkPassword(password);
        return ResponseEntity.ok(result);
    }

    @AppLog
    @Operation(description = "分页查询逻辑删除的用户数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryUser", description = "用户查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseEntity<IPage<User>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            User queryUser) throws Exception {
        IPage<User> page = baseService.recoverPage(currentPage, size, queryUser);
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "通过主键恢复逻辑删除的用户数据")
    @Parameters({
            @Parameter(name = "id", description = "用户ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseEntity<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseEntity.ok();
    }


    @AppLog
    @Operation(description = "通过主键彻底删除一条用户数据")
    @Parameters({
            @Parameter(name = "id", description = "用户ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseEntity<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseEntity.message("彻底删除该用户数据");
    }


    @AppLog
    @Operation(description = "导出用户列表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryUser", description = "用户查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(User queryUser, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryUser, response);
    }


    @AppLog
    @Operation(description = "重置用户账号密码")
    @Parameters({
            @Parameter(name = "oldPassword", description = "旧密码"),
            @Parameter(name = "newPassword", description = "新密码"),
    })
    @PutMapping("reset/password")
    public ResponseEntity<Void> resetPassword(
            @RequestParam("oldPassword") String oldPassword,
            @RequestParam("newPassword") String newPassword) throws Exception {
        baseService.resetPassword(oldPassword, newPassword);
        return ResponseEntity.message("账号密码重置成功，该账号即将自动登出，请重新登录系统");
    }

}
