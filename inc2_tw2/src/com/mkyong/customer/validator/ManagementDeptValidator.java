package com.mkyong.customer.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.db.MySQLAccessSec;
import com.model.ManagementDept;

public class ManagementDeptValidator implements Validator{

	@Override
	public boolean supports(Class clazz) {
		//just validate the Customer instances
		return ManagementDept.class.isAssignableFrom(clazz);

	}

	@Override
	public void validate(Object target, Errors errors) {
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "department",
				"required.department", "部门名称不可空白.");
		
		ManagementDept md = (ManagementDept)target;
		
		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		if(true == mysqlDB.hasManagementDeptName(md.getDepartment())){
			errors.rejectValue("department", "required.department", "部门名称不可重复.");
		}
		
		
	}
	
}