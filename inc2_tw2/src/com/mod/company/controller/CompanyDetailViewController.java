package com.mod.company.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.db.MySQLAccess;
import com.mod.companyUser.controller.MySQLAccessCompanyUser;
import com.mod.reviewPaper.controller.MySQLAccessReviewPaper;
import com.mod.reviewPaper.controller.ReviewCompany;
import com.model.Company;
import com.model.CompanyUser;
import com.model.ReviewPaper;
import com.model.User;

public class CompanyDetailViewController implements Controller {

	protected final Log logger = LogFactory.getLog(getClass());

	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");

		String compID = "";
		if (user.getIsBusiness()) {// business
			request.setAttribute("type", "B");
			compID = user.getCompid();
		} else {// manager
			request.setAttribute("type", "A");
			compID = request.getParameter("compID");
		}

		System.out.println("compID=" + compID);

		MySQLAccess o = new MySQLAccess();

		// 公司基本資料, 專利, 獲獎, 文件等
		Company comp = o.readCompByUniqueID(compID);
		comp.setCompStatusRS(request);
		comp.setDomainRS(request);
		comp.setKindRS(request);
		comp.setInnoKindRS(request);

		

		// 審查案資料
		String reviewPaperUid = comp.getReviewPaperUid();
		ReviewPaper reviewPaper = new MySQLAccessReviewPaper().findReviewPaperByReviewPaperUid(reviewPaperUid);
		reviewPaper.setStatusRS(request);
		Iterator it = reviewPaper.getMp().keySet().iterator();
		while (it.hasNext()) {// 每個企業
			ReviewCompany reviewCompany = (ReviewCompany) it.next();
			reviewCompany.setFinalPassRS(request);
		}
		request.setAttribute("reviewPaper", reviewPaper);

		// 帳號資料
		MySQLAccessCompanyUser o4 = new MySQLAccessCompanyUser();
		ArrayList compUsers = (ArrayList) o4.findCompanyUsersByCompId(compID);
		System.out.println("compUsers size=" + compUsers.size());
		if (compUsers.size() > 0) {
			CompanyUser cu = (CompanyUser) compUsers.get(0);
			cu.setEntityStatusRS(request);
			System.out.println("compID=" + compID + ", cu.getUid=" + cu.getUid() + ", cu.getCompUid=" + cu.getCompUid()
					+ ", cu.getUserLoginId()=" + cu.getUserLoginId());
			comp.setUserLoginId(cu.getUserLoginId());
			comp.setUserLoginPwdClearText("");
			comp.setAccountStatus(cu.getEntityStatusRS());
		} else {
			comp.setUserLoginId("");
			comp.setUserLoginPwdClearText("");
			comp.setAccountStatus("");
		}

		return new ModelAndView("companyDetailView", "comp", comp);
	}

	public static void main(String[] args) {

	}

}