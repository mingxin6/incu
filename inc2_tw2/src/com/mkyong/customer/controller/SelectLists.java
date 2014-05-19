package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import com.db.MySQLAccess;
import com.model.ServiceResourceData;

public class SelectLists {
	
	public static Map getServiceResourceDataStatus() {
		
		Map<String, String> list = new LinkedHashMap<String, String>();
		list.put("0", "暂停");
		list.put("1", "使用");
		return list;
	}
	
	public static Map getServiceResourceAcceptStatus() {
		
		Map<String, String> list = new LinkedHashMap<String, String>();
		list.put("0", "等待审核");
		list.put("1", "申请通过");
		list.put("2", "申请失败");
		list.put("3", "删除");
		return list;
	}
	
	public static Map getServiceResourceAcceptSrd(String categorize) {
		
		ArrayList al = new ArrayList();
		MySQLAccess o = new MySQLAccess();
		try {
				al = o.readServiceResourceDataList(categorize);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, String> list = new LinkedHashMap<String, String>();
		list.put("", "--请选择--");
		for (int i=0;i<al.size();i++)
		{
			ServiceResourceData obj=(ServiceResourceData)al.get(i);
			list.put(obj.srdid, obj.name);
		}
		return list;
	}
}
