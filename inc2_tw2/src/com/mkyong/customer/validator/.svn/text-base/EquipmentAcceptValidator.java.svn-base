package com.mkyong.customer.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.mkyong.customer.model.Customer;
import com.model.Activity;
import com.model.Actvisitor;
import com.model.EquipmentAccept;
import com.model.EquipmentData;
import com.model.ManagementDept;
import com.model.SharedResources;

public class EquipmentAcceptValidator implements Validator{

	@Override
	public boolean supports(Class clazz) {
		//just validate the Customer instances
		return EquipmentAccept.class.isAssignableFrom(clazz);

	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contacts",
				"required.contacts", "联络人不可空白.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tel",
				"required.tel", "联络人不可空白.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "need_date_start",
				"required.need_date_start", "起始需求日期不可空白.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "need_date_end",
				"required.need_date_end", "结束需求日期不可空白.");
				
		}
	
}