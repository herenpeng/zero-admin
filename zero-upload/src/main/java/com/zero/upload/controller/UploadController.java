package com.zero.upload.controller;

import com.zero.common.annotation.LogOperation;
import com.zero.common.response.domain.ResponseData;
import com.zero.upload.service.UploadService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.Parameters;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * 文件上传控制器
 *
 * @author herenpeng
 * @since 2021-01-09 12:15
 */
@Tag(description = "文件上传操作接口", name = "UploadController")
@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("upload")
public class UploadController {

    private final UploadService uploadService;

    @LogOperation
    @Operation(description = "上传图片文件")
    @Parameters({
            @Parameter(name = "file", description = "上传的图片文件", required = true)
    })
    @PostMapping("image")
    public ResponseData<String> image(@RequestParam("file") MultipartFile file) throws Exception {
        String filePath = uploadService.uploadImage(file);
        return ResponseData.ok(filePath);
    }
}
