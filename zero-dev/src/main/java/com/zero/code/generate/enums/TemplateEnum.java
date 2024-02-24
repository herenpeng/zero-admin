package com.zero.code.generate.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.io.File;

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
    ENTITY(CodeTypeEnum.JAVA,
            "/templates/java",
            "entity.ftlh",
            File.separator + "src" + File.separator + "main" + File.separator + "java",
            ".entity",
            ".java"),

    /**
     * Mapper层接口相关信息枚举
     */
    MAPPER(CodeTypeEnum.JAVA,
            "/templates/java",
            "mapper.ftlh",
            File.separator + "src" + File.separator + "main" + File.separator + "java",
            ".mapper",
            "Mapper.java"),

    /**
     * Mapper层XML文件相关信息枚举
     */
    MAPPER_XML(CodeTypeEnum.JAVA,
            "/templates/resources",
            "mapperXml.ftlh",
            File.separator + "src" + File.separator + "main" + File.separator + "resources",
            ".mapper",
            "Mapper.xml"),

    /**
     * Service层接口相关信息枚举
     */
    SERVICE(CodeTypeEnum.JAVA,
            "/templates/java",
            "service.ftlh",
            File.separator + "src" + File.separator + "main" + File.separator + "java",
            ".service",
            "Service.java"),

    /**
     * Service层接口实现类相关信息枚举
     */
    SERVICE_IMPL(CodeTypeEnum.JAVA,
            "/templates/java",
            "serviceImpl.ftlh",
            File.separator + "src" + File.separator + "main" + File.separator + "java",
            ".service.impl",
            "ServiceImpl.java"),

    /**
     * Controller层相关信息枚举
     */
    CONTROLLER(CodeTypeEnum.JAVA,
            "/templates/java",
            "controller.ftlh",
            File.separator + "src" + File.separator + "main" + File.separator + "java",
            ".controller",
            "Controller.java"),


    /**
     * SQL语言枚举
     */
    SQL(CodeTypeEnum.SQL,
            "/templates/sql",
            "sql.ftlh",
            "/sql",
            "",
            ".sql"),

    /**
     * Vue组件代码
     */
    TABLE(CodeTypeEnum.VUE,
            "/templates/vue",
            "table.ftlh",
            "/src/views",
            "",
            File.separator + "index.vue"),

    TREE(CodeTypeEnum.VUE,
            "/templates/vue",
            "tree.ftlh",
            "/src/views",
            "",
            File.separator + "index.vue"),


    RECOVER(CodeTypeEnum.VUE,
            "/templates/vue",
            "recover.ftlh",
            "/src/views/recover",
            "",
            File.separator + "index.vue"),

    /**
     * Vue组件API代码
     */
    API(CodeTypeEnum.VUE,
            "/templates/vue",
            "api.ftlh",
            "/src/api",
            "",
            ".js"),


    /**
     * Vue组件国际化语言代码
     */
    LANG(CodeTypeEnum.VUE,
            "/templates/vue",
            "lang.ftlh",
            "/src/lang",
            "",
            ".js"),
    ;

    /**
     * 代码类型
     */
    private final CodeTypeEnum codeTypeEnum;
    /**
     * 模板文件加载路径
     */
    private final String templateLoaderPath;

    /**
     * FreeMarker模板文件名称
     */
    private final String ftlTemplateFile;

    /**
     * 文件基本生成路径
     */
    private final String fileBasePath;

    /**
     * 包名称
     */
    private final String packageName;

    /**
     * 名称后缀
     */
    private final String suffix;


}
