package com.zero.common.exception.handler;

import com.zero.common.exception.MyExceptionEnum;
import io.swagger.annotations.Api;
import org.springframework.boot.autoconfigure.web.ErrorProperties;
import org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.servlet.error.DefaultErrorAttributes;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Filter过滤器异常处理控制器
 *
 * @author herenpeng
 * @since 2020-11-21 22:14
 */
@Api(value = "过滤器异常处理接口", tags = "ErrorController")
@ApiIgnore
@RestController
public class ErrorController extends BasicErrorController {

    public ErrorController() {
        super(new DefaultErrorAttributes(), new ErrorProperties());
    }

    @Override
    @RequestMapping(produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<Map<String, Object>> error(HttpServletRequest request) {
        Map<String, Object> errorAttributes = getErrorAttributes(request, ErrorAttributeOptions.of(
                ErrorAttributeOptions.Include.EXCEPTION,
                ErrorAttributeOptions.Include.MESSAGE,
                ErrorAttributeOptions.Include.STACK_TRACE,
                ErrorAttributeOptions.Include.BINDING_ERRORS));
        HttpStatus status = getStatus(request);
        Map<String, Object> responseData = new HashMap<>(8);
        responseData.put("code", MyExceptionEnum.ILLEGAL_TOKEN.getCode());
        responseData.put("message", MyExceptionEnum.ILLEGAL_TOKEN.getMessage());
        return ResponseEntity.ok(responseData);
    }

}
