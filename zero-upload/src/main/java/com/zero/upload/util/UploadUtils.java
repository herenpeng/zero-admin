package com.zero.upload.util;

import com.zero.common.constant.HttpConst;
import com.zero.common.constant.StringConst;
import com.zero.common.exception.MyException;
import com.zero.common.exception.MyExceptionEnum;
import com.zero.common.properties.ZeroProperties;
import com.zero.upload.properties.FileUpload;
import com.zero.upload.properties.UploadProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.UUID;

/**
 * 文件上传的工具类
 *
 * @author herenpeng
 * @since 2021-01-09 12:19
 */
@Slf4j
@Component
public class UploadUtils {

    @Autowired
    private ZeroProperties zeroProperties;

    @Autowired
    private UploadProperties uploadProperties;

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
        // 判断上传的类型是否为允许上传的文件类型，
        if (!fileUpload.getAllowTypes().contains(file.getContentType())) {
            log.warn("[文件上传]上传的文件：{}，格式不被允许", file.getOriginalFilename());
            throw new MyException(MyExceptionEnum.FILE_TYPE_NOT_ALLOW);
        }
        // 将文件名称替换为唯一名称，保证文件之间不会因为同名覆盖
        String fileName = generateUniqueFileName(file.getOriginalFilename());
        // 生成磁盘存储路径
        String path = generateFilePath(fileUpload, fileName);
        // 判断存储路径，如果存储路径不存在，则创建存储文件夹
        File newFile = new File(path);
        File parentFile = newFile.getParentFile();
        if (!parentFile.exists()) {
            // 多级目录创建
            parentFile.mkdirs();
        }
        // 将文件存入磁盘中
        file.transferTo(newFile);

        // 生成http请求引用路径
        return generateFileUri(fileUpload, fileName);
    }


    /**
     * 生成日期形式的磁盘存储路径，
     * 例如：2021-01-30上传的文件，存放在2020\01\30的文件夹下面
     *
     * @param fileUpload 上传文件的类型以及相关的属性
     * @param fileName   文件名称
     * @return 文件存储路径
     */
    private String generateFilePath(FileUpload fileUpload, String fileName) {
        Calendar calendar = Calendar.getInstance();
        // 存储图片的路径
        return uploadProperties.getPath() + fileUpload.getPath() +
                // 存储年份路径
                File.separator + calendar.get(Calendar.YEAR) +
                // 存储月份路径
                File.separator + (calendar.get(Calendar.MONTH) + 1) +
                // 存储日期路径
                File.separator + calendar.get(Calendar.DAY_OF_MONTH) +
                // 存储文件名称
                File.separator + fileName;
    }

    /**
     * 生成日期格式的http引用路径
     * 例如：2021-01-30上传的文件，日期引用路径为2020/01/30
     *
     * @param fileUpload 上传文件的类型以及相关的属性
     * @param fileName   文件名称
     * @return 文件引用路径
     */
    private String generateFileUri(FileUpload fileUpload, String fileName) {
        Calendar calendar = Calendar.getInstance();
        // 项目http域名
        return zeroProperties.getApiPath() +
                // 存储图片的顶级路径
                HttpConst.PATH_SEPARATOR + fileUpload.getPath() +
                // 存储年份路径
                HttpConst.PATH_SEPARATOR + calendar.get(Calendar.YEAR) +
                // 存储月份路径
                HttpConst.PATH_SEPARATOR + (calendar.get(Calendar.MONTH) + 1) +
                // 存储日期路径
                HttpConst.PATH_SEPARATOR + calendar.get(Calendar.DAY_OF_MONTH) +
                // 存储文件名称
                HttpConst.PATH_SEPARATOR + fileName;
    }

    /**
     * 文件名称替换工具，将文件名称替换为随机名称
     *
     * @param oldName
     * @return
     */
    private String generateUniqueFileName(String oldName) {
        String suffix = oldName.substring(oldName.lastIndexOf(StringConst.POINT));
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
