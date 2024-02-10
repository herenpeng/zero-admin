package com.zero.sys.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author herenpeng
 * @since 2021-01-09 12:15
 */
public interface UploadService {

    /**
     * 上传图片
     *
     * @param file 图片文件
     * @return 上传成功后的资源路径
     * @throws Exception 抛出异常
     */
    String uploadImage(MultipartFile file) throws Exception;

}
