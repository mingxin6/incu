package com.mkyong.customer.controller;

import java.io.Writer;
import java.lang.annotation.Annotation;
import java.util.HashMap;  
import java.util.List;  
import java.util.Map;  
import java.util.Properties;
  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  

import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.validation.BindException;
import org.springframework.web.bind.ServletRequestUtils;  
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;  
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;
  
import com.utils.FileOperateUtil;  

public class FileUploadController implements Controller {

		@Override
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			  //String strView="upload";
			 ModelAndView mv = new ModelAndView("upload");
			 
			  if (request instanceof MultipartHttpServletRequest) {
				  String type = request.getParameter("type");
				  String action = type.substring(0,type.indexOf("_")+1);
				  System.out.println("action is....:"+action);
				//  Map<String, Object> map = new HashMap<String, Object>();  

				  
		        // 别名  
		        String[] alaises = ServletRequestUtils.getStringParameters(request,  
		                "alais");  
		       
		        //String[] params = new String[] { "alais" };  
		        Map<String, Object[]> values = new HashMap<String, Object[]>();  
		        values.put("alais", alaises);  
		  
		       
		        List<Map<String, Object>> result = FileOperateUtil.upload(request,  
		        		type, values,type.substring(type.indexOf("_")+1,type.length()));  
		  
		       // map.put("result", result);  
		      
		        	response.setContentType("text/html;charset=utf-8"); 
		        	Writer out = response.getWriter();
		        	out.write("<script type='text/javascript'>") ;
		        	out.write("window.opener.$('#uploadblank').remove();");
		        	for(Map map:result){
		        		out.write("window.opener.$('#uploadlist').append(\"<span id='d"+map.get("ufid")+"'>&nbsp;"+
		        				map.get("realName")+
		        				"|<a onclick=\\\"deluf('d"+
		        				map.get("ufid")+
		        				"')\\\"  href=\\\"#\\\" >删除</a>&nbsp;</span>\" );"
		        				);
		        	}
		        	out.write("window.opener=null;window.close();") ;										
		        	out.write("</script>");
		        	return null;
		        	//mv = new ModelAndView(new RedirectView("activityList.htm"),map);
					 //strView = "activityList";
				 
					 
					 //	mv = new ModelAndView(new RedirectView("sharedResourcesAdd.htm"),map);
					 //strView = "activityList";
				 
			 }else{
					String strType = request.getParameter("type");
					//String strTitle = request.getParameter("action");
					//if(null!=strTitle){
				 //mv.addObject("strTitle", new String(strTitle.getBytes("iso-8859-1"),"utf-8"));
					//}
				 mv.addObject("strType", strType);
				 
			 }
			 	
		        return mv; 
		}
}
