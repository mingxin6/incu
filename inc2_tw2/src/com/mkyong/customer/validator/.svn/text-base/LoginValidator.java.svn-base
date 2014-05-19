package com.mkyong.customer.validator;

import javax.servlet.http.HttpSession;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.db.MySQLAccess;
import com.model.User;
import com.vo.VOLoginInfo;

public class LoginValidator implements Validator {

	@Override
	public boolean supports(Class clazz) {
		return VOLoginInfo.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		
		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "roleName", "角色代号不可空白.", "角色代号不可空白.");

		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "roleChineseName", "角色名称不可空白.", "角色名称不可空白.");

		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phone",
		// "负责人电话不可空白", "负责人电话不可空白.");

		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword",
		// "required.confirmPassword", "Field name is required.");
		//
		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sex",
		// "required.sex", "Field name is required.");
		//
		// ValidationUtils.rejectIfEmptyOrWhitespace(errors, "favNumber",
		// "required.favNumber", "Field name is required.");
		//
		// ValidationUtils.rejectIfEmptyOrWhitespace(
		// errors, "javaSkills", "required.javaSkills","Field name is required.");
		//
		VOLoginInfo voLogin = (VOLoginInfo) target;

		if (voLogin.getUserLoginId().equals("")) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userLoginId", "required.userName", "帳號不能空白.");
			//帳號不能空白.
			return;
		}
		
		if (voLogin.getUserLoginPwd().equals("")) {
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userLoginPwd", "required.password", "密碼不能空白.");
			return;
		}
		
		//
		// if(!(cust.getPassword().equals(cust.getConfirmPassword()))){
		// errors.rejectValue("password", "notmatch.password");
		// }
		//
		// if(cust.getFavFramework().length==0){
		// errors.rejectValue("favFramework", "required.favFrameworks");
		// }
		//
		// if("NONE".equals(cust.getCountry())){
		// errors.rejectValue("country", "required.country");
		// }

		boolean loginidValid = false;
		boolean loginpwdValid = false;
		String loginid = voLogin.getUserLoginId();
		String loginPwd = voLogin.getUserLoginPwd();

		User user = null;
		try {
			MySQLAccess o = new MySQLAccess();

			loginidValid = o.CheckAccountLoginId(loginid);
			System.out.println("CheckAccountLoginId ...");

			loginpwdValid = o.CheckAccountLoginPwd(loginPwd);
			System.out.println("CheckAccountLoginPwd ...");

			user = o.findUserByLoginIdAndPwdUser(loginid, loginPwd);
			System.out.println("findUserByLoginIdAndPwdUser ..." + user);

			// System.out.println("loginPwdloginPwdloginPwd LoginValidator loginidValid==="+loginidValid+",loginpwdValid="+loginpwdValid);
			// System.out.println("userAccount="+(userAccount==null?"null":"not null"));
			// if(userAccount==null){
			// System.out.println("userAccount===nullll....");
			// }
		} catch (Exception e) {
			e.printStackTrace();
		}

		// if (!loginidValid) {
		// errors.rejectValue("userLoginId", "userid.invalid");
		// }
		// if (!loginpwdValid) {
		// errors.rejectValue("userLoginPwd", "userpwd.invalid");
		// }

		if (user == null) {
			System.out.println("userAccount=isis=nullll....");
			errors.reject("userid.userpwd.invalid");
		}

		// System.out.println("loggin valid...");
	}

}