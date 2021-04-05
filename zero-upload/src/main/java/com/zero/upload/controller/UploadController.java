package com.zero.upload.controller;

import com.zero.common.annotation.LogOperation;
import com.zero.common.response.domain.ResponseData;
import com.zero.upload.service.UploadService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
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
@Api(value = "文件上传操作接口", tags = "UploadController")
@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping("upload")
public class UploadController {

    private final UploadService uploadService;

    @LogOperation
    @ApiOperation(value = "上传图片文件")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "file", value = "上传的图片文件", dataTypeClass = MultipartFile.class, required = true)
    })
    @PostMapping("image")
    public ResponseData<String> image(@RequestParam("file") MultipartFile file) throws Exception {
        String filePath = uploadService.uploadImage(file);
        return ResponseData.ok(filePath);
    }
}
