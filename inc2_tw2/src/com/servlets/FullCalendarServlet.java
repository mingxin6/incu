package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.MySQLAccessMyBatis;
import com.google.gson.Gson;
import com.model.MeetingRoomOrder;

public class FullCalendarServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		String meetingRoomNo = request.getParameter("meetingRoomNo");
		System.out.println("meetingRoomNo=" + meetingRoomNo);

		// SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		// date to calendar
		// Date now = new Date();
		// Calendar calendar = Calendar.getInstance();
		// calendar.setTime(now);
		// System.out.println(sdf.format(calendar.getTime()));

		// calendar to date
		// Calendar cal = Calendar.getInstance();
		// Date date = cal.getTime();
		// System.out.println(sdf.format(date));

		// System.out.println("get.......");
		// List<MeetingRoomOrder> fcList = testData(meetingRoomNo);
		List<MeetingRoomOrder> mroList = dbData(meetingRoomNo);
		// System.out.println("fcList size="+mroList.size());

		// 比今天早的, 設定其 myStatus 為 "passed"
		String jsonStr = "";
		try {
			for (int i = 0; i < mroList.size(); i++) {
				MeetingRoomOrder mro = (MeetingRoomOrder) mroList.get(i);
				String endtime = mro.getEnd();
				System.out.println("compppp="+mro.getCompName());
				if (preToday(endtime)) {
					mro.setMyStatus("PASSED");
				}
			}

			try {
				Gson gson = new Gson();
				jsonStr = gson.toJson(mroList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("FullCalendarServlet,,, =" + jsonStr);

		sendback(response, jsonStr);
	}

	boolean preToday(String endtime) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date d1 = dateFormat.parse(endtime);
		Date today = new Date();
		long diff = today.getTime() - d1.getTime();
		long n = diff / (1000 * 60 * 60 * 24);
		if (n > 0)
			return true;
		else
			return false;
	}

	void sendback(HttpServletResponse response, String msg) throws IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		response.setHeader("Cache-control", "no-cache, no-store");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "-1");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "POST");
		response.setHeader("Access-Control-Allow-Headers", "Content-Type");
		response.setHeader("Access-Control-Max-Age", "86400");
		out.println(msg);
		out.close();
	}

	List dbData(String meetingRoomNo) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		List recs = o.findMeetingRoomOrderByRoomNo(meetingRoomNo);
		o.closeSession();
		return recs;
	}

	List<MeetingRoomOrder> testData(String meetingRoomNo) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		List<MeetingRoomOrder> mroList = new ArrayList();
		for (int i = 0; i < 3; i++) {
			{
				Calendar cal = Calendar.getInstance();
				cal.add(Calendar.DATE, i);
				String startT = sdf.format(cal.getTime());

				// cal.add(Calendar.DATE, i);
				cal.add(Calendar.HOUR, 1);
				String endT = sdf.format(cal.getTime());

				System.out.println("startT=" + startT + ", endT=" + endT);

				MeetingRoomOrder o = new MeetingRoomOrder();
				o.setId("id_" + i);
				o.setStart(startT);
				o.setEnd(endT);
				o.setTitle("test title");
				o.setMeetingRoomNo(meetingRoomNo);
				// o.setPerson(person);
				// o.setPhone(phone);
				mroList.add(o);
			}

			if (i == 1) {
				Calendar cal2 = Calendar.getInstance();
				// cal.add(Calendar.DATE, i);
				cal2.add(Calendar.HOUR, 1);
				String startT2 = sdf.format(cal2.getTime());

				cal2.add(Calendar.HOUR, 1);
				String endT2 = sdf.format(cal2.getTime());

				System.out.println("startT2=" + startT2 + ", endT2=" + endT2);

				MeetingRoomOrder fcBean = new MeetingRoomOrder();
				fcBean.setId("id_" + i);
				fcBean.setStart(startT2);
				fcBean.setEnd(endT2);
				fcBean.setTitle("test title 2");
				mroList.add(fcBean);
			}
		}

		return mroList;
	}

}