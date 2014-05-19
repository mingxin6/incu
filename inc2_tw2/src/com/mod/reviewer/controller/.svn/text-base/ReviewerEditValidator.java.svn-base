package com.mod.reviewer.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.mkyong.customer.validator.A_Validator;
import com.mod.teacher.controller.MySQLAccessTeacher;
import com.model.Reviewer;
import com.model.Teacher;

public class ReviewerEditValidator implements Validator {

	@Override
	public boolean supports(Class clazz) {
		return Reviewer.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required.name",
				"名稱不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "required.email",
				"電子郵箱不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "required.phone",
				"電話不可空白.");

		//---------------------------------------------------
		Reviewer formObj = (Reviewer) target;
		String newId = formObj.getUserLoginId();

		MySQLAccessReviewer o = new MySQLAccessReviewer();
		Reviewer dbObj = o.findReviewerById(formObj.getUid());

		if (!newId.equals(dbObj.getUserLoginId())) {
			new A_Validator().checkIdUnique(target, errors);
		}
		
		// User usr = (User) target;
		// {
		// if (usr.getIsBusiness()) {
		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userComp",
		// "使用者公司名稱不可空白", "使用者公司名稱不可空白.");
		//
		// String compid = null;
		// try {
		// MySQLAccess o = new MySQLAccess();
		// compid = o.readCompIdFromCompName(usr.getUserComp());
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		//
		// if (compid == null || compid.trim().equals("")) {
		// errors.rejectValue("userComp", "company.name.invalid");
		// } else {
		// usr.setCompid(compid);
		// }
		// }
		// }
		// {
		// User userx = null;
		// try {
		// MySQLAccess o = new MySQLAccess();
		// userx = o.findUserByLoginIdAndPwdUser(usr.getUserLoginId(), usr
		// .getUserLoginPwdClearText());
		// } catch (Exception e) {
		// e.printStackTrace();
		// }
		//
		// if (userx != null) {
		// errors.reject("duplicate.account");
		// }
		// }
	}

}