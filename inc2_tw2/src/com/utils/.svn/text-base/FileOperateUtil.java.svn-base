package com.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.db.MySQLAccessSec;
import com.model.UploadedFile;

public class FileOperateUtil {
	private static final String REALNAME = "realName";  
    private static final String STORENAME = "storeName";  
    private static final String SIZE = "size";  
    private static final String SUFFIX = "suffix";  
    private static final String CONTENTTYPE = "contentType";  
    private static final String CREATETIME = "createTime";  
    private static final String UPLOADDIR = "WEB-INF\\uploadDir\\";  
   
	/** 
     * 将上传的文件进行重命名 
     *
     * @return 
     */  
    private static String rename(String name) {  
  
        Long now = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss")  
                .format(new Date()));  
        Long random = (long) (Math.random() * now);  
        String fileName = now +""+ random;     
        fileName = fileName +"_"+ name;  
        return fileName;  
    }  
  
    /** 
     * 压缩后的文件名 
     *  
     * @return 
     */  
//    private static String zipName(String name) {  
//        String prefix = "";  
//        if (name.indexOf(".") != -1) {  
//            prefix = name.substring(0, name.lastIndexOf("."));  
//        } else {  
//            prefix = name;  
//        }  
//        return prefix + ".zip";  
//    }  
  
    /** 
     * 上传文件 
     *  
     */  
    public static List<Map<String, Object>> upload(HttpServletRequest request,  
            String subPath, Map<String, Object[]> values,String type) throws Exception {  
  
        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();  
  
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;  
        Map<String, MultipartFile> fileMap = mRequest.getFileMap();  
        
        String uploadDir = request.getSession().getServletContext()  
                   .getRealPath("/")  
                + FileOperateUtil.UPLOADDIR+subPath+"\\";  
        File file = new File(uploadDir);  
        System.out.println("make file exists:"+file.exists()+"file is directory:"+file.isDirectory() );
        if (!file.exists()) {  
            file.mkdirs();  
        }  
  
        String fileName = null;  
        int i = 0;  
        for (Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet()  
                .iterator(); it.hasNext(); i++) {  
        	
            Map.Entry<String, MultipartFile> entry = it.next();  
            MultipartFile mFile = entry.getValue();  
            if( mFile.isEmpty()){
            	continue;
            }
            System.out.println("文件大小是："+mFile.getSize());
            System.out.println("mFile.getContentType()是："+mFile.getContentType());
            System.out.println("mFile.getOriginalFilename()是："+mFile.getOriginalFilename());
            System.out.println("mFile.getName()是："+mFile.getName());
            fileName = mFile.getOriginalFilename();  
            String rename = rename(fileName);
            String storeName = uploadDir+rename;  
            System.out.println(storeName);
            System.out.println("file length:"+new File(storeName).length());
  
            // 上传文件  
            OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(storeName));  
          
            FileCopyUtils.copy(mFile.getInputStream(), outputStream);  
  
            Map<String, Object> map = new HashMap<String, Object>();  
            // 固定参数值对   
            map.put(FileOperateUtil.STORENAME, storeName);  
            map.put(FileOperateUtil.SIZE, new File(storeName).length());  
            map.put(FileOperateUtil.REALNAME, fileName);  
            map.put(FileOperateUtil.CONTENTTYPE, "application/octet-stream");  
            map.put(FileOperateUtil.CREATETIME, new Date());  
  
            
            //存数据库
            UploadedFile ufobj = new UploadedFile();
    		ufobj.setUfid(UUID.randomUUID().toString());
    		ufobj.setFilename(rename);
    		ufobj.setType(type);
    		MySQLAccessSec mysqlDB = new MySQLAccessSec();
    		try {
    			mysqlDB.insertUploadedFile(ufobj);
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
    		map.put("ufid", ufobj.getUfid());  
    		  
    		result.add(map);  
    		  
        }  
        return result;  
    }  
  
    /** 
     * 下载 
     */  
    public static void download(HttpServletRequest request,  
            HttpServletResponse response, String subPath, String contentType,  
            String realName) throws Exception {  
      //  response.setContentType("text/html;charset=UTF-8");  
       // request.setCharacterEncoding("UTF-8");  
    	//下载文件名乱码__多浏览器支持
		String realNameforHeader = null;
		String userAgent=request.getHeader("user-agent");
		//System.out.println("user-agent: "+userAgent);
		userAgent=userAgent.toLowerCase();
		if(userAgent!=null){
			if ((userAgent.indexOf("msie") !=-1)){
				
				realNameforHeader = URLEncoder.encode(realName, "UTF-8");  
			}else if((userAgent.indexOf("applewebkit") !=-1)){
				
				realNameforHeader = new String(realName.getBytes("utf-8"), "ISO8859-1");  
			}
			
		}
    	
    	
    	
        BufferedInputStream bis = null;  
        BufferedOutputStream bos = null;  
        System.out.println("request.getSession().getServletContext().getRealPath()"+request.getSession().getServletContext()  
                .getRealPath("/")  );
        String endPath = request.getSession().getServletContext()  
                .getRealPath("/")  
                + FileOperateUtil.UPLOADDIR+subPath;  
         // String downLoadPath = ctxPath + storeName;  
  
        long fileLength = new File(endPath).length();  
  
        response.setContentType(contentType);  
        response.setHeader("Content-disposition", "attachment; filename="  
                + realNameforHeader);  
        response.setHeader("Content-Length", String.valueOf(fileLength));  
  
        bis = new BufferedInputStream(new FileInputStream(endPath));  
        bos = new BufferedOutputStream(response.getOutputStream());  
        byte[] buff = new byte[2048];  
        int bytesRead;  
        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
            bos.write(buff, 0, bytesRead);  
        }  
        bis.close();  
        bos.close();  
    }  
}
