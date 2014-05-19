package com.mkyong.common.controller;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.Region;

public class ExcelUtil {

	public static HSSFSheet getSheet(HSSFWorkbook workbook, String tab,String firstColNae) {

		// create a wordsheet
		HSSFSheet sheet = workbook.createSheet(tab);

		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		// -----------------------------------------------------------------------------------
		//
		HSSFRow header = sheet.createRow(0);

		{
			HSSFCell cell = header.createCell((short) 0);
			cell.setCellStyle(style);
			cell.setCellValue(firstColNae);
		}
		{
			HSSFCell cell = header.createCell((short) 1);
			cell.setCellStyle(style);
			cell.setCellValue("销售额(万元)");
		}
		{
			HSSFCell cell = header.createCell((short) 2);
			cell.setCellStyle(style);
			cell.setCellValue("申请知识产权数");
		}
		{
			HSSFCell cell = header.createCell((short) 3);
			cell.setCellStyle(style);
			cell.setCellValue("");
		}
		{
			HSSFCell cell = header.createCell((short) 4);
			cell.setCellStyle(style);
			cell.setCellValue("");
		}
		{
			HSSFCell cell = header.createCell((short) 5);
			cell.setCellStyle(style);
			cell.setCellValue("");
		}
		{
			HSSFCell cell = header.createCell((short) 6);
			cell.setCellStyle(style);
			cell.setCellValue("软件产品(件)");
		}
		{
			HSSFCell cell = header.createCell((short) 7);
			cell.setCellStyle(style);
			cell.setCellValue("软件著作权(件)");
		}
		{
			HSSFCell cell = header.createCell((short) 8);
			cell.setCellStyle(style);
			cell.setCellValue("人员情况(人)");
		}
		{
			HSSFCell cell = header.createCell((short) 9);
			cell.setCellStyle(style);
			cell.setCellValue("");
		}
		{
			HSSFCell cell = header.createCell((short) 10);
			cell.setCellStyle(style);
			cell.setCellValue("");
		}
		{
			HSSFCell cell = header.createCell((short) 11);
			cell.setCellStyle(style);
			cell.setCellValue("");
		}
		{
			HSSFCell cell = header.createCell((short) 12);
			cell.setCellStyle(style);
			cell.setCellValue("");
		}

		// -----------------------------------------------------------------------------------
		header = sheet.createRow((short) 1);
		{
			HSSFCell cell = header.createCell((short) 0);
			cell.setCellStyle(style);
			cell.setCellValue("");
		}
		{
			HSSFCell cell = header.createCell((short) 1);
			cell.setCellStyle(style);
			cell.setCellValue("");
		}
		{
			HSSFCell cell = header.createCell((short) 2);
			cell.setCellStyle(style);
			cell.setCellValue("发明专利(件)");
		}
		{
			HSSFCell cell = header.createCell((short) 3);
			cell.setCellStyle(style);
			cell.setCellValue("实用/新型专利(件)");
		}
		{
			HSSFCell cell = header.createCell((short) 4);
			cell.setCellStyle(style);
			cell.setCellValue("外观专利(件)");
		}
		{
			HSSFCell cell = header.createCell((short) 5);
			cell.setCellStyle(style);
			cell.setCellValue("集成电路布图(个)");
		}
		{
			HSSFCell cell = header.createCell((short) 6);
			cell.setCellStyle(style);
			cell.setCellValue("");
		}
		{
			HSSFCell cell = header.createCell((short) 7);
			cell.setCellStyle(style);
			cell.setCellValue("");
		}
		{
			HSSFCell cell = header.createCell((short) 8);
			cell.setCellStyle(style);
			cell.setCellValue("博士");
		}
		{
			HSSFCell cell = header.createCell((short) 9);
			cell.setCellStyle(style);
			cell.setCellValue("硕士");
		}
		{
			HSSFCell cell = header.createCell((short) 10);
			cell.setCellStyle(style);
			cell.setCellValue("本科");
		}
		{
			HSSFCell cell = header.createCell((short) 11);
			cell.setCellStyle(style);
			cell.setCellValue("大专");
		}
		{
			HSSFCell cell = header.createCell((short) 12);
			cell.setCellStyle(style);
			cell.setCellValue("总数");
		}

		//

		// Region r=new Region(0, (short) 0, 1, (short) 0);

		sheet.addMergedRegion(new Region(0, (short) 0, 1, (short) 0));// 合并区域, rowfrom, colfrom, rowto, colto
		sheet.addMergedRegion(new Region(0, (short) 1, 1, (short) 1));
		sheet.addMergedRegion(new Region(0, (short) 2, 0, (short) 5));
		sheet.addMergedRegion(new Region(0, (short) 6, 1, (short) 6));
		sheet.addMergedRegion(new Region(0, (short) 7, 1, (short) 7));
		sheet.addMergedRegion(new Region(0, (short) 8, 0, (short) 12));
		return sheet;
	}

}
