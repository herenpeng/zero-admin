package com.zero.upload.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author herenpeng
 * @since 2021-01-09 12:15
 */
public interface UploadService {

    /**
     * 上传图片
     *
     * @param file
     * @return
     * @throws Exception
     */
    String uploadImage(MultipartFile file) throws Exception;

}
