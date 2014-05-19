package com.mod.company.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.model.Company;

public class CompanyDetailEditIpValidator implements Validator {

	@Override
	public boolean supports(Class clazz) {
		return Company.class.isAssignableFrom(clazz);
	}

	
	public void validateHttpRequestParameters(HttpServletRequest request, Errors errors) {
	    // run the validations by adding new errors to the errors object
		
		String[] myno = request.getParameterValues("myno");
		String[] myname = request.getParameterValues("myname");
		String[] mycountry = request.getParameterValues("mycountry");
		String[] mydate = request.getParameterValues("mydate");
		if (myno != null) {
			for (int i = 0; i < myno.length; i++) {
				
				if(myno[i].trim().equals("")){
					errors.reject("userid.userpwd.invalid");
				}
				
				System.out.println("xxxooo  vv  newIp=>" + myno[i] + "," + myname[i] + ","
						+ mycountry[i] + "," + mydate[i]);
			}
		}
		
	}
	
	

	
	@Override
	public void validate(Object target, Errors errors) {


		//
		//User user = (User) target;
		//
		// if(!(cust.getPassword().equals(cust.getConfirmPassword()))){
		// errors.rejectValue("password", "notmatch.password");
		// }
		//
		// if(cust.getFavFramework().length==0){
		// errors.rejectValue("favFramework", "required.favFrameworks");
		// }
		//
		// if("NONE".equals(cust.getCountry())){
		// errors.rejectValue("country", "required.country");
		// }

	

//		if (!loginidValid) {
//			errors.rejectValue("userid", "userid.invalid");
//		}
//		if (!loginpwdValid) {
//			errors.rejectValue("userpwd", "userpwd.invalid");
//		}
//
//		if (userAccount == null) {
//			System.out.println("userAccount=isis=nullll....");
//			errors.reject("userid.userpwd.invalid");
//		}

		
	}

}