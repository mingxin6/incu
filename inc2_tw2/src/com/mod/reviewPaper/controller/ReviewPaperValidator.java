package com.mod.reviewPaper.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.model.ReviewPaper;

public class ReviewPaperValidator implements Validator {

	@Override
	public boolean supports(Class clazz) {
		return ReviewPaper.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "required.name",
				"名稱不可空白.");

		

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