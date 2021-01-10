package com.zero.upload.util;

import com.zero.common.constant.HttpConst;
import com.zero.common.exception.MyException;
import com.zero.common.exception.MyExceptionEnum;
import com.zero.common.properties.ZeroProperties;
import com.zero.upload.properties.FileUpload;
import com.zero.upload.properties.UploadProperties;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * 文件上传的工具类
 *
 * @author herenpeng
 * @since 2021-01-09 12:19
 */
@Component
public class UploadUtils {

    @Autowired
    private ZeroProperties zeroProperties;

    @Autowired
    private UploadProperties uploadProperties;

    @Autowired
    private HttpServletRequest request;

    /**
     * 上传图片类型文件
     *
     * @param file 图片类型文件
     * @return http图片请求路径
     * @throws IOException IO异常
     */
    public String uploadImage(MultipartFile file) throws IOException {
        FileUpload imageFile = uploadProperties.getImage();
        return upload(imageFile, file);
    }

    /**
     * 上传文件的私有方法
     *
     * @param fileUpload 上传文件的类型以及相关的属性
     * @param file       需要上传的文件
     * @return http图片请求路径
     * @throws IOException IO异常
     */
    private String upload(FileUpload fileUpload, MultipartFile file) throws IOException {
        if (!fileUpload.getAllowTypes().contains(file.getContentType())) {
            throw new MyException(MyExceptionEnum.FILE_TYPE_NOT_ALLOW);
        }
        String fileName = generateUniqueFileName(file.getOriginalFilename());
        String path = uploadProperties.getPath() + fileUpload.getPath() + File.separator + fileName;
        file.transferTo(new File(path));

        StringBuilder httpImage = new StringBuilder();
        httpImage.append(zeroProperties.getDomainName());
        String contextPath = request.getContextPath();
        if (StringUtils.isNotBlank(contextPath)) {
            httpImage.append(request.getContextPath());
        }
        httpImage.append(HttpConst.PATH_SEPARATOR).append(fileUpload.getPath())
                .append(HttpConst.PATH_SEPARATOR).append(fileName);
        return httpImage.toString();
    }

    /**
     * 文件名称替换工具，将文件名称替换为随机名称
     *
     * @param oldName
     * @return
     */
    private String generateUniqueFileName(String oldName) {
        String suffix = oldName.substring(oldName.lastIndexOf("."));
        return generateUniqueId() + suffix;
    }

    /**
     * 唯一ID生成器，可以生成唯一ID
     * 生成规则，通过uuid拼接当前的时间戳作为文件ID
     *
     * @return 唯一ID字符串
     */
    private String generateUniqueId() {
        return UUID.randomUUID().toString();
    }

}
