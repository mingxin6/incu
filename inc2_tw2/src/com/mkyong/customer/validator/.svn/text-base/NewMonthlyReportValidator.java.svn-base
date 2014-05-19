package com.mkyong.customer.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.db.MySQLAccess;
import com.model.MonthlyReport;

public class NewMonthlyReportValidator implements Validator {

	@Override
	public boolean supports(Class clazz) {
		return MonthlyReport.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "roleName", "角色代号不可空白.", "角色代号不可空白.");

		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "roleChineseName", "角色名称不可空白.", "角色名称不可空白.");

		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone",
		// "负责人电话不可空白", "负责人电话不可空白.");

		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword",
		// "required.confirmPassword", "Field name is required.");
		//
		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sex",
		// "required.sex", "Field name is required.");
		//
		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "favNumber",
		// "required.favNumber", "Field name is required.");
		//
		// ValidationUtils.rejectIfEmptyOrWhitespace(
		// errors, "javaSkills", "required.javaSkills","Field name is required.");
		//
		MonthlyReport monthlyReport = (MonthlyReport) target;
		//
		// if(!(cust.getPassword().equals(cust.getConfirmPassword()))){
		// errors.rejectValue("password", "notmatch.password");
		// }
		//
		// if(cust.getFavFramework().length==0){
		// errors.rejectValue("favFramework", "required.favFrameworks");
		// }
		//
		// if("NONE".equals(cust.getCountry())){
		// errors.rejectValue("country", "required.country");
		// }

		String yearMonth = monthlyReport.getYear() + "/" + monthlyReport.getMonth();

		MonthlyReport m = null;
		try {
			MySQLAccess o = new MySQLAccess();
			m = o.readMonthlyReportsByYearMonthAndComp(yearMonth, monthlyReport.getCompId());
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (m != null) {
			errors.reject("duplicate.compNyear.invalid");
		}

	}

}