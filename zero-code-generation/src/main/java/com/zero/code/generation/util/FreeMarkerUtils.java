package com.zero.code.generation.util;

import com.zero.code.generation.entity.TableInfo;
import com.zero.common.enums.EncodingEnums;
import freemarker.template.Configuration;
import freemarker.template.Template;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.StringWriter;

/**
 * FreeMarker模板文件工具类
 *
 * @author herenpeng
 * @since 2020-11-13 22:35
 */
@Slf4j
@Component
public class FreeMarkerUtils {


    /**
     * 模板渲染并返回内容
     *
     * @param tableInfo          数据库表信息
     * @param templateLoaderPath FreeMarker模板文件加载路径
     * @param ftlFileName        FreeMarker模板文件名称
     * @return FreeMarker模板内容内容
     */
    public static String getTemplateContent(TableInfo tableInfo, String templateLoaderPath, String ftlFileName) {
        StringWriter out = null;
        try {
            Configuration cfg = new Configuration(Configuration.getVersion());
            cfg.setClassForTemplateLoading(FreeMarkerUtils.class, templateLoaderPath);
            cfg.setDefaultEncoding(EncodingEnums.UTF_8.getValue());
            Template template = cfg.getTemplate(ftlFileName);
            out = new StringWriter();
            template.process(tableInfo, out);
            return out.toString();
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[代码生成功能]FreeMarker读取模板文件异常");
        } finally {
            if (out != null) {
                try {
                    out.flush();
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    log.error("[代码生成功能]FreeMarker读取模板文件输出流关闭异常");
                }
            }
        }
        return null;
    }

}
