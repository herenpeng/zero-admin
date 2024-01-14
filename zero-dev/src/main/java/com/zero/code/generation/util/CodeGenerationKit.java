package com.zero.code.generation.util;

import com.zero.code.generation.entity.TableInfo;
import com.zero.code.generation.enums.CodeTypeEnum;
import com.zero.code.generation.enums.TemplateEnum;
import com.zero.common.constant.AppConst;
import com.zero.common.enums.EncodingEnum;
import com.zero.common.kit.FreeMarkerKit;
import lombok.extern.slf4j.Slf4j;

import java.io.*;

/**
 * 代码生成工具类
 *
 * @author herenpeng
 * @since 2020-11-11 22:53
 */
@Slf4j
public class CodeGenerationKit {

    /**
     * 代码生成方法
     *
     * @throws Exception
     */
    public static void generation(TableInfo tableInfo) throws Exception {
        generationFile(tableInfo, TemplateEnum.ENTITY);
        generationFile(tableInfo, TemplateEnum.MAPPER);
        generationFile(tableInfo, TemplateEnum.SERVICE);
        generationFile(tableInfo, TemplateEnum.SERVICE_IMPL);
        generationFile(tableInfo, TemplateEnum.CONTROLLER);
        generationFile(tableInfo, TemplateEnum.MAPPER_XML);
        // 生成前端代码
        if (tableInfo.getTree()) {
            generationFile(tableInfo, TemplateEnum.TREE);
        } else {
            generationFile(tableInfo, TemplateEnum.TABLE);
        }
        generationFile(tableInfo, TemplateEnum.API);
    }


    /**
     * 通过模板文件生成对应的文件
     *
     * @param tableInfo    表信息，需要在模板文件中渲染的内容信息
     * @param templateEnum 需要生成的文件类型枚举，其中含有对应的生成信息
     * @throws IOException IO异常
     */
    private static void generationFile(TableInfo tableInfo, TemplateEnum templateEnum) throws IOException {
        // 拼接文件的全路径
        StringBuilder generationFilePath = new StringBuilder();
        CodeTypeEnum codeTypeEnum = templateEnum.getCodeTypeEnum();
        switch (codeTypeEnum) {
            case JAVA:
                // 拼接文件的全路径
                generationFilePath.append(tableInfo.getJavaCodePath()).append(templateEnum.getFileBasePath())
                        .append(packageNameToPath(tableInfo.getJavaPackageName() + templateEnum.getPackageName()))
                        .append(File.separator).append(tableInfo.getEntityName()).append(templateEnum.getSuffix())
                        .append(templateEnum.getFileSuffix());
                break;
            case VUE:
                generationFilePath.append(tableInfo.getVueCodePath()).append(templateEnum.getFileBasePath())
                        .append(packageNameToPath(tableInfo.getVuePackage() + templateEnum.getPackageName()))
                        .append(templateEnum.getSuffix()).append(templateEnum.getFileSuffix());
                break;
            default:
                log.error("[代码生成工具]系统当前不支持{}类型的代码生成功能", codeTypeEnum);
        }
        String content = FreeMarkerKit.getTemplateContent(tableInfo, templateEnum.getTemplateLoaderPath(), templateEnum.getFtlTemplateFile());
        File generationFile = new File(generationFilePath.toString());
        generationFile.getParentFile().mkdirs();
        OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(generationFile), EncodingEnum.UTF_8.getValue());
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
