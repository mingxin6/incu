package com.mod.company.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.db.MySQLAccess;
import com.mkyong.customer.validator.A_Validator;
import com.model.Company;

public class CompanyWaitTransferController_B0Validator implements Validator{

	@Override
	public boolean supports(Class clazz) {
		//just validate the Customer instances
		return Company.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "compName",
				"required.compname", "企業名稱不可空白.");
		
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "boss",
//				"負責人不可空白", "負責人不可空白.");
//		
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone",
//				"負責人電話不可空白", "負責人電話不可空白.");

			
		//---------------------------------------------------
		Company formObj = (Company) target;
		//String newId = formObj.getUserLoginId();

		MySQLAccess o = new MySQLAccess();
		boolean loginidValid = o.CheckAccountLoginId(formObj.getUserLoginId());
		if (loginidValid) {
			errors.rejectValue("userLoginId", "userid.invalid");
		}

		
		
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword",
//				"required.confirmPassword", "Field name is required.");
//		
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sex", 
//				"required.sex", "Field name is required.");
//		
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "favNumber", 
//				"required.favNumber", "Field name is required.");
//		
//		ValidationUtils.rejectIfEmptyOrWhitespace(
//				errors, "javaSkills", "required.javaSkills","Field name is required.");
//		
//		Customer cust = (Customer)target;
//		
//		if(!(cust.getPassword().equals(cust.getConfirmPassword()))){
//			errors.rejectValue("password", "notmatch.password");
//		}
//		
//		if(cust.getFavFramework().length==0){
//			errors.rejectValue("favFramework", "required.favFrameworks");
//		}
//
//		if("NONE".equals(cust.getCountry())){
//			errors.rejectValue("country", "required.country");
//		}
		
	}
	
}