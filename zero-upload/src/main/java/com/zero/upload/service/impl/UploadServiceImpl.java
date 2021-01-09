package com.zero.upload.service.impl;

import com.zero.upload.properties.ImageUploadProperties;
import com.zero.upload.service.UploadService;
import com.zero.upload.util.UploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * @author herenpeng
 * @since 2021-01-09 12:16
 */
@Service
public class UploadServiceImpl implements UploadService {

    @Autowired
    private ImageUploadProperties imageUploadProperties;

    @Autowired
    private UploadUtils uploadUtils;

    @Override
    public String uploadImage(MultipartFile file) throws IOException {
        if (!imageUploadProperties.getAllowTypes().contains(file.getContentType())) {
            throw new IOException("文件上传类型错误！");
        }
        String fileName = uploadUtils.generateFileName(file.getOriginalFilename());
        file.transferTo(new File(imageUploadProperties.getPath() + fileName));
        return fileName;
    }

}
