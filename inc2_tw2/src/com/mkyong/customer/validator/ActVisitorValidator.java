package com.mkyong.customer.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.db.MySQLAccessSec;
import com.model.Actvisitor;

public class ActVisitorValidator implements Validator{

	@Override
	public boolean supports(Class clazz) {
		//just validate the Customer instances
		return Actvisitor.class.isAssignableFrom(clazz);

	}

	@Override
	public void validate(Object target, Errors errors) {
		

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "companyname",
				"required.companyname", "公司名称不可空白.");
			
		Actvisitor  actvisitor = (Actvisitor)target;
		if("-2".equals(actvisitor.getCompid())
			&&"1".equals(actvisitor.getStatus())){
			errors.rejectValue("compid", "illegal", "已建立商务关系的公司无需转为潜在进驻公司");
		}
		
		String strTemp ="";
		MySQLAccessSec  mysqlDB = new MySQLAccessSec();
		try{
//			System.out.println("actvisitor.getAvid() is...."+actvisitor.getAvid());
//			System.out.println("actvisitor.getActid() is...."+actvisitor.getActid());
//			
			strTemp = mysqlDB.readActvisitorByID(actvisitor.getAvid()).getStatus();
//			System.out.println("strTemp is...."+strTemp);
//			System.out.println("actvisitor.getStatus is...."+actvisitor.getStatus());
			
		}catch(Exception e){
			e.printStackTrace();
		}
		if("1".equals(strTemp)&&"0".equals(actvisitor.getStatus())){
			errors.rejectValue("status", "illegal", "已转为潜在进驻公司的状态无需再改变");
			
		}
		
	}
	
}