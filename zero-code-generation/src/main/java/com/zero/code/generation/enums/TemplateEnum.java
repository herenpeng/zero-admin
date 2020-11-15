package com.zero.code.generation.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * FreeMarker模板文件相关枚举
 *
 * @author herenpeng
 * @since 2020-11-15 13:07
 */
@Getter
@AllArgsConstructor
public enum TemplateEnum {

    /**
     * 实体类相关信息枚举
     */
    ENTITY("/template/java",
            "entity.ftl",
            "/src/main/java",
            ".entity",
            "",
            ".java"),

    /**
     * Mapper层接口相关信息枚举
     */
    MAPPER("/template/java",
            "mapper.ftl",
            "/src/main/java",
            ".mapper",
            "Mapper",
            ".java"),

    /**
     * Mapper层XML文件相关信息枚举
     */
    MAPPER_XML("/template/resources",
            "mapperXml.ftl",
            "/src/main/resources",
            ".mapper",
            "Mapper",
            ".xml"),

    /**
     * Service层接口相关信息枚举
     */
    SERVICE("/template/java",
            "service.ftl",
            "/src/main/java",
            ".service",
            "Service",
            ".java"),

    /**
     * Service层接口实现类相关信息枚举
     */
    SERVICE_IMPL("/template/java",
            "serviceImpl.ftl",
            "/src/main/java",
            ".service.impl",
            "ServiceImpl",
            ".java"),

    /**
     * Controller层相关信息枚举
     */
    CONTROLLER("/template/java",
            "controller.ftl",
            "/src/main/java",
            ".controller",
            "Controller",
            ".java");

    /**
     * 模板文件加载路径
     */
    private String templateLoaderPath;

    /**
     * FreeMarker模板文件名称
     */
    private String ftlTemplateFile;

    /**
     * 文件基本生成路径
     */
    private String fileBasePath;

    /**
     * 包名称
     */
    private String packageName;

    /**
     * 类名后缀
     */
    private String classSuffix;

    /**
     * 文件后缀名称
     */
    private String fileSuffix;

}
