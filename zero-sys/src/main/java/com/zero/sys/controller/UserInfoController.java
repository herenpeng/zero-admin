package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.UserInfo;
import com.zero.common.annotation.AppLog;
import com.zero.common.base.controller.BaseController;
import com.zero.common.domain.ResponseEntity;
import com.zero.sys.service.UserInfoService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 系统用户信息表的数据交互控制器
 *
 * @author herenpeng
 * @since 2021-01-12 22:19
 */
@Tag(description = "系统用户信息表操作接口", name = "UserInfoController")
@RestController
@RequestMapping("user/info")
public class UserInfoController extends BaseController<UserInfoService, UserInfo> {

    @AppLog
    @Operation(description = "分页查询系统用户信息表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryUserInfo", description = "系统用户信息表查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseEntity<IPage<UserInfo>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            UserInfo queryUserInfo) throws Exception {
        IPage<UserInfo> page = baseService.page(currentPage, size, queryUserInfo);
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "查询所有的系统用户信息表数据")
    @Parameters({
            @Parameter(name = "queryUserInfo", description = "系统用户信息表查询条件")
    })
    @GetMapping("list")
    public ResponseEntity<List<UserInfo>> list(UserInfo queryUserInfo) throws Exception {
        return ResponseEntity.ok(baseService.list(queryUserInfo));
    }

    @AppLog
    @Operation(description = "查询当前登录用户的信息数据")
    @GetMapping
    public ResponseEntity<UserInfo> info() throws Exception {
        UserInfo userInfo = baseService.info();
        return ResponseEntity.ok(userInfo);
    }


    @AppLog
    @Operation(description = "分页查询逻辑删除的系统用户信息表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryUserInfo", description = "系统用户信息表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseEntity<IPage<UserInfo>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            UserInfo queryUserInfo) throws Exception {
        IPage<UserInfo> page = baseService.recoverPage(currentPage, size, queryUserInfo);
        return ResponseEntity.ok(page);
    }


    @AppLog
    @Operation(description = "通过主键恢复逻辑删除的系统用户信息表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统用户信息表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseEntity<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseEntity.ok();
    }


    @AppLog
    @Operation(description = "通过主键彻底删除一条系统用户信息表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统用户信息表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseEntity<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseEntity.message("彻底删除该系统用户信息表数据");
    }


    @AppLog
    @Operation(description = "导出系统用户信息表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryUserInfo", description = "系统用户信息表查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(UserInfo queryUserInfo, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryUserInfo, response);
    }


    @AppLog
    @Operation(description = "上传用户头像")
    @Parameters({
            @Parameter(name = "file", description = "上传的用户头像", required = true)
    })
    @PostMapping("avatar")
    public ResponseEntity<String> avatar(@RequestParam("file") MultipartFile file) throws Exception {
        String avatar = baseService.avatar(file);
        return ResponseEntity.ok(avatar);
    }


    @AppLog
    @Operation(description = "获取用户头像路径")
    @GetMapping("avatar")
    public ResponseEntity<String> getAvatar() throws Exception {
        String avatar = baseService.getAvatar();
        return ResponseEntity.ok(avatar);
    }


    @AppLog
    @Operation(description = "发送电子邮件号码验证邮件")
    @Parameters({
            @Parameter(name = "mail", description = "电子邮件号码", required = true)
    })
    @PostMapping("mail/verify/send")
    public ResponseEntity<Boolean> sendVerifyMail(String mail) throws Exception {
        boolean result = baseService.sendVerifyMail(mail);
        return ResponseEntity.ok(result);
    }

    @AppLog
    @Operation(description = "验证邮件验证码")
    @Parameters({
            @Parameter(name = "mail", description = "电子邮件号码", required = true),
            @Parameter(name = "verify", description = "电子邮件验证码", required = true)
    })
    @PostMapping("mail/verify")
    public ResponseEntity<Boolean> verify(String mail, String verify) throws Exception {
        boolean result = baseService.verify(mail, verify);
        return ResponseEntity.ok(result);
    }

}