package com.zero.oauth.github.controller;

import com.zero.common.util.JsonUtils;
import com.zero.oauth.github.service.GithubService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;

/**
 * @author herenpeng
 * @since 2021-04-05 18:34
 */
@ApiIgnore
@RequiredArgsConstructor
@Controller
@RequestMapping("oauth/github")
public class GithubController {

    private final GithubService githubService;

    private final JsonUtils jsonUtils;

    @GetMapping("login")
    public String login(String code, String state, HttpServletRequest request) throws Exception {
        String token = githubService.login(code, state, request);
        return "oauth-login";
    }

}
