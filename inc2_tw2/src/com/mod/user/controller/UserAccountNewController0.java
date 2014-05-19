package com.mod.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.mod.member.controller.MySQLAccessMember;
import com.model.Member;
import com.model.User;
import com.utils.KeyMaker;
import com.utils.UserUtil;

/**
 * 
 * 會員帳號新增
 *
 */
public class UserAccountNewController0 extends SimpleFormController {
	public UserAccountNewController0() {
		setCommandClass(Member.class);
		setCommandName("member");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {		
		Member obj = (Member) command;
//		obj.markCreatinfo(request);
//		obj.markModifyinfo(request);
		obj.setStatus(User.STATUS_OK);
		
		try {
			new MySQLAccessMember().insertMembers(obj, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
//		return new ModelAndView(new RedirectView("memberList.htm"));
		return new ModelAndView("UserAccountNewForm0_Sent", "member", obj);
		
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception{
		Member member = new Member();
		return member;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
//		referenceData.put("userStatuses", User.getUserStatusCondition());
		return referenceData;
	}
}