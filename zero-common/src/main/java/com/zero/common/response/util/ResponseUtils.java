package com.zero.common.response.util;

import com.zero.common.enums.EncodingEnums;
import com.zero.common.util.JsonUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * HttpServletResponse的封装工具类
 *
 * @author herenpeng
 * @since 2020-09-13 19:00
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class ResponseUtils {

    private final JsonUtils jsonUtils;

    /**
     * response对象返回json数据给前端的封装方法，将object参数转换为json数据，并返回给前台
     *
     * @param response HttpServletResponse对象
     * @param object   需要返回给前端的对象，方法会将该对象转换为json数据返回给前端
     * @throws IOException IO异常
     */
    public void responseJson(HttpServletResponse response, Object object) throws IOException {
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        response.setCharacterEncoding(EncodingEnums.UTF_8.getValue());
        PrintWriter writer = response.getWriter();
        writer.write(jsonUtils.toJson(object));
        writer.flush();
        writer.close();
    }

}
