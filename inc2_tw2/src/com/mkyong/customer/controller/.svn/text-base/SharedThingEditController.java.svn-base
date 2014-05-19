package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccess;
import com.model.SharedThing;
import com.utils.FileUpDownLoadUtil;

public class SharedThingEditController extends SimpleFormController {

	public SharedThingEditController() {
		setCommandClass(SharedThing.class);
		setCommandName("SharedThing");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		String table = "";
		String type = request.getParameter("type");
		if (type.equals("doc")) {
			table = "SharedDoc";
		} else if (type.equals("form")) {
			table = "SharedForm";
		} else if (type.equals("equipment")) {
			table = "sharedequipment";
		}

		
		
		SharedThing obj = (SharedThing) command;

		MySQLAccess o = new MySQLAccess();

		String[] deletedFiles = request.getParameterValues("deleteCheck");
		if (deletedFiles != null) {
			for (int i = 0; i < deletedFiles.length; i++) {
				System.out.println("deletedCheck====>>>>" + deletedFiles[i]);
				o.deleteUploaedFiles(deletedFiles);
			}
		}

		try {
			o.updateSharedThing(obj,table);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// ----------------------------------------------------------------
		obj.status = obj.status.replace("0", "已隐藏");
		obj.status = obj.status.replace("1", "已显示");
		obj.status = obj.status.replace("2", "已删除");
		
		// ----------------------------------------------------------------
		List files = obj.getFiles();
		ArrayList res = FileUpDownLoadUtil.upload(request, files);
		// obj.setFileInfo(res);

		// MySQLAccess o = new MySQLAccess();
		try {
			o.insertUploaedFiles(obj.aid, res);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ModelAndView(new RedirectView("SharedThingView.htm?type="+type+"&aid=" + obj.aid), "SharedThing", obj);
//		return new ModelAndView(getSuccessView(), "announcement", obj);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {

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

		
		String topicId = request.getParameter("aid");

//		request.setAttribute("pagetype", "edit");

		SharedThing obj = new SharedThing();
		MySQLAccess o = new MySQLAccess();
		try {
//			HttpSession session = request.getSession(false);
//			User user = (User) session.getAttribute("user");
			obj = o.readSharedThingByID(topicId, table);

			request.setAttribute("a_status", obj.status);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {

		Map referenceData = new HashMap();

//		referenceData.put("typeCond", SelectAnnouncementStatuses.getType());
		referenceData.put("statusCond", SelectAnnouncementStatuses.get());
		
		referenceData.put("type", request.getParameter("type"));

		return referenceData;
	}
}
