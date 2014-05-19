package com.mkyong.customer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import com.db.MySQLAccess;
import com.mod.companyUser.controller.MySQLAccessCompanyUser;
import com.mod.parkingLot.controller.MySQLAccessParkingLot;
import com.mod.parkingLotBike.controller.MySQLAccessParkingLotBike;
import com.mod.reviewPaper.controller.MySQLAccessReviewPaper;
import com.mod.reviewPaper.controller.ReviewCompany;
import com.mod.securityCard.controller.MySQLAccessSecurityCard;
import com.mod.talkNote.controller.MySQLAccessRequest;
import com.model.Company;
import com.model.CompanyUser;
import com.model.ReviewPaper;
import com.model.User;

public class BusinessMainController implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
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
		System.out.println("compUsers size="+compUsers.size());
		if (compUsers.size() > 0) {
			CompanyUser cu = (CompanyUser) compUsers.get(0);
			cu.setEntityStatusRS(request);
			System.out.println("compID=" + compID+", cu.getUid=" + cu.getUid()+", cu.getCompUid=" + cu.getCompUid()+", cu.getUserLoginId()=" + cu.getUserLoginId());
			comp.setUserLoginId(cu.getUserLoginId());
			comp.setUserLoginPwdClearText("");
			comp.setAccountStatus(cu.getEntityStatusRS());
		} else {
			comp.setUserLoginId("");
			comp.setUserLoginPwdClearText("");
			comp.setAccountStatus("");
		}
		
		
		//停车位 机车位 门禁卡
		MySQLAccessParkingLot o1 = new MySQLAccessParkingLot();
		MySQLAccessParkingLotBike o2 = new MySQLAccessParkingLotBike();
		MySQLAccessSecurityCard o3  = new MySQLAccessSecurityCard();
		
		String parkinglot = o1.findParkingLotByUser(comp.getCompName()).getParkingLotNo();
		String parkinglotbike = o2.findParkingLotBikeByUser(comp.getCompName()).getParkingLotBikeNo();
		String securitycard = o3.findSecurityCardByUser(comp.getCompName()).getSecurityCardNo();
		
		ModelAndView modelview =  new ModelAndView("businessMain", "comp", comp);
		modelview.addObject("parkinglot", parkinglot);
		modelview.addObject("parkinglotbike", parkinglotbike);
		modelview.addObject("securitycard", securitycard);
		
		//服务申请数量
		
		MySQLAccessRequest o5 = new MySQLAccessRequest();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("compId", comp.getCustomId());
		map.put("type", "TEACHER");
		String teachercnt = o5.findVisitCount2(map);
		String teachercnt2 = o5.findVisitCount3(map);
		
		map.put("type", "AM");
		String amcnt = o5.findVisitCount2(map);
		String amcnt2 = o5.findVisitCount3(map);
		
		map.put("type", "PM");
		String pmcnt = o5.findVisitCount2(map);
		String pmcnt2 = o5.findVisitCount3(map);
		
		modelview.addObject("teachercnt", teachercnt);
		modelview.addObject("teachercnt2", teachercnt2);
		
		modelview.addObject("amcnt", amcnt);
		modelview.addObject("amcnt2", amcnt2);
		
		modelview.addObject("pmcnt", pmcnt);
		modelview.addObject("pmcnt2", pmcnt2);
		
		return modelview;
		//return new ModelAndView("businessMain", "comp", comp);
	}

}
