package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.MySQLAccessMyBatis;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.model.MeetingRoomOrder;

public class DeleteMeetingServlet extends HttpServlet {

	private static final long serialVersionUID = 6938406966533730198L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		String id = request.getParameter("id");
		System.out.println("meeting id=" + id);

		String name = request.getParameter("name");
		System.out.println("meeting ordered by=" + name);

		JsonObject myObj = new JsonObject();

		MeetingRoomOrder mro = findMeetingRoomOrderById(id);
		System.out.println("meeting ordered by,,,,=" + mro.getPerson());
		if (mro != null) {
			if (mro.getPerson().equals(name)) {
				delData(id);
				myObj.addProperty("result", "deleteOk");
			} else {
				//myObj.addProperty("result", "deleteFail");
				myObj.addProperty("result", "只有建立此會議者才能刪除會議!");
			}
		} else {
			//myObj.addProperty("result", "deleteFail");
			myObj.addProperty("result", "資料庫中無此筆會議資料!");
		}

		Gson gson = new Gson();
		String jsonStr = gson.toJson(myObj);
		System.out.println("DeleteMeetingServlet,,,   =" + jsonStr);

		sendback(response, jsonStr);
	}

	MeetingRoomOrder findMeetingRoomOrderById(String uid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		MeetingRoomOrder mro = o.findMeetingRoomOrderById(uid);
		o.closeSession();
		return mro;
	}

	void delData(String uid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		o.deleteMeetingRoomOrder(uid);
		o.closeSession();
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

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
