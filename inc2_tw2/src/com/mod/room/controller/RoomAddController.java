package com.mod.room.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.company.controller.MySQLAccessCompany;
import com.mod.room.controller.MySQLAccessRoom;
import com.model.ActivityRec;
import com.model.Company;
import com.model.Room;
import com.vo.VOCompListCondition;

public class RoomAddController extends SimpleFormController {

	public RoomAddController() {
		setCommandClass(Room.class);
		setCommandName("room");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Room obj = (Room) command;
		new MySQLAccessRoom().insertRooms(obj, request);
		return new ModelAndView(new RedirectView("roomList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {

		Room obj = new Room();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		MySQLAccessCompany o = new MySQLAccessCompany();
		ArrayList ar = o.readCompList(new VOCompListCondition());

		for(int i=0;i<ar.size();i++){
			Company comp=(Company)ar.get(i);
			comp.setCompStatusRS(request);
		}
		
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < ar.size(); i++) {
			Company comp = (Company) ar.get(i);
			sb.append("\"");
			sb.append(comp.compName);
			sb.append("\"");
			if (i < ar.size() - 1)
				sb.append(",");
		}
		String sss = sb.toString();

		Map referenceData = new HashMap();
		referenceData.put("complist", sss);
		referenceData.put("objStatus", Room.getEntityValidStatus(request));
		return referenceData;
	}
}
