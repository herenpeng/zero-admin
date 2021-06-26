package com.zero.oauth.github.service;

import javax.servlet.http.HttpServletRequest;

/**
 * GitHub 业务处理逻辑层
 *
 * @author herenpeng
 * @since 2021-04-05 18:40
 */
public interface GithubService {

    /**
     * Github第三方登录
     *
     * @param code    GitHub 授权获取的 CODE
     * @param state   state
     * @param request HttpServletRequest 对象
     * @return toekn
     * @throws Exception 抛出异常
     */
    String login(String code, String state, HttpServletRequest request) throws Exception;


}
