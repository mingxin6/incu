package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.validation.Errors;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccessSec;
import com.model.UploadedFile;
import com.utils.FileOperateUtil;


public class FileDownloadController extends SimpleFormController {
	
	public FileDownloadController(){
		setCommandClass(UploadedFile.class);
		setCommandName("downloadFile");
	}
	

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		
			ModelAndView mv = new ModelAndView();
			  UploadedFile downloadFile = (UploadedFile)command;
			  
			  System.out.println("begin downloading.....");
				 String contentType = "application/octet-stream";
				//String type = request.getParameter("type");
				 //String reName = request.getParameter("filename");
				 String type = downloadFile.getType();
				 String reName = downloadFile.getFilename();
				 String realName = reName.substring(reName.indexOf("_")+1,reName.length());

				 System.out.println("type:"+type);
				 System.out.println("reName:"+reName);
				 System.out.println("realName:"+realName);
				 
				 
				 FileOperateUtil.download(request, response, type+"\\"+reName, contentType,realName);
		        
//		        if(type.length()>1){
//		        	mv = new ModelAndView(new RedirectView("activityList.htm"),map);
//					 //strView = "activityList";
//				 }else{
//			        	mv = new ModelAndView(new RedirectView("sharedResources.htm"),map);
//					 //strView = "activityList";
//				 }
				 mv = null;
			     return mv; 
		}

		@Override
		protected Map referenceData(HttpServletRequest request, Object command,
				Errors errors) throws Exception {
			Map referenceData = new HashMap();
			
			 String type = request.getParameter("type");
			 String tempType = type.substring(0,type.indexOf("_")+1);
			// System.out.println((String)request.getParameter("action"));
			 String action = (String)request.getParameter("action");
			// String action = new String(request.getParameter("action").getBytes("iso-8859-1"),"utf-8");
			 List<UploadedFile> uploadedfilelist = new ArrayList<UploadedFile>();
			 
			 MySQLAccessSec mysqlDB = new MySQLAccessSec();
				try {
					uploadedfilelist = mysqlDB.readUploadedFileList(type.substring(type.indexOf("_")+1, type.length()));
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			 
				if (uploadedfilelist.size()<=0){
					referenceData.put("IsShow", false);
				}else{
					referenceData.put("IsShow", true);
				}
				// request.setAttribute(name, o);
			String strTitle = action ;

			referenceData.put("type", type );
			referenceData.put("tempType", tempType);
			referenceData.put("strTitle", strTitle );
			referenceData.put("uploadedfilelist", uploadedfilelist);

			 //System.out.println("下载type："+type);
			// mv = new ModelAndView("download"); 
		    return referenceData;
		 	

		}

	

//		@Override
//		protected ModelAndView onSubmit(HttpServletRequest request,
//				HttpServletResponse response, Object command,
//				BindException errors) throws Exception {
//			 Map<String, Object> map = new HashMap<String, Object>();  
//			  
//		        // 别名  
//		        String[] alaises = ServletRequestUtils.getStringParameters(request,  
//		                "alais");  
//		       
//		        String[] params = new String[] { "alais" };  
//		        Map<String, Object[]> values = new HashMap<String, Object[]>();  
//		        values.put("alais", alaises);  
//		  
//		        List<Map<String, Object>> result = FileOperateUtil.upload(request,  
//		                params, values);  
//		  
//		        map.put("result", result);  
//		  
//		        return new ModelAndView("upload", map); 
//		}


	  
	    /** 
	     * 下载 
	 
	     */  
	 
//	    public ModelAndView download(HttpServletRequest request,  
//	            HttpServletResponse response) throws Exception {  
//	  
//	        String storeName = "201205051340364510870879724.zip";  
//	        String realName = "Java设计模式.zip";  
//	        String contentType = "application/octet-stream";  
//	  
//	        FileOperateUtil.download(request, response, storeName, contentType,  
//	                realName);  
//	  
//	        return null;  
//	    }  
//	
}
