package com.zero.upload.service.impl;

import com.zero.upload.service.UploadService;
import com.zero.upload.util.UploadUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @author herenpeng
 * @since 2021-01-09 12:16
 */
@Service
public class UploadServiceImpl implements UploadService {


    @Autowired
    private UploadUtils uploadUtils;

    @Override
    public String uploadImage(MultipartFile file) throws IOException {
        String filePath = uploadUtils.uploadImage(file);
        return filePath;
    }

}
