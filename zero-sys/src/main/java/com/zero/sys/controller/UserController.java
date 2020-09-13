package com.zero.sys.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.zero.common.response.domain.ResponseData;
import com.zero.sys.domain.User;
import com.zero.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * 用户的数据交互控制器
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
    public ResponseEntity<ResponseData<IPage>> page(
            @PathVariable("currentPage") Integer currentPage,
            @RequestParam(defaultValue = "10") Integer size) throws Exception {
        IPage<User> page = userService.page(currentPage, size);
        ResponseData<IPage> body = new ResponseData<>(20000, page);
        return ResponseEntity.ok(body);
    }


}
