package com.zero.code.generation.util;

import com.zero.code.generation.entity.TableColumn;
import com.zero.code.generation.entity.TableInfo;
import com.zero.code.generation.enums.CodeTypeEnum;
import com.zero.code.generation.enums.TemplateEnum;
import com.zero.code.generation.mapper.TableColumnMapper;
import com.zero.code.generation.mapper.TableInfoMapper;
import com.zero.common.constant.StringConst;
import com.zero.common.enums.EncodingEnums;
import com.zero.common.util.FreeMarkerUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.*;
import java.util.List;

/**
 * 代码生成工具类
 *
 * @author herenpeng
 * @since 2020-11-11 22:53
 */
@Slf4j
@Component
public class CodeGenerationUtils {

    @Autowired
    private TableInfoMapper tableInfoMapper;

    @Autowired
    private TableColumnMapper tableColumnMapper;

    @Autowired
    private FreeMarkerUtils freeMarkerUtils;


    /**
     * 代码生成方法
     *
     * @param id 表信息主键
     * @throws Exception
     */
    public void generation(Integer id) throws Exception {
        TableInfo tableInfo = tableInfoMapper.selectById(id);
        List<TableColumn> tableColumnList = tableColumnMapper.getByTableInfoId(tableInfo.getId());
        tableInfo.setTableColumnList(tableColumnList);
        generationFile(tableInfo, TemplateEnum.ENTITY);
        generationFile(tableInfo, TemplateEnum.MAPPER);
        generationFile(tableInfo, TemplateEnum.SERVICE);
        generationFile(tableInfo, TemplateEnum.SERVICE_IMPL);
        generationFile(tableInfo, TemplateEnum.CONTROLLER);
        generationFile(tableInfo, TemplateEnum.MAPPER_XML);
        // 生成前端代码
        generationFile(tableInfo, TemplateEnum.VUE);
        generationFile(tableInfo, TemplateEnum.API);
    }


    /**
     * 通过模板文件生成对应的文件
     *
     * @param tableInfo    表信息，需要在模板文件中渲染的内容信息
     * @param templateEnum 需要生成的文件类型枚举，其中含有对应的生成信息
     * @throws IOException IO异常
     */
    private void generationFile(TableInfo tableInfo, TemplateEnum templateEnum) throws IOException {
        // 拼接文件的全路径
        String generationFilePath = "";
        CodeTypeEnum codeTypeEnum = templateEnum.getCodeTypeEnum();
        switch (codeTypeEnum) {
            case JAVA:
                // 拼接文件的全路径
                generationFilePath = String.join(tableInfo.getJavaCodePath(), templateEnum.getFileBasePath(),
                        packageNameToPath(tableInfo.getJavaPackageName() + templateEnum.getPackageName()),
                        tableInfo.getEntityName(), templateEnum.getSuffix(), templateEnum.getFileSuffix());
                break;
            case VUE:
                generationFilePath = String.join(tableInfo.getVueCodePath(), templateEnum.getFileBasePath(),
                        packageNameToPath(tableInfo.getVuePackage() + templateEnum.getPackageName()),
                        templateEnum.getSuffix(), templateEnum.getFileSuffix());
                break;
            default:
                log.error("[代码生成工具]系统当前不支持{}类型的代码生成功能", codeTypeEnum);
        }
        String content = freeMarkerUtils.getTemplateContent(tableInfo, templateEnum.getTemplateLoaderPath(), templateEnum.getFtlTemplateFile());
        File generationFile = new File(generationFilePath);
        generationFile.getParentFile().mkdirs();
        OutputStreamWriter out = new OutputStreamWriter(new FileOutputStream(generationFile), EncodingEnums.UTF_8.getValue());
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
    private String packageNameToPath(String packageName) {
        return File.separator + packageName.replaceAll(StringConst.POINT, File.separator) + File.separator;
    }


}
