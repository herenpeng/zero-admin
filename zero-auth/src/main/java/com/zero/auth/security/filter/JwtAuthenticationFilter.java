package com.zero.auth.security.filter;

import com.zero.auth.entity.User;
import com.zero.common.util.JsonUtils;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author herenpeng
 * @since 2021-04-05 14:58
 */
public class JwtAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

    private final AuthenticationManager authenticationManager;

    private final JsonUtils jsonUtils;

    public JwtAuthenticationFilter(AuthenticationManager authenticationManager, JsonUtils jsonUtils) {
        this.authenticationManager = authenticationManager;
        this.jsonUtils = jsonUtils;
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        User user = jsonUtils.toObject(request, User.class);
        String username = user.getUsername();
        username = username != null ? username : "";
        String password = user.getPassword();
        password = password != null ? password : "";
        UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password);
        return authenticationManager.authenticate(authRequest);
    }


}
