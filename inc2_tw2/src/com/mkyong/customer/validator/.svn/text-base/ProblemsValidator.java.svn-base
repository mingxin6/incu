package com.mkyong.customer.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.entity.Problems;
import com.entity.Provides;
import com.mkyong.customer.model.Customer;
import com.model.Activity;
import com.model.ManagementDept;

public class ProblemsValidator implements Validator{

	@Override
	public boolean supports(Class clazz) {
		//just validate the Customer instances
		return Problems.class.isAssignableFrom(clazz);

	}

	@Override
	public void validate(Object target, Errors errors) {
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "theme",
				"required.theme", "标题不可空白.");
		
			
		
	}
	
}