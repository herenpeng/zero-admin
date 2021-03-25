package com.zero.common.exception.handler;

import com.zero.common.exception.MyException;
import com.zero.common.exception.MyExceptionEnum;
import com.zero.common.response.CodeEnum;
import com.zero.common.response.domain.ResponseData;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;

/**
 * 全局异常处理类
 *
 * @author herenpeng
 * @since 2020-09-13 15:45
 */
@Slf4j
@RestControllerAdvice(value = {"com.zero"})
public class GlobalExceptionHandler {

    /**
     * 拦截所有自定义异常
     *
     * @param request HttpServletRequest 对象
     * @param e       异常对象
     * @return 响应对象
     */
    @ExceptionHandler(MyException.class)
    public ResponseData<Void> myExceptionHandler(HttpServletRequest request, MyException e) {
        e.printStackTrace();
        log.error("[全局异常处理]发生业务异常，异常信息：{}", e.getMessage());
        MyExceptionEnum myExceptionEnum = e.getMyExceptionEnum();
        return ResponseData.code(myExceptionEnum.getCode()).message(myExceptionEnum.getMessage());
    }


    /**
     * 拦截所有系统异常
     *
     * @param request HttpServletRequest 对象
     * @param e       异常对象
     * @return 响应对象
     */
    @ExceptionHandler(Exception.class)
    public ResponseData<Void> exceptionHandler(HttpServletRequest request, Exception e) {
        e.printStackTrace();
        log.error("[全局异常处理]发生系统异常，异常信息：{}", e.getMessage());
        return ResponseData.code(CodeEnum.SYS_EXCEPTION.getValue()).message("系统发生异常");
    }


}
