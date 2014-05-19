package com.mkyong.customer.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.vo.VOChangePwd;

public class ChangePasswordValidator implements Validator {

	@Override
	public boolean supports(Class clazz) {
		return VOChangePwd.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		// System.out.println("vvvvvvtttttt");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "newPwd", "新密码不可空白.",
				"新密码不可空白.");

//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "newPwdAgain",
//				"密码不可空白.", "密码不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "oldPwd", "旧密码不可空白.",
				"旧密码不可空白.");
		// -------------------------------------------------------------------------------------
		VOChangePwd voChangePwd = (VOChangePwd) target;

		String newpwd = voChangePwd.getNewPwd();
		String newpwdAgain = voChangePwd.getNewPwdAgain();

		if (!(newpwd.equals(newpwdAgain))) {
			errors.reject("newpwd.invalid");
		}

	}

}