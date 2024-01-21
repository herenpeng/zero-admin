package com.zero.common.http.kit;

import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import com.zero.common.enums.EncodingEnum;
import com.zero.common.kit.JsonKit;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.zip.GZIPInputStream;

/**
 * @author herenpeng
 * @since 2021-04-27 22:45
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class HttpKit {

    private final JsonKit jsonKit;

    /**
     * gzip解码方法
     *
     * @param responseEntity ResponseEntity对象
     * @param clazz          实体字节码对象
     * @return 字节码对象对应的实体对象
     * @throws IOException IO异常
     */
    public <T> T gzipDecode(ResponseEntity<String> responseEntity, Class<T> clazz) throws IOException {
        T object = null;
        try {
            String body = responseEntity.getBody();
            if (StringUtils.isBlank(body)) {
                return object;
            }
            byte[] bytes = body.getBytes(EncodingEnum.ISO_8859_1.getValue());
            InputStream inputStream = new ByteArrayInputStream(bytes);
            GZIPInputStream gzipInputStream = new GZIPInputStream(inputStream);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            int len;
            while ((len = gzipInputStream.read(buffer)) >= 0) {
                out.write(buffer, 0, len);
            }
            object = jsonKit.toObject(out.toString(), clazz);
        } catch (Exception e) {
            log.error("[HTTP工具类]gzip解码失败，{}", e.getMessage());
        }
        return object;
    }


    private static final String USER_AGENT = "User-Agent";

    public static UserAgent getUserAgent(HttpServletRequest request) {
        String userAgentString = request.getHeader(USER_AGENT);
        return UserAgentUtil.parse(userAgentString);
    }


}
