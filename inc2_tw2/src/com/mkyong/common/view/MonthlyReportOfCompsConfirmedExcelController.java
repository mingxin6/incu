package com.mkyong.common.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.mkyong.common.controller.ExcelUtil;
import com.model.MonthlyReport;

public class MonthlyReportOfCompsConfirmedExcelController extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HashMap mp = (HashMap) model.get("mp");
		String yearmonth = (String) mp.get("yearmonth");
		ArrayList comps = (ArrayList) mp.get("comps");

		// HttpSession session = request.getSession(false);
		//
		// VOMonthlyReportCondition voMonthlyReportCondition = (VOMonthlyReportCondition) session
		// .getAttribute("voMonthlyReportCondition");
		//
		// TreeMap mp = new TreeMap();
		// MySQLAccess o = new MySQLAccess();
		// try {
		// mp = o.readAggregateMonthlyReports(voMonthlyReportCondition);//
		// /!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		// -----------------------------------------------------------------------------------

		yearmonth = yearmonth.replace("/", "-");
		HSSFSheet sheet = ExcelUtil.getSheet(workbook, yearmonth + " 企业月報表", "企业名称");

		//
		int rowNum = 2;

		// Iterator it = mp.keySet().iterator();
		// while (it.hasNext()) {

		for (int i = 0; i < comps.size(); i++) {
			// String key = (String) it.next();
			MonthlyReport monthlyReportmp = (MonthlyReport) comps.get(i);

			HSSFRow row = sheet.createRow(rowNum++);
			row.createCell((short) 0).setCellValue(monthlyReportmp.compName);
			row.createCell((short) 1).setCellValue(monthlyReportmp.revenue);
			row.createCell((short) 2).setCellValue(monthlyReportmp.ip_invent);
			row.createCell((short) 3).setCellValue(monthlyReportmp.ip_newType);
			row.createCell((short) 4).setCellValue(monthlyReportmp.ip_look);
			row.createCell((short) 5).setCellValue(monthlyReportmp.icDrawing);
			row.createCell((short) 6).setCellValue(monthlyReportmp.softwareProd);
			row.createCell((short) 7).setCellValue(monthlyReportmp.softwareBook);
			
			if (monthlyReportmp.compName.equals("Total")) {
				row.createCell((short) 8).setCellValue("-");
				row.createCell((short) 9).setCellValue("-");
				row.createCell((short) 10).setCellValue("-");
				row.createCell((short) 11).setCellValue("-");
				row.createCell((short) 12).setCellValue("-");
			} else {
				row.createCell((short) 8).setCellValue(monthlyReportmp.phd);
				row.createCell((short) 9).setCellValue(monthlyReportmp.master);
				row.createCell((short) 10).setCellValue(monthlyReportmp.proMajor);
				row.createCell((short) 11).setCellValue(monthlyReportmp.bachelor);
				row.createCell((short) 12).setCellValue(monthlyReportmp.totalEmployee);
			}
			
//			row.createCell((short) 8).setCellValue(monthlyReportmp.phd);
//			row.createCell((short) 9).setCellValue(monthlyReportmp.master);
//			row.createCell((short) 10).setCellValue(monthlyReportmp.proMajor);
//			row.createCell((short) 11).setCellValue(monthlyReportmp.bachelor);
//			row.createCell((short) 12).setCellValue(monthlyReportmp.totalEmployee);

		}

	}
}