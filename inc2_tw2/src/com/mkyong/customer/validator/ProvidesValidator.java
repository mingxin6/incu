package com.mkyong.customer.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.entity.Provides;
import com.mkyong.customer.model.Customer;
import com.model.Activity;
import com.model.ManagementDept;

public class ProvidesValidator implements Validator{

	@Override
	public boolean supports(Class clazz) {
		//just validate the Customer instances
		return Provides.class.isAssignableFrom(clazz);

	}

	@Override
	public void validate(Object target, Errors errors) {
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "theme",
				"required.theme", "标题不可空白.");
		
			
		
	}
	
}