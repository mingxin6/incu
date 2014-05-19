package com;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

public class MyLocaleChangeInterceptor extends LocaleChangeInterceptor {

	public MyLocaleChangeInterceptor() {
		super();
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws ServletException {
		String newLocale = request.getParameter(super.getParamName());
		
		// if (newLocale != null) {
		// LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
		// if (localeResolver == null) {
		// throw new IllegalStateException("No LocaleResolver found: not in a DispatcherServlet request?");
		// }
		// LocaleEditor localeEditor = new LocaleEditor();
		// localeEditor.setAsText(newLocale);
		// localeResolver.setLocale(request, response, (Locale) localeEditor.getValue());
		// }
		
		// Proceed in any case.
//		if (newLocale != null) {
//			String[] a=newLocale.split("_");
//			Locale loc=new Locale(a[0],a[1]);
//			ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", loc);
//			System.out.println("MyResource setLocal to-----> " + newLocale+","+resource.getString("comp.status.movin"));
//		}
		return super.preHandle(request, response, handler);
	}

	public static void main(String[] args) {

	}

}
