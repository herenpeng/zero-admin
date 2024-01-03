package com.zero.upload.util;

import com.zero.auth.kit.TokenKit;
import com.zero.common.constant.AppConst;
import com.zero.common.exception.AppException;
import com.zero.common.exception.AppExceptionEnum;
import com.zero.common.properties.AppProperties;
import com.zero.upload.entity.FileManage;
import com.zero.upload.enums.FileTypeEnums;
import com.zero.upload.mapper.FileManageMapper;
import com.zero.upload.properties.FileUpload;
import com.zero.upload.properties.UploadProperties;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Component;
import org.springframework.util.ObjectUtils;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * 文件上传的工具类
 *
 * @author herenpeng
 * @since 2021-01-09 12:19
 */
@Slf4j
@RequiredArgsConstructor
@Component
public class UploadUtils {

    private final AppProperties appProperties;

    private final UploadProperties uploadProperties;

    private final TokenKit tokenKit;

    private final HttpServletRequest request;

    private final FileManageMapper fileManageMapper;

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
            throw new AppException(AppExceptionEnum.FILE_TYPE_NOT_ALLOW);
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
        String uri = generateFileUri(fileUpload.getPath(), fileName);

        FileManage fileManage = new FileManage();
        fileManage.setName(file.getOriginalFilename());
        fileManage.setType(FileTypeEnums.IMAGE);
        fileManage.setPath(newFile.getPath());
        fileManage.setUri(uri);
        fileManage.setUploadTime(new Date());
        fileManage.setUploadUserId(tokenKit.getUserId(request));
        fileManageMapper.insert(fileManage);
        return uri;
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
     * @param uploadPath 上传文件的类型以及相关的属性
     * @param fileName   文件名称
     * @return 文件引用路径
     */
    private String generateFileUri(String uploadPath, String fileName) {
        Calendar calendar = Calendar.getInstance();
        // 项目http域名
        return appProperties.getApiPath() +
                // 存储图片的顶级路径
                AppConst.PATH_SEPARATOR + uploadPath +
                // 存储年份路径
                AppConst.PATH_SEPARATOR + calendar.get(Calendar.YEAR) +
                // 存储月份路径
                AppConst.PATH_SEPARATOR + (calendar.get(Calendar.MONTH) + 1) +
                // 存储日期路径
                AppConst.PATH_SEPARATOR + calendar.get(Calendar.DAY_OF_MONTH) +
                // 存储文件名称
                AppConst.PATH_SEPARATOR + fileName;
    }

    /**
     * 生成备份文件名称
     *
     * @param name     源文件名称
     * @param bakCount 备份文件已有个数
     * @return 备份文件名称
     */
    private String generateBakFileName(String name, int bakCount) {
        // 获取源文件名称后缀
        String suffix = name.substring(name.lastIndexOf(AppConst.POINT));
        // 获取源文件名称，不含后缀
        String fileName = name.substring(0, name.lastIndexOf(AppConst.POINT));
        // 生成备份文件的名称
        String bakFileName = fileName + AppConst.POINT + uploadProperties.getBakSuffix()
                + AppConst.POINT + (bakCount + 1) + suffix;
        return bakFileName;
    }

    /**
     * 文件名称替换工具，将文件名称替换为随机名称
     *
     * @param oldName
     * @return
     */
    private String generateUniqueFileName(String oldName) {
        String suffix = oldName.substring(oldName.lastIndexOf(AppConst.POINT));
        return UUID.randomUUID().toString() + suffix;
    }


    /**
     * 通过源文件备份一个备份文件
     *
     * @param fileManage 需要备份的源文件对象
     * @param bakCount   源文件已有的备份文件个数
     * @throws IOException 抛出IO异常
     */
    public void bakFile(FileManage fileManage, Integer bakCount) throws IOException {
        // 创建一个备份文件对象
        FileManage bakFile = new FileManage();
        bakFile.setParentId(fileManage.getId());
        bakFile.setName(fileManage.getName());
        bakFile.setType(fileManage.getType());
        bakFile.setUploadTime(new Date());
        bakFile.setUploadUserId(tokenKit.getUserId(request));
        // 源文件磁盘路径
        String path = fileManage.getPath();
        // 获取源文件
        File srcFile = new File(path);
        // 获取源文件名称
        String name = srcFile.getName();
        // 生成备份文件名称
        String bakFileName = generateBakFileName(name, bakCount);
        // 通过上传的文件类型获取对应的上传文件存储信息
        FileUpload fileUpload = getFileUpload(fileManage.getType());
        // 设置备份文件磁盘路径
        bakFile.setPath(generateFilePath(fileUpload, bakFileName));
        // 设置备份文件http引用路径
        bakFile.setUri(generateFileUri(fileUpload.getPath(), bakFileName));
        File destFile = new File(bakFile.getPath());
        FileUtils.copyFile(srcFile, destFile);
        // 保存文件对象放在最后，防止未备份文件却生成了备份文件信息
        fileManageMapper.insert(bakFile);
    }


    /**
     * 文件枚举类型和文件上传信息的对照map结合
     */
    private static final Map<FileTypeEnums, FileUpload> fileTypeMap = new HashMap<>();

    /**
     * 实现文件类型枚举和文件类型信息对应的转换方法，如果新增新的文件类型，需要在这个方法下新增型的类型映射
     *
     * @param fileTypeEnums 文件类型枚举
     * @return 文件类型信息
     */
    private FileUpload getFileUpload(FileTypeEnums fileTypeEnums) {
        if (ObjectUtils.isEmpty(fileTypeMap)) {
            fileTypeMap.put(FileTypeEnums.DEFAULT_FILE, uploadProperties.getDefaultFile());
            fileTypeMap.put(FileTypeEnums.IMAGE, uploadProperties.getImage());
            fileTypeMap.put(FileTypeEnums.PDF, uploadProperties.getPdf());
        }
        FileUpload fileUpload = fileTypeMap.get(fileTypeEnums);
        if (ObjectUtils.isEmpty(fileUpload)) {
            return uploadProperties.getDefaultFile();
        }
        return fileUpload;
    }

}
