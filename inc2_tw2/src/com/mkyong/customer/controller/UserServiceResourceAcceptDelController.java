package com.mkyong.customer.controller;

import org.springframework.web.servlet.mvc.SimpleFormController;

import com.model.ServiceResourceAccept;

public class UserServiceResourceAcceptDelController extends SimpleFormController {
	
	public UserServiceResourceAcceptDelController() {
		setCommandClass(ServiceResourceAccept.class);
		setCommandName("serviceResourceAccept");
	}

}
