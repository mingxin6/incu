package com.utils;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

public class PropertiesUtil {
	private static Properties prop=new Properties();
	static{
	    try{
	   prop.load(PropertiesUtil.class.getResourceAsStream("/config.properties"));
	    }
	    catch(Exception e){
	     System.out.println("文件config.properties没有找到!");
	     System.out.println(e.toString());
	    }
	  
	}
	public static String getEnProp(String str){
		return prop.getProperty(str);
	}
	public static String getCnProp(String str){
		String strTemp ="";
		try {
			strTemp = new String (prop.getProperty(str).getBytes("iso-8859-1"),"utf-8");
;
		
		} catch (UnsupportedEncodingException e) {
		     System.out.println("编码错误!");
		     System.out.println(e.toString());
		 }
		
		return  strTemp;
		
	}
//	public static void main(String[] args)throws Exception{
//		String x = java.net.URLEncoder.encode("研究报告上传","utf-8");
//		System.out.println(getCnProp("1"));
//		
//	
//	}


}
