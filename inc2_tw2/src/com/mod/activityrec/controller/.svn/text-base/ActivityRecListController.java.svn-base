package com.mod.activityrec.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.mkyong.customer.controller.SelectMonth;
import com.mkyong.customer.controller.SelectYear;
import com.vo.VOActivityRecSearchCondition;

public class ActivityRecListController extends SimpleFormController {

	public ActivityRecListController() {
		setCommandClass(VOActivityRecSearchCondition.class);
		setCommandName("voActivityRecSearchCondition");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request,
			HttpServletResponse response, Object command, BindException errors)
			throws Exception {
		VOActivityRecSearchCondition voActivityRecSearchCondition = (VOActivityRecSearchCondition) command;
		ArrayList ar = new ArrayList();
		MySQLAccessActivityRec o = new MySQLAccessActivityRec();
		try {
			ar = o.findActivityRecBySearch(voActivityRecSearchCondition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("activityRecList", ar);
		//
		//
		HttpSession session = request.getSession(false);
		session.setAttribute("voActivityRecSearchCondition",
				voActivityRecSearchCondition);
		//
		request.setAttribute("selectYear", SelectYear.get());
		request.setAttribute("selectMonth", SelectMonth.get());

		return new ModelAndView("activityRecList",
				"voActivityRecSearchCondition", voActivityRecSearchCondition);
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession(false);
		VOActivityRecSearchCondition voActivityRecSearchCondition = (VOActivityRecSearchCondition) session
				.getAttribute("voActivityRecSearchCondition");
		if (voActivityRecSearchCondition == null)
			voActivityRecSearchCondition = new VOActivityRecSearchCondition();
		return voActivityRecSearchCondition;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		VOActivityRecSearchCondition voActivityRecSearchCondition = (VOActivityRecSearchCondition) session
				.getAttribute("voActivityRecSearchCondition");
		if (voActivityRecSearchCondition == null){
			voActivityRecSearchCondition = new VOActivityRecSearchCondition();
			voActivityRecSearchCondition.setYear("NONE");
			voActivityRecSearchCondition.setMonth("NONE");
		}
		
		ArrayList ar = new ArrayList();
		MySQLAccessActivityRec o = new MySQLAccessActivityRec();
		try {
			ar = o.findActivityRecBySearch(voActivityRecSearchCondition);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map referenceData = new HashMap();
		referenceData.put("activityRecList", ar);
		referenceData.put("selectYear", SelectYear.get());
		referenceData.put("selectMonth", SelectMonth.get());

		return referenceData;
	}
}