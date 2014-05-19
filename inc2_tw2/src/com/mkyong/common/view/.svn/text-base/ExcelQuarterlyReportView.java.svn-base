package com.mkyong.common.view;

import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.db.MySQLAccess;
import com.mkyong.common.controller.ExcelUtil;
import com.model.MonthlyReport;
import com.vo.VOQuarterlyReportCondition;

public class ExcelQuarterlyReportView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(false);

		VOQuarterlyReportCondition voQuarterlyReportCondition = (VOQuarterlyReportCondition) session
				.getAttribute("voQuarterlyReportCondition");

		TreeMap mp = new TreeMap();
		MySQLAccess o = new MySQLAccess();
		try {
			mp = o.readAggregateQuarterlyReports(voQuarterlyReportCondition);// /!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		} catch (Exception e) {
			e.printStackTrace();
		}
		// -----------------------------------------------------------------------------------
		//

		HSSFSheet sheet = ExcelUtil.getSheet(workbook, "季報表", "季");

		//
		int rowNum = 2;

		Iterator it = mp.keySet().iterator();
		while (it.hasNext()) {
			String key = (String) it.next();
			MonthlyReport monthlyReportmp = (MonthlyReport) mp.get(key);

			HSSFRow row = sheet.createRow(rowNum++);
			row.createCell((short) 0).setCellValue(key);
			row.createCell((short) 1).setCellValue(monthlyReportmp.revenue);
			row.createCell((short) 2).setCellValue(monthlyReportmp.ip_invent);
			row.createCell((short) 3).setCellValue(monthlyReportmp.ip_newType);
			row.createCell((short) 4).setCellValue(monthlyReportmp.ip_look);
			row.createCell((short) 5).setCellValue(monthlyReportmp.icDrawing);
			row.createCell((short) 6).setCellValue(monthlyReportmp.softwareProd);
			row.createCell((short) 7).setCellValue(monthlyReportmp.softwareBook);
			
			if (key.equals("Total")) {
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