package com.zero.upload.service.impl;

import com.zero.upload.service.UploadService;
import com.zero.upload.util.UploadUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @author herenpeng
 * @since 2021-01-09 12:16
 */
@Slf4j
@RequiredArgsConstructor
@Service
@Transactional(rollbackFor = Exception.class)
public class UploadServiceImpl implements UploadService {

    private final UploadUtils uploadUtils;

    @Override
    public String uploadImage(MultipartFile file) throws IOException {
        return uploadUtils.uploadImage(file);
    }

}
