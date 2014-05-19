package com.mkyong.customer.validator;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.model.ServiceResourceAccept;
import com.vo.VOChangePwd;

public class UserServiceResourceAcceptAddValidator implements Validator {

	@Override
	public boolean supports(Class clazz) {
		return ServiceResourceAccept.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		// System.out.println("vvvvvvtttttt");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "srdid", "UserServiceResourceAcceptAddValidator.srdid", "请选择资源项目.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "contacts", "UserServiceResourceAcceptAddValidator.contacts", "联络人不可空白.");

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "tel", "UserServiceResourceAcceptAddValidator.tel", "电话不可空白.");
		
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "need_date_start", "开始时间不可空白.", "开始时间不可空白.");
//		
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "need_date_end", "结束时间不可空白.", "结束时间不可空白.");
//		
		
		ServiceResourceAccept sra = (ServiceResourceAccept)target;
		SimpleDateFormat sdfParse = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date dateBegin = null;
		Date dateEnd = null;
		try {
			dateBegin = sdfParse.parse(sra.getNeed_date_start());
			dateEnd = sdfParse.parse(sra.getNeed_date_end());
			if(dateBegin.after(dateEnd)){
				errors.rejectValue("need_date_end", "UserServiceResourceAcceptAddValidator.wrongdate","需求时间段顺序不符.");
			}
		} catch (ParseException e) {
			errors.rejectValue("need_date_end", "UserServiceResourceAcceptAddValidator.wrongdate2","时间格式错误.");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		// -------------------------------------------------------------------------------------
		// ServiceResourceAccept uerviceResourceAccept = (ServiceResourceAccept) target;
		// String srcid = uerviceResourceAccept.getSrdid();
		// if (srcid.trim().equals("")) {
		// errors.reject("newpwd.invalid");
		// }

	}

}