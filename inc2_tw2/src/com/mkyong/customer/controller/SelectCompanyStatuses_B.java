package com.mkyong.customer.controller;

import java.util.LinkedHashMap;
import java.util.Map;

public class SelectCompanyStatuses_B {

	public static Map get() {

		Map<String, String> statusCond = new LinkedHashMap<String, String>();
		
			// statusCond.put("NONE", "---");
//		statusCond.put("初次接觸", "初次接觸");
//		statusCond.put("園區參訪", "園區參訪");
//		statusCond.put("決策主管洽談", "決策主管洽談");
//		statusCond.put("進駐細節洽談", "進駐細節洽談");
//		statusCond.put("入駐中", "入駐中");

		statusCond.put("書審中", "書審中");
		statusCond.put("面審中", "面審中");
		statusCond.put("點交中", "點交中");

		
		return statusCond;
	}
}
