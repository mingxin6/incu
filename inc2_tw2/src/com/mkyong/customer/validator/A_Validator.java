package com.mkyong.customer.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;

import com.db.MySQLAccess;
import com.model.A;

public class A_Validator {

	public void checkIdUnique(Object target, Errors errors) {
		A obj = (A) target;
		String loginId = obj.getUserLoginId();

		if (loginId.equals("")) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userLoginId", "required.userName", "帳號不能空白.");
			return;
		}

		try {
			MySQLAccess o = new MySQLAccess();
			boolean loginidValid = o.CheckAccountLoginId(loginId);
			System.out.println("CheckAccountLoginId ...");
			if (loginidValid) {
				errors.rejectValue("userLoginId", "userid.invalid");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return;
	}
}
