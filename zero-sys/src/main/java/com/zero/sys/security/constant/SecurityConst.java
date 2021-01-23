package com.zero.sys.security.constant;

/**
 * 系统安全相关常量信息
 *
 * @author herenpeng
 * @since 2021-01-23 16:53
 */
public class SecurityConst {

    /**
     * 登录请求路径
     */
    public static final String LOGIN_PATH = "/login";
    /**
     * 登出请求路径
     */
    public static final String LOGOUT_PATH = "/logout";

    /**
     * 权限不足角色标识符
     */
    public static final String ACCESS_DENIED = "ACCESS_DENIED";

    /**
     * 角色前缀
     */
    public static final String ROLE_ = "ROLE_";

    /**
     * 放行名单
     * 路径中的*号，一颗星号匹配一级请求路径，两颗星号匹配多级请求路径
     */
    public static final String[] RELEASE_LIST = new String[]{
            // websocket相关请求路径
            "/websocket/**",
            // swagger2相关请求路径
            "/swagger-resources/**",
            "/swagger-ui/**",
            "/v3/**",
            // 静态资源文件
            "/image/**"
    };


}
