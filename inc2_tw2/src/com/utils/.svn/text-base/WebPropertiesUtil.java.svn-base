package com.utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

public class WebPropertiesUtil implements ServletContextListener {
	
	private static WebApplicationContext webApplicationContext;
	
	public WebPropertiesUtil(){
		super();
	}
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(sce.getServletContext());
 
	}
	
	public static ApplicationContext getApplicationContext() {
        return webApplicationContext;
    }
	
	public static String getMessage(){
		//webApplicationContext.getServletContext().
		//SessionLocaleResolver localeResolver = (SessionLocaleResolver)webApplicationContext.getBean("localeResolver");
		//localeResolver.resolveLocale();
		return null;
	}
}
