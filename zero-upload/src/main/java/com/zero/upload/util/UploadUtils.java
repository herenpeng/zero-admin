package com.zero.upload.util;

import org.springframework.stereotype.Component;

import java.util.UUID;

/**
 * @author herenpeng
 * @since 2021-01-09 12:19
 */
@Component
public class UploadUtils {

    /**
     * 文件名称替换工具，将文件名称替换为随机名称
     *
     * @param oldName
     * @return
     */
    public String generateFileName(String oldName) {
        String suffix = oldName.substring(oldName.lastIndexOf("."));
        return generateUniqueId() + suffix;
    }

    /**
     * 唯一ID生成器，可以生成唯一ID
     * 生成规则，通过uuid拼接当前的时间戳作为文件ID
     *
     * @return 唯一ID字符串
     */
    public String generateUniqueId() {
        return UUID.randomUUID().toString() + System.currentTimeMillis();
    }

}
