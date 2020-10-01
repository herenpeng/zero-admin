package com.zero.sys.exception.handler;

import com.zero.common.response.domain.CodeEnum;
import com.zero.common.response.domain.ResponseData;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 全局异常处理类
 * @author herenpeng
 * @since 2020-09-13 15:45
 */
@ControllerAdvice(value = {"com.zero"})
public class MyExceptionHandler {

    /**
     * 处理未登录的请求异常
     *
     * @param request Http请求
     * @param e 异常
     * @return
     */
    @ResponseBody
    @ExceptionHandler(AccessDeniedException.class)
    public ResponseData notLoginExceptionHandler(HttpServletRequest request, Exception e) {
        e.printStackTrace();
        ResponseData<String> responseData = ResponseData.code(CodeEnum.NOT_LOGIN.getValue()).data("系统未登录");
        return responseData;
    }

    @ResponseBody
    @ExceptionHandler(Exception.class)
    public ResponseData exceptionHandler(HttpServletRequest request, Exception e) {
        e.printStackTrace();
        ResponseData<String> responseData = ResponseData.code(CodeEnum.SYS_EXCEPTION.getValue()).data("系统发生异常");
        return responseData;
    }


}
