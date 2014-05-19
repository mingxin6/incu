package com.mkyong.customer.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.mkyong.customer.model.Customer;
import com.model.Activity;
import com.model.Actvisitor;
import com.model.ManagementDept;
import com.model.SharedResources;

public class SharedResourcesValidator implements Validator{

	@Override
	public boolean supports(Class clazz) {
		//just validate the Customer instances
		return SharedResources.class.isAssignableFrom(clazz);

	}

	@Override
	public void validate(Object target, Errors errors) {
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "srname",
				"required.srname", "公司名称不可空白.");
			
		}
	
}