package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.response.domain.CodeEnum;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.domain.User;
import com.zero.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * 用户的数据交互控制器
 *
 * @author herenpeng
 * @since 2020-08-04 22:34
 */
@RestController
@RequestMapping("user")
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
    public ResponseEntity<ResponseData> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(value = "size", defaultValue = "10") Integer size) throws Exception {
        IPage<User> page = userService.page(currentPage, size);
        ResponseData<IPage> body = new ResponseData<>(CodeEnum.OK.getValue(), page);
        return ResponseEntity.ok(body);
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
    public ResponseEntity<ResponseData> page(
            @PathVariable("id") Integer id,
            @RequestParam("enabled") Boolean enabled) throws Exception {
        userService.enabled(id, enabled);
        return ResponseEntity.ok(new ResponseData(CodeEnum.OK.getValue()));
    }

    /**
     * 插入一条用户记录
     *
     * @param user 用户对象
     * @return 业务状态码
     * @throws Exception 抛出异常
     */
    @PostMapping
    public ResponseEntity<ResponseData> insert(@RequestParam("user") User user) throws Exception {
        userService.insert(user);
        return ResponseEntity.ok(new ResponseData(CodeEnum.OK.getValue()));
    }


}
