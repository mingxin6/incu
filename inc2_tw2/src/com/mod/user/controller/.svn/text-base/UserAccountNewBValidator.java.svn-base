package com.mod.user.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.db.MySQLAccess;
import com.model.User;

public class UserAccountNewBValidator implements Validator {

	@Override
	public boolean supports(Class clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName",
				"required.username2", "使用者名稱不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userLoginId",
				"required.userLoginId", "使用者帳號不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors,
				"userLoginPwdClearText", "required.userLoginPwdClearText", "使用者密碼不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors,
				"userLoginPwdClearText2", "required.userLoginPwdClearText", "使用者密碼不可空白.");

		
		User usr = (User) target;
		{
			String p1 = usr.getUserLoginPwdClearText();
			String p2 = usr.getUserLoginPwdClearText2();
			if (!p1.equals(p2)) {
				errors.reject("inconsistent.password");
			}
		}
		{

			User userx = null;
			try {
				MySQLAccess o = new MySQLAccess();
				userx = o.findUserByLoginIdAndPwdUser(usr.getUserLoginId(), usr
						.getUserLoginPwdClearText());
			} catch (Exception e) {
				e.printStackTrace();
			}

			if (userx != null) {
				errors.reject("duplicate.account");
			}
		}
	}

}