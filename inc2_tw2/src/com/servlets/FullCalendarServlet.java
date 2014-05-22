package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.MySQLAccess;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.model.FullCalendarBean;
import com.model.ServiceResourceAccept;

public class FullCalendarServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {

		String srdid = request.getParameter("srdid");

		System.out.println("FullCalendarServlet------srdid=" + srdid);

		MySQLAccess db = new MySQLAccess();
		List<ServiceResourceAccept> sraList = db.readServiceResourceAcceptListForFullCalendar(srdid);
		List<FullCalendarBean> fcList = new ArrayList();
		for (Iterator it = sraList.iterator(); it.hasNext();) {
			FullCalendarBean fcBean = new FullCalendarBean();
			ServiceResourceAccept sraBean = (ServiceResourceAccept) it.next();
			String start = sraBean.getNeed_date_start();
			String end = sraBean.getNeed_date_end();
			fcBean.setId(sraBean.getSeq());
			fcBean.setStart(start);
			fcBean.setEnd(end);
			fcBean.setTitle(sraBean.getCompany_name());

			SimpleDateFormat sdfParse = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			SimpleDateFormat sdfFormat = new SimpleDateFormat("HH点mm分");
			Date tempStart = null;
			Date tempEnd = null;

			try {
				tempStart = sdfParse.parse(start);
				tempEnd = sdfParse.parse(end);
				fcBean.setEventText("需求方：" + sraBean.getCompany_name() + "<br />" + "需求时间："
						+ sdfFormat.format(tempStart) + " 至 " + sdfFormat.format(tempEnd));
			} catch (ParseException e) {

				e.printStackTrace();
			}
			System.out.println("start to end  bean;;;;;");
			fcList.add(fcBean);
		}
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
		String jsonStr = "";
		// ---------------------------------------------------------

		Gson gson = new Gson();
		jsonStr = gson.toJson(fcList);

		// ---------------------------------------------------------
		out.println(jsonStr);

		System.out.println("FullCalendarServlet,,,   sraList.toString()=" + jsonStr);

		out.close();
	}

}