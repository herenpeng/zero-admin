package com.zero.sys.mybatisplus.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.zero.sys.entity.User;
import com.zero.sys.request.util.RequestUtils;
import com.zero.sys.security.jwt.util.JwtUtils;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * MyBatisPlus拦截器，用于自动配置数据库数据的创建人和更新人
 *
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
        this.setFieldValByName("createUserId", getUserId(), metaObject);
        this.setFieldValByName("updateUserId", getUserId(), metaObject);
    }

    @SneakyThrows
    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName("updateUserId", getUserId(), metaObject);
    }

    /**
     * 获取当前登录系统的用户主键信息
     *
     * @return 当前登录系统用户的主键
     * @throws JsonProcessingException
     */
    private Integer getUserId() throws JsonProcessingException {
        // 用户Id为0，表示为系统
        Integer userId = 0;
        try {
            User user = jwtUtils.getUserInfo(request);
            userId = user.getId();
        } catch (Exception e) {
            log.info("[数据操作用户拦截器]当前数据操作为系统执行");
        } finally {
            return userId;
        }

    }

}
