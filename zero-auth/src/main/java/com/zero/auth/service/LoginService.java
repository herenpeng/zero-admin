package com.zero.auth.service;

import jakarta.servlet.http.HttpServletRequest;

public interface LoginService {
    String login(String username, String password, HttpServletRequest request);

    void logout(HttpServletRequest request);
}
