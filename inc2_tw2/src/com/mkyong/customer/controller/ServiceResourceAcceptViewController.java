package com.mkyong.customer.controller;

import org.springframework.web.servlet.mvc.SimpleFormController;

import com.model.ServiceResourceAccept;

public class ServiceResourceAcceptViewController extends SimpleFormController {
	
	public ServiceResourceAcceptViewController() {
		setCommandClass(ServiceResourceAccept.class);
		setCommandName("serviceResourceAccept");
	}

}
