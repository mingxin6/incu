package com.mkyong.customer.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.model.SharedThing;
import com.model.User;

public class SharedThingViewController extends SimpleFormController {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String table = "";
		String type = request.getParameter("type");
		if (type.equals("doc")) {
			table = "SharedDoc";
		} else if (type.equals("form")) {
			table = "SharedForm";
		} else if (type.equals("equipment")) {
			table = "sharedequipment";
		}
		request.setAttribute("type", type);
		
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");// user.userAuth.managerMenu

		
		String topicId = request.getParameter("aid");
//		if (user.getUserAuth().isBusinessMenu()) {
//			// System.out.println("userid=" + user.getUserid() + ", user.getUserComp()=" + user.getUserComp());
//			request.setAttribute("type", "B");
//		} else {// manager
//			request.setAttribute("type", "A");
//		}

//		System.out.println("String=" + topicId);

		SharedThing obj = new SharedThing();
		MySQLAccess o = new MySQLAccess();
		try {
			obj = o.readSharedThingByID(topicId, table);
			obj.status = obj.status.replace("0", "已隐藏");
			obj.status = obj.status.replace("1", "已显示");
			obj.status = obj.status.replace("2", "已删除");
		} catch (Exception e) {
			e.printStackTrace();
		}

		// MySQLAccess o2 = new MySQLAccess();
		// try {
		// String uniqueid = UUID.randomUUID().toString();
		// String compid = user.getCompid();
		// System.out.println("rid=" + uniqueid);
		// System.out.println("topicId=" + topicId);
		// System.out.println("compid=" + compid);
		// o2.insertAnnouncementRead(uniqueid, topicId, compid);
		// } catch (Exception e) {
		// // e.printStackTrace();
		// }

		return new ModelAndView("SharedThingView", "SharedThing", obj);

	}
}
