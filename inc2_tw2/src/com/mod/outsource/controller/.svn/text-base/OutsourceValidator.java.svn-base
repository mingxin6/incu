package com.mod.outsource.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.model.Outsource;

public class OutsourceValidator implements Validator {

	@Override
	public boolean supports(Class clazz) {
		return Outsource.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "proj", "required.proj",
				"委外項目不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contractName",
				"required.contractName", "合約名稱不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contractStartDate",
				"required.contractStartDate", "合約開始日期不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contractEndDate",
				"required.contractEndDate", "合約結束日期不可空白.");

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