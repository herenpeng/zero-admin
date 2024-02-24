package com.zero.code.generate.kit;

import com.zero.code.generate.entity.TableInfo;
import com.zero.code.generate.enums.CodeTypeEnum;
import com.zero.code.generate.enums.TemplateEnum;
import com.zero.common.constant.AppConst;
import com.zero.common.enums.EncodingEnum;
import com.zero.common.kit.CamelCaseKit;
import com.zero.common.kit.FreeMarkerKit;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;

import java.io.*;

/**
 * 代码生成工具类
 *
 * @author herenpeng
 * @since 2020-11-11 22:53
 */
@Slf4j
public class CodeGenerateKit {

    /**
     * 代码生成方法
     *
     * @throws Exception 抛出异常
     */
    public static void generate(TableInfo tableInfo) throws Exception {
        generateFile(tableInfo, TemplateEnum.ENTITY);
        generateFile(tableInfo, TemplateEnum.MAPPER);
        generateFile(tableInfo, TemplateEnum.SERVICE);
        generateFile(tableInfo, TemplateEnum.SERVICE_IMPL);
        generateFile(tableInfo, TemplateEnum.CONTROLLER);
        generateFile(tableInfo, TemplateEnum.MAPPER_XML);
        generateFile(tableInfo, TemplateEnum.SQL);
        // 生成前端代码
        if (tableInfo.getTree()) {
            generateFile(tableInfo, TemplateEnum.TREE);
        } else {
            generateFile(tableInfo, TemplateEnum.TABLE);
        }
        generateFile(tableInfo, TemplateEnum.RECOVER);
        generateFile(tableInfo, TemplateEnum.API);
        generateFile(tableInfo, TemplateEnum.LANG);
    }


    /**
     * 通过模板文件生成对应的文件
     *
     * @param tableInfo    表信息，需要在模板文件中渲染的内容信息
     * @param templateEnum 需要生成的文件类型枚举，其中含有对应的生成信息
     * @throws IOException IO异常
     */
    private static void generateFile(TableInfo tableInfo, TemplateEnum templateEnum) throws IOException {
        String content = FreeMarkerKit.getTemplateContent(tableInfo, templateEnum.getTemplateLoaderPath(), templateEnum.getFtlTemplateFile());
        if (StringUtils.isBlank(content)) {
            log.warn("[代码生成工具]文件生成内容为空，id：{}，templateEnum：{}", tableInfo.getId(), templateEnum);
            return;
        }
        // 拼接文件的全路径
        StringBuilder generateFilePath = new StringBuilder();
        CodeTypeEnum codeTypeEnum = templateEnum.getCodeTypeEnum();
        switch (codeTypeEnum) {
            case JAVA -> generateFilePath.append(tableInfo.getJavaCodePath()).append(templateEnum.getFileBasePath())
                    .append(packageNameToPath(tableInfo.getJavaPackage() + templateEnum.getPackageName()))
                    .append(File.separator).append(tableInfo.getEntityName()).append(templateEnum.getSuffix());
            case SQL -> generateFilePath.append(System.getProperty("user.dir")).append(templateEnum.getFileBasePath())
                    .append(File.separator).append(tableInfo.getEntityName().toLowerCase()).append(templateEnum.getSuffix());
            case VUE -> generateFilePath.append(tableInfo.getVueCodePath()).append(templateEnum.getFileBasePath())
                    .append(packageNameToPath(tableInfo.getVuePackage())).append(File.separator)
                    .append(CamelCaseKit.toStrikeName(tableInfo.getEntityName())).append(templateEnum.getSuffix());
            default -> log.error("[代码生成工具]系统当前不支持{}类型的代码生成功能", codeTypeEnum);
        }
        File generateFile = new File(generateFilePath.toString());
        if (!tableInfo.getCover() && generateFile.exists()) {
            log.debug("[代码生成工具]当前文件已经存在，无法覆盖原文件：{}", generateFile.getAbsolutePath());
            return;
        }
        File parentFile = generateFile.getParentFile();
        if (!parentFile.exists()) {
            boolean mkdirs = parentFile.mkdirs();
            if (!mkdirs) {
                log.warn("[代码生成工具]文件目录生成失败：{}", parentFile.getAbsolutePath());
                return;
            }
        }
        OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(generateFile), EncodingEnum.UTF_8.getValue());
        BufferedWriter writer = new BufferedWriter(out);
        writer.write(content);
        writer.close();
    }

    /**
     * 将包名转换为文件路径名，并在包文件路径的前后拼接上文件路径分隔符号
     *
     * @param packageName 包名转
     * @return 文件路径名称
     */
    private static String packageNameToPath(String packageName) {
        return File.separator + packageName.replace(AppConst.POINT, File.separator);
    }


}
