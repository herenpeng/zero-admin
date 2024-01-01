package com.zero.oauth.github.controller;

import com.zero.auth.security.jwt.properties.JwtProperties;
import com.zero.common.properties.AppProperties;
import com.zero.oauth.github.service.GithubService;
import com.zero.oauth.properties.OAuthProperties;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import io.swagger.v3.oas.annotations.Hidden;

import jakarta.servlet.http.HttpServletRequest;

/**
 * @author herenpeng
 * @since 2021-04-05 18:34
 */
@Hidden
@RequiredArgsConstructor
@Controller
@RequestMapping("oauth/github")
public class GithubController {

    private final GithubService githubService;

    private final OAuthProperties oAuthProperties;

    private final JwtProperties jwtProperties;

    private final AppProperties appProperties;

    @GetMapping("login")
    public String login(String code, String state, HttpServletRequest request) throws Exception {
        String token = githubService.login(code, state, request);
        request.setAttribute(jwtProperties.getKey(), token);
        request.setAttribute(oAuthProperties.getTargetOriginKey(), appProperties.getVueDomain());
        return oAuthProperties.getMessagePage();
    }

}
