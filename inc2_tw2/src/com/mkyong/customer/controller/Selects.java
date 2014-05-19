package com.mkyong.customer.controller;

import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.Const;
import com.model.Company;

public class Selects {

	public static Map getCompanyKind(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		Map<String, String> mp = new LinkedHashMap<String, String>();
		mp.put(Company.KIND_DEMESTIC, resource.getString("comp.kind.domestic"));//本國
		mp.put(Company.KIND_FOREIGN, resource.getString("comp.kind.foreign"));//外商
		mp.put(Company.KIND_OVERSEA, resource.getString("comp.kind.overseas"));//僑外資
		return mp;
	}

	public static Map getCompanyDomain(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		Map<String, String> mp = new LinkedHashMap<String, String>();
		mp.put(Company.DOMAIN_SOFT, resource.getString("comp.domain.software"));// "資訊軟體"
		mp.put(Company.DOMAIN_SRV, resource.getString("comp.domain.ict"));// "科技化服務"
		mp.put(Company.DOMAIN_COMM, resource.getString("comp.domain.network"));// "網路通訊"
		mp.put(Company.DOMAIN_CONT, resource.getString("comp.domain.content"));// "數位內容"
		mp.put(Company.DOMAIN_EMBED, resource.getString("comp.domain.embedded"));// "嵌入式系統"
		mp.put(Company.DOMAIN_EE, resource.getString("comp.domain.ee"));// "電機電子"
		mp.put(Company.DOMAIN_OTHER, resource.getString("comp.domain.other"));// "其他"
		return mp;
	}

	public static Map getInnoKind(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		Map<String, String> mp = new LinkedHashMap<String, String>();
		mp.put(Company.INNO_INNO, resource.getString("comp.innokind.inno"));//創新
		mp.put(Company.INNO_NEW, resource.getString("comp.innokind.new"));//新創
		return mp;
	}

	public static Map getCompanyStatusConditionB0(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		Map<String, String> statusCond = new LinkedHashMap<String, String>();
		// statusCond.put("NONE", "---");
		statusCond.put(Company.STATUS_APPLY, resource.getString("comp.status.b.apply"));
		statusCond.put(Company.STATUS_RECEV, resource.getString("comp.status.b.recev"));
		statusCond.put(Company.STATUS_DENY, resource.getString("comp.status.b.deny"));
		statusCond.put(Company.STATUS_REVIEW, resource.getString("comp.status.b.review"));
		// statusCond.put(STATUS_PAPERREVIEW, STATUS_PAPERREVIEW);
		// statusCond.put(STATUS_PAPERREVIEWEND, STATUS_PAPERREVIEWEND);
		// statusCond.put(STATUS_MEETINGREVIEW, STATUS_MEETINGREVIEW);
		statusCond.put(Company.STATUS_APPLYOK, resource.getString("comp.status.b.applyok"));
		statusCond.put(Company.STATUS_APPLYFAIL, resource.getString("comp.status.b.applyfail"));
		// statusCond.put(STATUS_MOVEIN, STATUS_MOVEIN);
		// statusCond.put(STATUS_MOVEOUT, STATUS_MOVEOUT);
		return statusCond;
	}

	public static Map getCompanyStatusConditionB0() {
		Map<String, String> statusCond = new LinkedHashMap<String, String>();
		// statusCond.put("NONE", "---");
		statusCond.put(Company.STATUS_APPLY, Company.STATUS_APPLY);
		statusCond.put(Company.STATUS_RECEV, Company.STATUS_RECEV);
		statusCond.put(Company.STATUS_DENY, Company.STATUS_DENY);
		statusCond.put(Company.STATUS_REVIEW, Company.STATUS_REVIEW);
		statusCond.put(Company.STATUS_APPLYOK, Company.STATUS_APPLYOK);
		statusCond.put(Company.STATUS_APPLYFAIL, Company.STATUS_APPLYFAIL);
		// statusCond.put(STATUS_MOVEIN, STATUS_MOVEIN);
		// statusCond.put(STATUS_MOVEOUT, STATUS_MOVEOUT);
		return statusCond;
	}

	public static Map getCompanyStatusCondition(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		Map<String, String> statusCond = new LinkedHashMap<String, String>();
		// statusCond.put("NONE", "---");
		statusCond.put(Company.STATUS_MOVEIN, resource.getString("comp.status.movin"));
		statusCond.put(Company.STATUS_MOVEOUT, resource.getString("comp.status.moveout"));
		return statusCond;
	}

	
}
