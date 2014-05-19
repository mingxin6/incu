package com.mkyong.customer.controller;

import java.util.LinkedHashMap;
import java.util.Map;

public class SelectLeadContactStatuses {

	public static Map get() {
		Map<String, String> statusCond = new LinkedHashMap<String, String>();
		//statusCond.put("NONE", "---");
//		statusCond.put("初次接触", "初次接触");
//		statusCond.put("园区参访", "园区参访");
//		statusCond.put("决策主管洽谈", "决策主管洽谈");
//		statusCond.put("进驻细节洽谈", "进驻细节洽谈");
//		statusCond.put("确认进驻", "确认进驻");
		
		statusCond.put("初次接觸", "初次接觸");
		statusCond.put("園區參訪", "園區參訪");
		statusCond.put("決策主管洽談", "決策主管洽談");
		statusCond.put("進駐細節洽談", "進駐細節洽談");
		statusCond.put("確認進駐", "確認進駐");

		return statusCond;
	}
}
