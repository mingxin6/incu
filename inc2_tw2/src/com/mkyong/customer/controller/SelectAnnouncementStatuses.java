package com.mkyong.customer.controller;

import java.util.LinkedHashMap;
import java.util.Map;

public class SelectAnnouncementStatuses {
	
	public static Map getType() {
		Map<String, String> statusCond = new LinkedHashMap<String, String>();
		statusCond.put("0", "文章");
		statusCond.put("1", "链接");
		return statusCond;
	}
	
	public static Map get() {
		Map<String, String> statusCond = new LinkedHashMap<String, String>();
		statusCond.put("0", "隐藏");
		statusCond.put("1", "显示");
		statusCond.put("2", "删除");
		return statusCond;
	}
}
