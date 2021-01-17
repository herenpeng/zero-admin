package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.annotation.LogOperation;
import com.zero.common.base.controller.BaseController;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.entity.UserInfo;
import com.zero.sys.service.UserInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 系统用户信息表的数据交互控制器
 *
 * @author herenpeng
 * @since 2021-01-12 22:19
 */
@Api(value = "系统用户信息表操作接口", tags = "UserInfoController")
@RestController
@RequestMapping("user/info")
public class UserInfoController extends BaseController<UserInfoService, UserInfo> {

    @LogOperation
    @ApiOperation(value = "分页查询系统用户信息表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryUserInfo", value = "系统用户信息表查询条件", dataTypeClass = UserInfo.class)
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
    @ApiOperation(value = "查询所有的系统用户信息表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryUserInfo", value = "系统用户信息表查询条件", dataTypeClass = UserInfo.class)
    })
    @GetMapping("list")
    public ResponseData<List<UserInfo>> list(UserInfo queryUserInfo) throws Exception {
        return ResponseData.ok(baseService.list(queryUserInfo));
    }

    @LogOperation
    @ApiOperation(value = "查询当前登录用户的信息数据")
    @GetMapping
    public ResponseData<UserInfo> info() throws Exception {
        UserInfo userInfo = baseService.info();
        return ResponseData.ok(userInfo);
    }


    @LogOperation
    @ApiOperation(value = "分页查询逻辑删除的系统用户信息表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "currentPage", value = "当前页码", dataTypeClass = Integer.class, required = true),
            @ApiImplicitParam(name = "size", value = "当前页大小", defaultValue = "10", dataTypeClass = Integer.class),
            @ApiImplicitParam(name = "queryUserInfo", value = "系统用户信息表查询条件", dataTypeClass = UserInfo.class)
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
    @ApiOperation(value = "通过主键恢复逻辑删除的系统用户信息表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统用户信息表ID", dataTypeClass = Integer.class, required = true)
    })
    @PutMapping("recover/{id}")
    public ResponseData<Void> recover(@PathVariable("id") Integer id) throws Exception {
        baseService.recover(id);
        return ResponseData.ok();
    }


    @LogOperation
    @ApiOperation(value = "通过主键彻底删除一条系统用户信息表数据")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "id", value = "系统用户信息表ID", dataTypeClass = Integer.class, required = true)
    })
    @DeleteMapping("recover/{id}")
    public ResponseData<Void> recoverDelete(@PathVariable("id") Integer id) throws Exception {
        baseService.recoverDelete(id);
        return ResponseData.ok().message("彻底删除该系统用户信息表数据");
    }


    @LogOperation
    @ApiOperation(value = "导出系统用户信息表数据的Excel文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "queryUserInfo", value = "系统用户信息表查询条件", dataTypeClass = UserInfo.class),
            @ApiImplicitParam(name = "response", value = "HttpServletResponse对象", dataTypeClass = HttpServletResponse.class),
    })
    @GetMapping("export/excel")
    public void exportExcel(UserInfo queryUserInfo, HttpServletResponse response) throws Exception {
        baseService.exportExcel(queryUserInfo, response);
    }


    @LogOperation
    @ApiOperation(value = "上传用户头像")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "file", value = "上传的用户头像", dataTypeClass = MultipartFile.class, required = true)
    })
    @PostMapping("avatar")
    public ResponseData<String> avatar(@RequestParam("file") MultipartFile file) throws Exception {
        String avatar = baseService.avatar(file);
        return ResponseData.ok(avatar);
    }


    @LogOperation
    @ApiOperation(value = "获取用户头像路径")
    @GetMapping("avatar")
    public ResponseData<String> getAvatar() throws Exception {
        String avatar = baseService.getAvatar();
        return ResponseData.ok(avatar);
    }


    @LogOperation
    @ApiOperation(value = "发送电子邮件号码验证邮件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "mail", value = "电子邮件号码", dataTypeClass = String.class, required = true)}
    )
    @PostMapping("mail/verify")
    public ResponseData<Boolean> verifyMail(String mail) throws Exception {
        boolean result = baseService.verifyMail(mail);
        return ResponseData.ok(result);
    }

}