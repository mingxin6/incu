package com.mod.room.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.springframework.web.servlet.view.RedirectView;

import com.model.Room;

public class RoomClearController implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uid = request.getParameter("uid");

		MySQLAccessRoom o = new MySQLAccessRoom();
		Room obj = o.findRoomById(uid);
		obj.setCompName("");
		obj.setCompId("");
		obj.setCompCustomid("");

		System.out.println("room uid=" + obj.getUid());
		o.updateRoom(obj, request);

		return new ModelAndView(new RedirectView("roomView.htm?uid=" + obj.getUid()));
//		return new ModelAndView(new RedirectView("roomList.htm"));
	}
}
