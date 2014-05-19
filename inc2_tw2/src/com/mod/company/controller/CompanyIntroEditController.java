package com.mod.company.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.validation.Errors;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.db.MySQLAccessSec;
import com.mkyong.customer.controller.SelectCompanyIntroStatuses;
import com.model.CompanyIntro;
import com.model.User;

public class CompanyIntroEditController extends SimpleFormController {
	
	public CompanyIntroEditController() {
		setCommandClass(CompanyIntro.class);
		setCommandName("companyIntro");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {

		CompanyIntro obj = (CompanyIntro) command;

		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		try {
			System.out.println("begin companyintor .....");
			mysqlDB.updateCompanyIntro(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}

		/*obj.status=obj.status.replace("0", "已隐藏");
		obj.status=obj.status.replace("1", "已显示");
		obj.status=obj.status.replace("2", "已删除");
		obj.type=obj.type.replace("0", "文章");
		obj.type=obj.type.replace("1", "链接");*/
		
		//String strCategorize = obj.categorize;
		
		return new ModelAndView(new RedirectView("companyIntroList.htm"));
		
		//return new ModelAndView(getSuccessView(), "serviceResourceData", obj);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		

		CompanyIntro obj = new CompanyIntro();
		
		return obj;
	}
	@Override
	protected Map referenceData(HttpServletRequest request, Object command,
			Errors errors) throws Exception {

		Map referenceData = new HashMap();

		referenceData.put("statusCond", SelectCompanyIntroStatuses.get());

		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		
	
		request.setAttribute("pagetype", "edit");
		
		CompanyIntro obj = (CompanyIntro)command;
		MySQLAccessSec mysqlDB = new MySQLAccessSec();
		try {
			System.out.println("companyIntro...idis"+user.getCompid());
			CompanyIntro obj2 = mysqlDB.readCompanyIntroByID(user.getCompid());
			if("".equals(obj2.getCiid())){
				System.out.println("空.equals(obj2.getCiid()");
					
				obj.setCiid(UUID.randomUUID().toString());
				obj.setCompid(user.getCompid());
				obj.setStatus("0");
				obj.setBusiness(mysqlDB.insertCompanyIntro(obj));
			}else{
				System.out.println("非空 equals");
				
				obj.setCiid(obj2.getCiid());
				obj.setCompid(obj2.getCompid());
				obj.setStatus(obj2.getStatus());
				obj.setBusiness(obj2.getBusiness());
			}
			System.out.println("business...."+obj.getBusiness()+".");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		referenceData.put("companyIntro", obj);
		return referenceData;	
	}

}
