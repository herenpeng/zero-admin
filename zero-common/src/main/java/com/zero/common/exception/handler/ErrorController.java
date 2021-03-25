package com.zero.common.exception.handler;

import com.zero.common.exception.MyExceptionEnum;
import com.zero.common.response.domain.ResponseData;
import com.zero.common.util.JsonUtils;
import io.swagger.annotations.Api;
import lombok.SneakyThrows;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.web.ErrorProperties;
import org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController;
import org.springframework.boot.web.error.ErrorAttributeOptions;
import org.springframework.boot.web.servlet.error.DefaultErrorAttributes;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletRequest;
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

    @Autowired
    private JsonUtils jsonUtils;

    @SneakyThrows
    @Override
    @RequestMapping(produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<Map<String, Object>> error(HttpServletRequest request) {
        Map<String, Object> errorAttributes = getErrorAttributes(request, ErrorAttributeOptions.of(
                ErrorAttributeOptions.Include.EXCEPTION,
                ErrorAttributeOptions.Include.MESSAGE,
                ErrorAttributeOptions.Include.STACK_TRACE,
                ErrorAttributeOptions.Include.BINDING_ERRORS));
        ResponseData<Void> responseData = ResponseData.code(MyExceptionEnum.ILLEGAL_TOKEN.getCode());
        responseData.message(MyExceptionEnum.ILLEGAL_TOKEN.getMessage());
        Map<String, Object> map = jsonUtils.toMap(responseData);
        return ResponseEntity.ok(map);
    }

}
