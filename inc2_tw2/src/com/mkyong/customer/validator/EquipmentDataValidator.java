package com.mkyong.customer.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.mkyong.customer.model.Customer;
import com.model.Activity;
import com.model.Actvisitor;
import com.model.EquipmentData;
import com.model.ManagementDept;
import com.model.SharedResources;

public class EquipmentDataValidator implements Validator{

	@Override
	public boolean supports(Class clazz) {
		//just validate the Customer instances
		return EquipmentData.class.isAssignableFrom(clazz);

	}

	@Override
	public void validate(Object target, Errors errors) {
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name",
				"required.name", "设备名称不可空白.");
			
		}
	
}