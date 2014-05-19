package com.mkyong.common.view;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.mod.company.controller.MySQLAccessCompany;
import com.model.Company;
import com.vo.VOCompListCondition;

public class ExcelRevenueReportView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map model, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// Map<String,String> revenueData = (Map<String,String>) model.get("revenueData");

		// create a wordsheet
		HSSFSheet sheet = workbook.createSheet("企业一览表");

		HSSFRow header = sheet.createRow(0);
		header.createCell((short) 0).setCellValue("企业名称");
		header.createCell((short) 1).setCellValue("项目内容");
		header.createCell((short) 2).setCellValue("注册资本(万元)");
		header.createCell((short) 3).setCellValue("员工人数(人)");
		header.createCell((short) 4).setCellValue("注册日期");
		header.createCell((short) 5).setCellValue("办公面积(平方米)");
		header.createCell((short) 6).setCellValue("企业状态");
		header.createCell((short) 7).setCellValue("负责人");
		header.createCell((short) 8).setCellValue("电话");
		

		header = sheet.createRow((short) 1);
	    HSSFCell cell = header.createCell((short) 1);
//	    cell.setCellValue("This is a test of merging");
//		sheet.addMergedRegion(new Region(0,(short)2,1,(short)1));//指定合并区域
		
		ArrayList ar = new ArrayList();
		HttpSession session = request.getSession(false);
		VOCompListCondition compListCondition = (VOCompListCondition) session.getAttribute("compListCondition");
		if (compListCondition == null) {
			compListCondition = new VOCompListCondition();
		}
		MySQLAccessCompany o = new MySQLAccessCompany();
		try {
			ar = o.readCompList(compListCondition);
		} catch (Exception e) {
			e.printStackTrace();
		}
	

		int rowNum = 1;
		for (int i = 0; i < ar.size(); i++) {
			Company comp = (Company) ar.get(i);
			HSSFRow row = sheet.createRow(rowNum++);
			row.createCell((short) 0).setCellValue(comp.compName);
			row.createCell((short) 1).setCellValue(comp.prod);
			row.createCell((short) 2).setCellValue(comp.registerCaptial);
			
			row.createCell((short) 3).setCellValue(comp.totalEmployees);
			row.createCell((short) 4).setCellValue(comp.registerDate);
			row.createCell((short) 5).setCellValue(comp.roomArea);
			row.createCell((short) 6).setCellValue(comp.compStatus);
			row.createCell((short) 7).setCellValue(comp.boss);
			row.createCell((short) 8).setCellValue(comp.phone);

		}


		
		// int rowNum = 1;
		// for (Map.Entry<String, String> entry : revenueData.entrySet()) {
		// //create the row data
		// HSSFRow row = sheet.createRow(rowNum++);
		// row.createCell((short) 0).setCellValue(entry.getKey());
		// row.createCell((short) 1).setCellValue(entry.getValue());
		//
		// }
	}
}