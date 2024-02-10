package com.zero.sys.properties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 上传的文件的相关属性和参数
 *
 * @author herenpeng
 * @since 2021-01-10 16:30
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class FileUpload {

    /**
     * 上传文件的路径
     */
    private String path;

    /**
     * 上传文件允许的类型
     */
    private List<String> allowTypes;

}
