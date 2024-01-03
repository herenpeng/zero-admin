package com.zero.common.exception.handler;

import com.zero.common.domain.ResponseEntity;
import com.zero.common.exception.AppExceptionEnum;
import com.zero.common.kit.JsonKit;
import io.swagger.v3.oas.annotations.Hidden;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.boot.autoconfigure.web.ErrorProperties;
import org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController;
import org.springframework.boot.web.servlet.error.DefaultErrorAttributes;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * Filter过滤器异常处理控制器
 *
 * @author herenpeng
 * @since 2020-11-21 22:14
 */
@Tag(description = "过滤器异常处理接口", name = "ErrorController")
@Hidden
@RestController
public class ErrorController extends BasicErrorController {

    public ErrorController(JsonKit jsonKit) {
        super(new DefaultErrorAttributes(), new ErrorProperties());
        this.jsonKit = jsonKit;
    }

    private final JsonKit jsonKit;

    @Override
    @RequestMapping(produces = {MediaType.APPLICATION_JSON_VALUE})
    public org.springframework.http.ResponseEntity<Map<String, Object>> error(HttpServletRequest request) {
        ResponseEntity<Void> responseEntity = ResponseEntity.code(AppExceptionEnum.SYS_EXCEPTION.getCode(), AppExceptionEnum.SYS_EXCEPTION.getMessage());
        Map<String, Object> map = jsonKit.toMap(responseEntity);
        return org.springframework.http.ResponseEntity.ok(map);
    }

}
