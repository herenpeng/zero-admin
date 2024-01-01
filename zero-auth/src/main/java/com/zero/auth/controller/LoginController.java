package com.zero.auth.controller;

import com.zero.auth.service.LoginService;
import com.zero.common.response.domain.ResponseData;
import io.swagger.v3.oas.annotations.Hidden;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@AllArgsConstructor
@Hidden
@Tag(name = "LoginController", description = "登录操作接口")
@RestController
@RequestMapping
public class LoginController {

    private final LoginService loginService;

    @Operation(description = "登录接口")
    @Parameters({
            @Parameter(name = "loginInfo", description = "登录信息", required = true)
    })
    @PostMapping("login")
    public ResponseData<String> login(@RequestBody LoginInfo loginInfo, HttpServletRequest request) throws Exception {
        String username = loginInfo.username();
        String password = loginInfo.password();
        String token = loginService.login(username, password, request);
        return ResponseData.ok(token);
    }


    @Operation(description = "登出接口")
    @PostMapping("logout")
    public ResponseData<String> logout(HttpServletRequest request) throws Exception {
        loginService.logout(request);
        return ResponseData.message("退出成功");
    }


    public record LoginInfo(String username, String password) {
    }

}
