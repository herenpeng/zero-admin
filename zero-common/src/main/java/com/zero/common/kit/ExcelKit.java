package com.zero.common.kit;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import cn.afterturn.easypoi.excel.entity.enmus.ExcelType;
import cn.afterturn.easypoi.excel.export.styler.ExcelExportStylerDefaultImpl;
import com.zero.common.enums.EncodingEnum;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Workbook;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

/**
 * Excel导入导出工具类
 *
 * @author herenpeng
 * @since 2020-12-02 21:10
 */
public class ExcelKit {

    /**
     * 对外的导出excel方法，exportExcel重载方法
     * 该方法通过传入ExportParams对象参数指定标题和表名称
     *
     * @param fileName     文件名称
     * @param exportParams ExportParams对象，导出参数
     * @param exportClass  导出对象的字节码对象
     * @param exportData   导出的数据
     * @param response     HttpServletResponse对象
     * @throws IOException IO异常
     */
    public static void exportExcel(String fileName, ExportParams exportParams, Class<?> exportClass, List<?> exportData, HttpServletResponse response) throws IOException {
        Workbook workbook = ExcelExportUtil.exportExcel(exportParams, exportClass, exportData);
        downloadExcel(fileName, workbook, response);
    }


    /**
     * 对外的导出excel方法，exportExcel重载方法（简化方法，推荐使用）
     * 该方法可以指定文件名称，默认标题和表名称为文件名称
     *
     * @param fileName    文件名称
     * @param exportClass 导出对象的字节码对象
     * @param exportData  导出的数据
     * @param response    HttpServletResponse对象
     * @throws IOException IO异常
     */
    public static void exportExcel(String fileName, Class<?> exportClass, List<?> exportData, HttpServletResponse response) throws IOException {
        exportExcel(fileName, fileName, fileName, exportClass, exportData, response);
    }

    /**
     * 对外的导出excel方法，exportExcel重载方法
     * 该方法可以指定文件名称、标题名称、表名称
     *
     * @param fileName    文件名称
     * @param title       excel标题
     * @param sheetName   excel表名
     * @param exportClass 导出对象的字节码对象
     * @param exportData  导出的数据
     * @param response    HttpServletResponse对象
     * @throws IOException IO异常
     */
    public static void exportExcel(String fileName, String title, String sheetName, Class<?> exportClass, List<?> exportData, HttpServletResponse response) throws IOException {
        ExportParams exportParams = new ExportParams();
        exportParams.setTitle(title);
        exportParams.setCreateHeadRows(true);
        exportParams.setSheetName(sheetName);
        exportParams.setType(ExcelType.XSSF);
        exportParams.setStyle(ExcelExportStylerDefaultImpl.class);
        defaultExport(fileName, exportParams, exportClass, exportData, response);
    }

    /**
     * 默认导出方法，私有
     *
     * @param fileName     文件名称
     * @param exportParams ExportParams对象，导出参数
     * @param exportClass  导出对象的字节码对象
     * @param exportData   导出的数据
     * @param response     HttpServletResponse对象
     * @throws IOException IO异常
     */
    private static void defaultExport(String fileName, ExportParams exportParams, Class<?> exportClass, List<?> exportData, HttpServletResponse response) throws IOException {
        Workbook workbook = ExcelExportUtil.exportExcel(exportParams, exportClass, exportData);
        downloadExcel(fileName, workbook, response);
    }


    /**
     * 下载Excel，私有
     *
     * @param fileName 文件名称
     * @param workbook Workbook对象
     * @param response HttpServletResponse对象
     * @throws IOException IO异常
     */
    private static void downloadExcel(String fileName, Workbook workbook, HttpServletResponse response) throws IOException {
        response.setCharacterEncoding(EncodingEnum.UTF_8.getValue());
        response.setHeader("Content-Type", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName + ".xlsx", EncodingEnum.UTF_8.getValue()));
        workbook.write(response.getOutputStream());
        workbook.close();
    }

}
