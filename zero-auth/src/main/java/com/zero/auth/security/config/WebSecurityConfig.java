package com.zero.auth.security.config;

import com.zero.auth.security.constant.SecurityConst;
import com.zero.auth.security.handler.MyAuthenticationEntryPoint;
import com.zero.auth.security.filter.SecurityAccessDecisionManager;
import com.zero.auth.security.filter.SecurityFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.ObjectPostProcessor;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.web.cors.CorsUtils;

/**
 * SpringSecurity配置类
 *
 * @author herenpeng
 * @since 2020-09-13 8:26
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true, jsr250Enabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private SecurityFilter securityFilter;

    @Autowired
    private SecurityAccessDecisionManager securityAccessDecisionManager;

    /**
     * 登录成功处理器
     */
    @Autowired
    private AuthenticationSuccessHandler authenticationSuccessHandler;

    /**
     * 登录失败处理器
     */
    @Autowired
    private AuthenticationFailureHandler authenticationFailureHandler;

    /**
     * 退出登录处理器
     */
    @Autowired
    private LogoutHandler logoutHandler;

    @Autowired
    private MyAuthenticationEntryPoint myAuthenticationEntryPoint;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        // Security密码加密算法
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        // 放行请求名单配置
        web.ignoring().antMatchers(SecurityConst.RELEASE_LIST);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        // 处理跨域请求中的Preflight请求,响应头中附带允许跨域的请求头，这个配置必须放置前面
        http.cors().and().csrf().disable().authorizeRequests()
                .requestMatchers(CorsUtils::isPreFlightRequest).permitAll();

        // 授权异常处理器
        http.authorizeRequests().and().exceptionHandling()
                .authenticationEntryPoint(myAuthenticationEntryPoint);

        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry authorizeRequests = http.authorizeRequests();

        authorizeRequests.withObjectPostProcessor(new ObjectPostProcessor<FilterSecurityInterceptor>() {
            @Override
            public <O extends FilterSecurityInterceptor> O postProcess(O o) {
                o.setSecurityMetadataSource(securityFilter);
                o.setAccessDecisionManager(securityAccessDecisionManager);
                return o;
            }
        });

        // 其余所有请求都需要登录后认证才能访问能访问
        authorizeRequests.anyRequest().authenticated();

        // 定义登录请求的表单提交处理接口，Security默认帮我们实现了
        http.formLogin().loginProcessingUrl(SecurityConst.LOGIN_PATH)
                // 登录成功的处理器
                .successHandler(authenticationSuccessHandler)
                // 登录失败的处理器
                .failureHandler(authenticationFailureHandler)
                // 和表单登录相关的接口统统都直接通过,不进行拦截
                .permitAll();

        http.logout().logoutUrl(SecurityConst.LOGOUT_PATH)
                // 退出登录的处理器
                .addLogoutHandler(logoutHandler)
                .permitAll();

        // 关闭CSRF防御，方便用postman进行接口测试
        // http.csrf().disable();
    }
}
