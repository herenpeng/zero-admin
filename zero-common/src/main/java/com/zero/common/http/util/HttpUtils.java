package com.zero.common.http.util;

import com.zero.common.enums.EncodingEnum;
import com.zero.common.kit.JsonKit;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
public class HttpUtils {

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
        T clazzInstance = null;
        try {
            byte[] bytes = responseEntity.getBody().getBytes(EncodingEnum.ISO_8859_1.getValue());
            InputStream inputStream = new ByteArrayInputStream(bytes);
            GZIPInputStream gzipInputStream = new GZIPInputStream(inputStream);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            int len;
            while ((len = gzipInputStream.read(buffer)) >= 0) {
                out.write(buffer, 0, len);
            }
            clazzInstance = jsonKit.toObject(out.toString(), clazz);
        } catch (Exception e) {
            log.error("[HTTP工具类]gzip解码失败");
            e.printStackTrace();
        }
        return clazzInstance;
    }

}
