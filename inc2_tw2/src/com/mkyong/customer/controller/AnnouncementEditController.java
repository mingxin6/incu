package com.mkyong.customer.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccess;
import com.model.Announcement;
import com.model.User;

public class AnnouncementEditController extends SimpleFormController {

	public AnnouncementEditController() {
		setCommandClass(Announcement.class);
		setCommandName("announcement");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		Announcement obj = (Announcement) command;
		MySQLAccess o = new MySQLAccess();
		o.updateAnnouncement(obj, request);

		// ----------------------------------------------------------------
		obj.status = obj.status.replace("0", "已隐藏");
		obj.status = obj.status.replace("1", "已显示");
		obj.status = obj.status.replace("2", "已删除");
		obj.type = obj.type.replace("0", "文章");
		obj.type = obj.type.replace("1", "链接");

		return new ModelAndView(new RedirectView("announcementView.htm?aid="
				+ obj.aid), "announcement", obj);
		// return new ModelAndView(getSuccessView(), "announcement", obj);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		String aid = request.getParameter("aid");
		request.setAttribute("pagetype", "edit");
		Announcement obj = new Announcement();
		MySQLAccess o = new MySQLAccess();
		try {
			HttpSession session = request.getSession(false);
			User user = (User) session.getAttribute("user");
			obj = o.readAnnouncementByID(aid, user);
			request.setAttribute("a_status", obj.status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {

		Map referenceData = new HashMap();

		referenceData.put("typeCond", SelectAnnouncementStatuses.getType());
		referenceData.put("statusCond", SelectAnnouncementStatuses.get());

		return referenceData;
	}
}
