package com.mkyong.customer.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.mkyong.customer.model.Customer;
import com.model.Activity;
import com.model.ManagementDept;

public class ActivityValidator implements Validator{

	@Override
	public boolean supports(Class clazz) {
		//just validate the Customer instances
		return Activity.class.isAssignableFrom(clazz);

	}

	@Override
	public void validate(Object target, Errors errors) {
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "theme",
				"required.theme", "活动主题不可空白.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sponsor",
				"required.sponsor", "主办方不可空白.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lecturer",
				"required.lecturer", "讲师不可空白.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lecturerintro",
				"required.lecturerintro", "讲师介绍不可空白.");
		
			
		
	}
	
}