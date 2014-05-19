package com.mod.member.controller;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.mkyong.customer.validator.A_Validator;
import com.mod.teacher.controller.MySQLAccessTeacher;
import com.model.Member;
import com.model.Teacher;

public class MemberEditValidator implements Validator {

	@Override
	public boolean supports(Class clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required.name", "名稱不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "required.email", "電子郵箱不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone", "required.phone", "電話不可空白.");

		//---------------------------------------------------
		Member formObj = (Member) target;
		String newId = formObj.getUserLoginId();

		MySQLAccessMember o = new MySQLAccessMember();
		Member dbObj = o.findMemberById(formObj.getUid());

		if (!newId.equals(dbObj.getUserLoginId())) {
			new A_Validator().checkIdUnique(target, errors);
		}
	}
}