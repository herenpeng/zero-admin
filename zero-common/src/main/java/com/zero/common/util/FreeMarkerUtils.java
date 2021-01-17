package com.zero.common.util;

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
     * @param object             模板参数对象
     * @param templateLoaderPath FreeMarker模板文件加载路径
     * @param ftlFileName        FreeMarker模板文件名称
     * @return FreeMarker模板内容内容字符串
     */
    public String getTemplateContent(Object object, String templateLoaderPath, String ftlFileName) {
        StringWriter out = null;
        try {
            Configuration cfg = new Configuration(Configuration.DEFAULT_INCOMPATIBLE_IMPROVEMENTS);
            cfg.setClassForTemplateLoading(FreeMarkerUtils.class, templateLoaderPath);
            cfg.setDefaultEncoding(EncodingEnums.UTF_8.getValue());
            Template template = cfg.getTemplate(ftlFileName);
            out = new StringWriter();
            template.process(object, out);
            return out.toString();
        } catch (Exception e) {
            e.printStackTrace();
            log.error("[freemarker工具类]FreeMarker读取模板文件异常");
        } finally {
            if (out != null) {
                try {
                    out.flush();
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    log.error("[freemarker工具类]FreeMarker读取模板文件输出流关闭异常");
                }
            }
        }
        return null;
    }

}
