package com.zero.sys.exception.handler;

import com.zero.common.response.domain.ResponseData;
import org.springframework.http.ResponseEntity;
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
    // @ExceptionHandler(AccessDeniedException.class)
    public ResponseEntity<ResponseData> notLoginExceptionHandler(HttpServletRequest request, Exception e) {
        e.printStackTrace();
        ResponseData responseData = new ResponseData(50000,"系统未登录");
        return ResponseEntity.ok(responseData);
    }

    @ResponseBody
    @ExceptionHandler(Exception.class)
    public ResponseEntity<ResponseData> exceptionHandler(HttpServletRequest request, Exception e) {
        e.printStackTrace();
        ResponseData responseData = new ResponseData(50000,"系统发送异常");
        return ResponseEntity.ok(responseData);
    }


}
