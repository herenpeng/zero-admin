package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.auth.entity.UserInfo;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
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

    @LogOperation
    @Operation(description = "分页查询系统用户信息表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryUserInfo", description = "系统用户信息表查询条件")
    })
    @GetMapping("page/{currentPage}")
    public ResponseData<IPage<UserInfo>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            UserInfo queryUserInfo) throws Exception {
        IPage<UserInfo> page = baseService.page(currentPage, size, queryUserInfo);
        return ResponseData.ok(page);
    }


    @LogOperation
    @Operation(description = "查询所有的系统用户信息表数据")
    @Parameters({
            @Parameter(name = "queryUserInfo", description = "系统用户信息表查询条件")
    })
    @GetMapping("list")
    public ResponseData<List<UserInfo>> list(UserInfo queryUserInfo) throws Exception {
        return ResponseData.ok(baseService.list(queryUserInfo));
    }

    @LogOperation
    @Operation(description = "查询当前登录用户的信息数据")
    @GetMapping
    public ResponseData<UserInfo> info() throws Exception {
        UserInfo userInfo = baseService.info();
        return ResponseData.ok(userInfo);
    }


    @LogOperation
    @Operation(description = "分页查询逻辑删除的系统用户信息表数据")
    @Parameters({
            @Parameter(name = "currentPage", description = "当前页码", required = true),
            @Parameter(name = "size", description = "当前页大小", example = "10"),
            @Parameter(name = "queryUserInfo", description = "系统用户信息表查询条件")
    })
    @GetMapping("recover/page/{currentPage}")
    public ResponseData<IPage<UserInfo>> recoverPage(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size,
            UserInfo queryUserInfo) throws Exception {
        IPage<UserInfo> page = baseService.recoverPage(currentPage, size, queryUserInfo);
        return ResponseData.ok(page);
    }


    @LogOperation
    @Operation(description = "通过主键恢复逻辑删除的系统用户信息表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统用户信息表ID", required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }


    @LogOperation
    @Operation(description = "通过主键彻底删除一条系统用户信息表数据")
    @Parameters({
            @Parameter(name = "id", description = "系统用户信息表ID", required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.message("彻底删除该系统用户信息表数据");
    }


    @LogOperation
    @Operation(description = "导出系统用户信息表数据的Excel文件")
    @Parameters({
            @Parameter(name = "queryUserInfo", description = "系统用户信息表查询条件"),
            @Parameter(name = "response", description = "HttpServletResponse对象"),
    })
    @GetMapping("export/excel")
    public void exportExcel(UserInfo queryUserInfo, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryUserInfo, response);
    }


    @LogOperation
    @Operation(description = "上传用户头像")
    @Parameters({
            @Parameter(name = "file", description = "上传的用户头像", required = true)
    })
    @PostMapping("avatar")
    public ResponseData<String> avatar(@RequestParam("file") MultipartFile file) throws Exception {
        String avatar = baseService.avatar(file);
        return ResponseData.ok(avatar);
    }


    @LogOperation
    @Operation(description = "获取用户头像路径")
    @GetMapping("avatar")
    public ResponseData<String> getAvatar() throws Exception {
        String avatar = baseService.getAvatar();
        return ResponseData.ok(avatar);
    }


    @LogOperation
    @Operation(description = "发送电子邮件号码验证邮件")
    @Parameters({
            @Parameter(name = "mail", description = "电子邮件号码", required = true)
    })
    @PostMapping("mail/verify/send")
    public ResponseData<Boolean> sendVerifyMail(String mail) throws Exception {
        boolean result = baseService.sendVerifyMail(mail);
        return ResponseData.ok(result);
    }

    @LogOperation
    @Operation(description = "验证邮件验证码")
    @Parameters({
            @Parameter(name = "mail", description = "电子邮件号码", required = true),
            @Parameter(name = "verify", description = "电子邮件验证码", required = true)
    })
    @PostMapping("mail/verify")
    public ResponseData<Boolean> verify(String mail, String verify) throws Exception {
        boolean result = baseService.verify(mail, verify);
        return ResponseData.ok(result);
    }

}