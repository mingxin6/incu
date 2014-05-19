package com.mod.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.member.controller.MySQLAccessMember;
import com.model.ActivityRec;
import com.model.Member;
import com.model.User;
import com.utils.UserUtil;

public class MemberAddController extends SimpleFormController {

	public MemberAddController() {
		setCommandClass(Member.class);
		setCommandName("member");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		Member obj = (Member) command;
		obj.markCreatinfo(request);
		obj.markModifyinfo(request);
	
		try {
			new MySQLAccessMember().insertMembers(obj, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView(new RedirectView("memberList.htm"));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		Member obj = new Member();
		return obj;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		referenceData.put("userStatuses", User.getEntityValidStatus(request));
		return referenceData;
	}
}
