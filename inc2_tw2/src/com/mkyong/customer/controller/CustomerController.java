package com.mkyong.customer.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.mkyong.customer.model.Customer;
import com.model.User;

public class CustomerController extends SimpleFormController {

	public CustomerController() {
		setCommandClass(Customer.class);
		setCommandName("customerForm");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		HttpSession session = request.getSession(false);

		Customer customer = (Customer) command;
		System.out.println(customer);

		String[] favFramework=customer.getFavFramework();
		for(int i=0;i<favFramework.length;i++){
			System.out.println("-->"+favFramework[i]);
		}
		
		
		
		
//		if (session != null) {
//			session.setAttribute("customer", customer);
//
//			Object obj = session.getAttribute("user");
//			if (obj != null) {
//				User user = (User) obj;
//				System.out.println("user id===" + user.userid);
//			} else {
//				System.out.println("my User is null.....");
//			}
//		} else {
//			System.out.println("my Session is null.....");
//		}
		return new ModelAndView(getSuccessView(), "customer", customer);

	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		Customer cust;
		String userid = "";
		HttpSession session = request.getSession(false);
//		if (session != null) {
//			//---------------------------------------------------------
//			Object obj = session.getAttribute("user");
//			if (obj != null) {
//				User user = (User) obj;
//				System.out.println("user id===" + user.userid);
//				userid = user.userid;
//			} else {
//				System.out.println("my User is null.....");
//			}
//		} else {
//			System.out.println("my Session is null.....");
//		}

		//---------------------------------------------------------
		Object o = session.getAttribute("customer");
		if (o == null) {
			cust = new Customer();

			cust.setUserName(userid);
			// Make "Spring MVC" as default checked value
			cust.setFavFramework(new String[] { "Spring MVC" });

			// Make "Make" as default radio button selected value
			if (cust.getSex() == null || cust.getSex().equals("")) {
				cust.setSex("M");
			}

			// make "Hibernate" as the default java skills selection
			cust.setJavaSkills("Hibernate");

			// initilize a hidden value
			cust.setSecretValue("I'm hidden value");
		} else {
			cust = (Customer) o;
		}

		return cust;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {

		Map referenceData = new HashMap();

		// Data referencing for web framework checkboxes
		List<String> webFrameworkList = new ArrayList<String>();
		webFrameworkList.add("Spring MVC");
		webFrameworkList.add("Struts 1");
		webFrameworkList.add("Struts 2");
		webFrameworkList.add("JSF匡架");
		webFrameworkList.add("Apache Wicket");
		referenceData.put("webFrameworkList", webFrameworkList);

		// Data referencing for number radiobuttons
		List<String> numberList = new ArrayList<String>();
		numberList.add("Number 1");
		numberList.add("Number 2");
		numberList.add("Number 3");
		numberList.add("Number 4");
		numberList.add("Number 5");
		referenceData.put("numberList", numberList);

		// Data referencing for country dropdown box
		Map<String, String> country = new LinkedHashMap<String, String>();
		country.put("US", "United Stated");
		country.put("CHINA", "China");
		country.put("SG", "Singapore");
		country.put("MY", "Malaysia");
		referenceData.put("countryList", country);

		// Data referencing for java skills list box
		Map<String, String> javaSkill = new LinkedHashMap<String, String>();
		javaSkill.put("Hibernate", "Hibernate");
		javaSkill.put("Spring", "Spring");
		javaSkill.put("Apache Wicket", "Apache Wicket");
		javaSkill.put("Struts", "Struts");
		referenceData.put("javaSkillsList", javaSkill);

		return referenceData;
	}
}