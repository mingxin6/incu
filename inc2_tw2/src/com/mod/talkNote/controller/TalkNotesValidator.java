package com.mod.talkNote.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.model.TalkNotes;

public class TalkNotesValidator implements Validator {

	private static transient Logger logger = LoggerFactory.getLogger(TalkNotesValidator.class);

	@Override
	public boolean supports(Class clazz) {
		return TalkNotes.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "talkTheme", "标题不可空白.", "标题不可空白.");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "talkTheme", "talknotes.theme", "標題不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "talkDateTime", "talknotes.datetime", "日期不可空白.");

		TalkNotes talkNotes = (TalkNotes) target;
		String d = talkNotes.getTalkDateTime();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		try {
			Date date = sdf.parse(d);
		} catch (ParseException e) {
			errors.rejectValue("talkDateTime", "date.format.invalid", "日期格式：yyyy/MM/dd");
//			errors.reject("date.format.invalid");
		}

	}

}
