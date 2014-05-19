package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.vo.VOFile;

public class DownloadFileListServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {

//		String srcid = request.getParameter("srcid");
		
//		System.out.println("ResourceDescriptionServlet,,,   srcid=" + srcid);
//
//		MySQLAccess db = new MySQLAccess();
//		ServiceResourceData srcData = db.readServiceResourceDataByID(srcid);

		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		response.setHeader("Cache-control", "no-cache, no-store");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "-1");

		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "POST");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type");
		response.setHeader("Access-Control-Max-Age", "86400");

		JsonObject myObj = new JsonObject();
		// ---------------------------------------------------------
		//if (srcData == null) {
			//myObj.addProperty("success", false);
		//} else {
			myObj.addProperty("success", true);

			Gson gson = new Gson();
			
			ArrayList ar=new ArrayList();
			VOFile voFile=new VOFile();
			voFile.setModifiedFileName("mmm");
			voFile.setOriginalFileName("ooo");
			ar.add(voFile);
			
			JsonElement fileObj = gson.toJsonTree(ar);
			myObj.add("files", fileObj);
		//}

		// ---------------------------------------------------------
		out.println(myObj.toString());
		
		System.out.println("DownloadFileListServlet,,,   myObj.toString()=" + myObj.toString());
		
		out.close();
	}

	

}