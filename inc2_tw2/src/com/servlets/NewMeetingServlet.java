package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.MySQLAccessMyBatis;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.model.MeetingRoomOrder;
import com.utils.KeyMaker;

public class NewMeetingServlet extends HttpServlet {

	private static final long serialVersionUID = 6938406966533730198L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		String meetingRoomNo = request.getParameter("meetingRoomNo");
		String title = request.getParameter("title");
		// String selectdate = request.getParameter("selectdate");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String theComp = request.getParameter("theComp");
		String theName = request.getParameter("theName");
		String thePhone = request.getParameter("thePhone");

		// HttpSession session = request.getSession(false);
		// User user = (User) session.getAttribute("user");
		// String person = user.getUserName();
		// String phone = user.getUserPhone();

		System.out.println("========NewMeetingServlet==============");
		System.out.println("meetingRoomNo=" + meetingRoomNo);
		// System.out.println("User=" + user.getUserName() + ", phone=" + user.getUserPhone());
		System.out.println("title=" + title);
		// System.out.println("selectdate=" + selectdate);
		System.out.println("start=" + start);
		System.out.println("end=" + end);
		System.out.println("theComp=" + theComp);
		System.out.println("theName=" + theName);
		System.out.println("thePhone=" + thePhone);
		System.out.println("");

		// -----------------------------------------------------------------------------
		MeetingRoomOrder meetingRoomOrder = new MeetingRoomOrder();
		meetingRoomOrder.setId("mro" + KeyMaker.newKey());
		meetingRoomOrder.setMeetingRoomNo(meetingRoomNo);
		meetingRoomOrder.setStart(start);
		meetingRoomOrder.setEnd(end);
		meetingRoomOrder.setTitle(title);
		meetingRoomOrder.setCompName(theComp);
		meetingRoomOrder.setPerson(theName);
		meetingRoomOrder.setPhone(thePhone);
		
		
		
//		meetingRoomOrder.setMyStatus("NEW");

		try {
			JsonObject myObj = new JsonObject();
			if (!isOverlapping(meetingRoomOrder.getMeetingRoomNo(), meetingRoomOrder.getStart(),
					meetingRoomOrder.getEnd())) {
				saveData(meetingRoomOrder);
				myObj.addProperty("result", "AddOk");
				myObj.addProperty("id", meetingRoomOrder.getId());
			} else {
				myObj.addProperty("result", "NotAddOk");
				myObj.addProperty("msg", "錯誤! 時間與其他已預訂的時段重疊!");
			}

			Gson gson = new Gson();
			String jsonStr = gson.toJson(myObj);
			System.out.println("NewMeetingServlet,,,   =" + jsonStr);

			sendback(response, jsonStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void saveData(MeetingRoomOrder meetingRoomOrder) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		o.insertMeetingRoomOrder(meetingRoomOrder);
		o.closeSession();
	}
	
	List dbData(String meetingRoomNo) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		List recs = o.findMeetingRoomOrderByRoomNo(meetingRoomNo);
		o.closeSession();
		return recs;
	}

	public boolean isOverlapping(String meetingRoomNo, String start, String end) throws Exception {
		boolean b = false;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date start1 = sdf.parse(start);
		Date end1 = sdf.parse(end);
		List<MeetingRoomOrder> mrolist = dbData(meetingRoomNo);
		for (int i = 0; i < mrolist.size(); i++) {
			MeetingRoomOrder mro = (MeetingRoomOrder) mrolist.get(i);
			Date start2 = sdf.parse(mro.getStart());
			Date end2 = sdf.parse(mro.getEnd());
			if (start1.before(end2) && start2.before(end1)) {
				b = true;
				break;
			}
		}
		return b;
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

}
