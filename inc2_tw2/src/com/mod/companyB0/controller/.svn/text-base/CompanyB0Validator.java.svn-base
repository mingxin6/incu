package com.mod.companyB0.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.model.Company;

public class CompanyB0Validator implements Validator{

	@Override
	public boolean supports(Class clazz) {
		//just validate the Customer instances
		return Company.class.isAssignableFrom(clazz);

	}

	@Override
	public void validate(Object target, Errors errors) {
		
		
		//Company comp = (Company) target;
		//System.out.println("CompanyValidator OOOOOOOOOOOOOOOOOOOOOOOOOOOOPPPPPPPPPPPPPPPPPPXXXXXXXXXXXXXXXXXXXXXXXX "+comp.uid+","+comp.getCompIntroduction());
		
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "compName",
				"required.compname", "企业名称不可空白.");
		
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "boss",
//				"负责人不可空白", "负责人不可空白.");
//		
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