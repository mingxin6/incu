package com.mkyong.customer.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.db.MySQLAccess;
import com.model.User;

public class UserAccountNewValidator implements Validator {

	@Override
	public boolean supports(Class clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User usr = (User) target;

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName",
				"UserAccountValidator.userName", "使用者名稱不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userLoginId",
				"UserAccountValidator.userLoginId", "使用者帳號不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userLoginPwdClearText",
				"UserAccountValidator.userLoginPwd", "使用者密碼不可空白.");

		{
			if (usr.getIsBusiness()) {
				ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userComp",
						"UserAccountValidator.userComp", "使用者公司名稱不可空白.");

				String compid = null;
				try {
					MySQLAccess o = new MySQLAccess();
					compid = o.readCompIdFromCompName(usr.getUserComp());
				} catch (Exception e) {
					e.printStackTrace();
				}

				if (compid == null || compid.trim().equals("")) {
					errors.rejectValue("userComp", "company.name.invalid");
				} else {
					usr.setCompid(compid);
				}
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