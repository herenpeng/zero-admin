package com.zero.sys.mybatisplus.handler;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.zero.auth.entity.User;
import com.zero.auth.security.util.SecurityUtils;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpServletRequest;

/**
 * MyBatisPlus拦截器，用于自动配置数据库数据的创建人和更新人
 *
 * @author herenpeng
 * @since 2020-11-03 23:10
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    private final HttpServletRequest request;

    private final SecurityUtils securityUtils;

    /**
     * 数据的创建用户的属性名称
     */
    private static final String CREATE_USER_ID = "createUserId";
    /**
     * 数据的更新用户的属性名称
     */
    private static final String UPDATE_USER_ID = "updateUserId";


    @SneakyThrows
    @Override
    public void insertFill(MetaObject metaObject) {
        this.setFieldValByName(CREATE_USER_ID, getUserId(), metaObject);
        this.setFieldValByName(UPDATE_USER_ID, getUserId(), metaObject);
    }

    @SneakyThrows
    @Override
    public void updateFill(MetaObject metaObject) {
        this.setFieldValByName(UPDATE_USER_ID, getUserId(), metaObject);
    }

    /**
     * 获取当前登录系统的用户主键信息
     *
     * @return 当前登录系统用户的主键
     */
    private Integer getUserId() {
        // 用户Id为0，表示为系统
        Integer userId = 0;
        try {
            User user = securityUtils.getUser(request);
            userId = user.getId();
        } catch (Exception e) {
            log.debug("[数据操作用户拦截器]当前数据操作为系统执行");
        }
        return userId;
    }

}
