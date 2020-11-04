package com.zero.sys.mybatisplus.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.zero.sys.domain.User;
import com.zero.sys.request.util.RequestUtils;
import com.zero.sys.security.jwt.util.JwtUtils;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * @author herenpeng
 * @since 2020-11-03 23:10
 */
@Slf4j
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private RequestUtils requestUtils;

    @Autowired
    private JwtUtils jwtUtils;

    @SneakyThrows
    @Override
    public void insertFill(MetaObject metaObject) {
        Integer userId = null;
        try {
            String token = requestUtils.getToken(request);
            User user = jwtUtils.getUserInfo(token);
            userId = user.getId();
        }catch (Exception e) {
            userId = 0;
        }finally {
            this.setFieldValByName("createUserId", userId, metaObject);
            this.setFieldValByName("updateUserId", userId, metaObject);
        }
    }

    @SneakyThrows
    @Override
    public void updateFill(MetaObject metaObject) {
        Integer userId = null;
        try {
            String token = requestUtils.getToken(request);
            User user = jwtUtils.getUserInfo(token);
            userId = user.getId();
        }catch (Exception e) {
            userId = 0;
        }finally {
            this.setFieldValByName("updateUserId", userId, metaObject);
        }
    }
}
