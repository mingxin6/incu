package com.mod.room.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.servlet.mvc.Controller;

import com.mod.room.controller.MySQLAccessRoom;

public class RoomDeleteController implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String uid = request.getParameter("uid");

		new MySQLAccessRoom().deleteRoom(uid, request);

		return new ModelAndView(new RedirectView("roomList.htm"));
	}
}
