package com.zero.common.exception.handler;

import com.zero.common.exception.AppException;
import com.zero.common.exception.AppExceptionEnum;
import com.zero.common.domain.ResponseEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import jakarta.servlet.http.HttpServletRequest;

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
    @ExceptionHandler(AppException.class)
    public ResponseEntity<Void> AppExceptionHandler(HttpServletRequest request, AppException e) {
        AppExceptionEnum exceptionEnum = e.getExceptionEnum();
        log.error("[全局异常处理]发生业务异常，异常信息：{}，code：{}，message：{}", e.getExceptionEnum(), exceptionEnum.getCode(), exceptionEnum.getMessage());
        return ResponseEntity.code(exceptionEnum.getCode(), exceptionEnum.getMessage());
    }


    /**
     * 拦截所有系统异常
     *
     * @param request HttpServletRequest 对象
     * @param e       异常对象
     * @return 响应对象
     */
    @ExceptionHandler(Exception.class)
    public ResponseEntity<Void> exceptionHandler(HttpServletRequest request, Exception e) {
        e.printStackTrace();
        log.error("[全局异常处理]发生系统异常，异常信息：{}", e.getMessage());
        return ResponseEntity.code(AppExceptionEnum.SYS_EXCEPTION.getCode(), "系统发生异常");
    }


}
