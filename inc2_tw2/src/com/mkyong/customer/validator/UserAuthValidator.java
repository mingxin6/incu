package com.mkyong.customer.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.model.UserAuth;

public class UserAuthValidator implements Validator{

	@Override
	public boolean supports(Class clazz) {
		return UserAuth.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "roleName",
				"UserAuthValidator.roleName", "角色代号不可空白.");
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "roleChineseName",
				"UserAuthValidator.roleChineseName", "角色名称不可空白.");
		
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone",
//				"负责人电话不可空白", "负责人电话不可空白.");
			
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