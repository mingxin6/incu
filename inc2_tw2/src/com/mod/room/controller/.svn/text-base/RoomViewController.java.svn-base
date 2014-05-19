package com.mod.room.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.room.controller.MySQLAccessRoom;
import com.model.Room;

public class RoomViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		Room obj = new Room();
		MySQLAccessRoom o = new MySQLAccessRoom();
		try {
			obj = o.findRoomById(uid);
			obj.setEntityStatusRS(request);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("roomView", "room", obj);
	}
}
