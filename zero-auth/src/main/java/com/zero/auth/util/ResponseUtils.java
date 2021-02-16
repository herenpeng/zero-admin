package com.zero.auth.util;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zero.common.http.constant.HttpConst;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * HttpServletResponse的封装工具类
 *
 * @author herenpeng
 * @since 2020-09-13 19:00
 */
@Component
public class ResponseUtils {

    @Autowired
    private ObjectMapper objectMapper;

    /**
     * response对象返回json数据给前端的封装方法，将object参数转换为json数据，并返回给前台
     *
     * @param response HttpServletResponse对象
     * @param object   需要返回给前端的对象，方法会将该对象转换为json数据返回给前端
     * @throws IOException IO异常
     */
    public void responseJson(HttpServletResponse response, Object object) throws IOException {
        response.setContentType(HttpConst.CONTENT_TYPE_APPLICATION_JSON);
        PrintWriter writer = response.getWriter();
        writer.write(objectMapper.writeValueAsString(object));
        writer.flush();
        writer.close();
    }


}
