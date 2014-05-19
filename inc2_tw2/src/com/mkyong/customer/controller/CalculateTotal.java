package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.TreeMap;

import com.model.MonthlyReport;

public class CalculateTotal {

	public static TreeMap getTotal(TreeMap mp) {
		MonthlyReport totalMonthlyReport = new MonthlyReport();
		Iterator it = mp.keySet().iterator();
		while (it.hasNext()) {
			MonthlyReport monthlyReportmp = (MonthlyReport) mp.get(it.next());
			totalMonthlyReport.revenue = totalMonthlyReport.revenue + monthlyReportmp.revenue;//

			// if (rs.getBoolean("status")) {
			// monthlyReportmp.phd = rs.getInt("phd");//
			// monthlyReportmp.master = rs.getInt("master");//
			// monthlyReportmp.proMajor = rs.getInt("proMajor");//
			// monthlyReportmp.bachelor = rs.getInt("bachelor");//
			// monthlyReportmp.totalEmployee = rs.getInt("totalEmployee");//
			// }

			totalMonthlyReport.phd = totalMonthlyReport.phd + monthlyReportmp.phd;//
			totalMonthlyReport.master = totalMonthlyReport.master + monthlyReportmp.master;//
			totalMonthlyReport.proMajor = totalMonthlyReport.proMajor + monthlyReportmp.proMajor;//
			totalMonthlyReport.bachelor = totalMonthlyReport.bachelor + monthlyReportmp.bachelor;//
			totalMonthlyReport.totalEmployee = totalMonthlyReport.totalEmployee + monthlyReportmp.totalEmployee;//

			totalMonthlyReport.ip_invent = totalMonthlyReport.ip_invent + monthlyReportmp.ip_invent;//
			totalMonthlyReport.ip_newType = totalMonthlyReport.ip_newType + monthlyReportmp.ip_newType;//
			totalMonthlyReport.ip_look = totalMonthlyReport.ip_look + monthlyReportmp.ip_look;//
			totalMonthlyReport.icDrawing = totalMonthlyReport.icDrawing + monthlyReportmp.icDrawing;//
			totalMonthlyReport.softwareProd = totalMonthlyReport.softwareProd + monthlyReportmp.softwareProd;//
			totalMonthlyReport.softwareBook = totalMonthlyReport.softwareBook + monthlyReportmp.softwareBook;//
		}
		mp.put("Total", totalMonthlyReport);

		return mp;
	}

	
	public static ArrayList getTotal(ArrayList  ar) {
		MonthlyReport totalMonthlyReport = new MonthlyReport();
		for(int i=0;i<ar.size();i++){
			MonthlyReport monthlyReportmp = (MonthlyReport) ar.get(i);
			
			totalMonthlyReport.revenue = totalMonthlyReport.revenue + monthlyReportmp.revenue;//

			// if (rs.getBoolean("status")) {
			// monthlyReportmp.phd = rs.getInt("phd");//
			// monthlyReportmp.master = rs.getInt("master");//
			// monthlyReportmp.proMajor = rs.getInt("proMajor");//
			// monthlyReportmp.bachelor = rs.getInt("bachelor");//
			// monthlyReportmp.totalEmployee = rs.getInt("totalEmployee");//
			// }

			totalMonthlyReport.phd = totalMonthlyReport.phd + monthlyReportmp.phd;//
			totalMonthlyReport.master = totalMonthlyReport.master + monthlyReportmp.master;//
			totalMonthlyReport.proMajor = totalMonthlyReport.proMajor + monthlyReportmp.proMajor;//
			totalMonthlyReport.bachelor = totalMonthlyReport.bachelor + monthlyReportmp.bachelor;//
			totalMonthlyReport.totalEmployee = totalMonthlyReport.totalEmployee + monthlyReportmp.totalEmployee;//

			totalMonthlyReport.ip_invent = totalMonthlyReport.ip_invent + monthlyReportmp.ip_invent;//
			totalMonthlyReport.ip_newType = totalMonthlyReport.ip_newType + monthlyReportmp.ip_newType;//
			totalMonthlyReport.ip_look = totalMonthlyReport.ip_look + monthlyReportmp.ip_look;//
			totalMonthlyReport.icDrawing = totalMonthlyReport.icDrawing + monthlyReportmp.icDrawing;//
			totalMonthlyReport.softwareProd = totalMonthlyReport.softwareProd + monthlyReportmp.softwareProd;//
			totalMonthlyReport.softwareBook = totalMonthlyReport.softwareBook + monthlyReportmp.softwareBook;//
		}
		
		totalMonthlyReport.compName="Total";
		ar.add(totalMonthlyReport);

		return ar;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
