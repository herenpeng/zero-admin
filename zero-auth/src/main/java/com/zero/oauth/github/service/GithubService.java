package com.zero.oauth.github.service;

import javax.servlet.http.HttpServletRequest;

/**
 * @author herenpeng
 * @since 2021-04-05 18:40
 */
public interface GithubService {

    /**
     * Github第三方登录
     *
     * @param code
     * @param state
     * @param request
     * @return
     * @throws Exception
     */
    String login(String code, String state, HttpServletRequest request) throws Exception;


}
