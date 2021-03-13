package com.zero.common.exception.handler;

import com.zero.common.exception.MyException;
import com.zero.common.exception.MyExceptionEnum;
import com.zero.common.response.CodeEnum;
import com.zero.common.response.domain.ResponseData;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;

/**
 * 全局异常处理类
 *
 * @author herenpeng
 * @since 2020-09-13 15:45
 */
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
        return ResponseData.code(CodeEnum.SYS_EXCEPTION.getValue()).message("系统发生异常");
    }


}
