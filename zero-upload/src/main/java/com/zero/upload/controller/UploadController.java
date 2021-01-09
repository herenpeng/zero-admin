package com.zero.upload.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 文件上传控制器
 *
 * @author herenpeng
 * @since 2021-01-09 12:15
 */
@Api(value = "文件上传操作接口", tags = "UploadController")
@RestController
@RequestMapping("upload")
public class UploadController {

    // @Autowired
    // private UploadService uploadService;
    //
    // @LogOperation
    // @ApiOperation(value = "上传图片文件")
    // @ApiImplicitParams({
    //         @ApiImplicitParam(name = "file", value = "上传的图片文件", required = true)
    // })
    // @PostMapping("image")
    // public ResponseData<String> upload(@RequestParam("file") MultipartFile file) throws Exception {
    //     String filePath = uploadService.uploadImage(file);
    //     return ResponseData.ok(filePath);
    // }
}
