package com.mod.reviewPaper.controller;

import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.Const;
import com.model.Company;
import com.model.ReviewPaper;

public class ReviewCompany {
	String compUid = "";
	String compName = "";
	String avgScoreTotal = "";// 書審與面審的平均分數
	String finalPassRS = "";

	public ReviewCompany(String compUid, String compName) {
		this.compUid = compUid;
		this.compName = compName;
	}

	public String getCompUid() {
		return compUid;
	}

	public void setCompUid(String compUid) {
		this.compUid = compUid;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getAvgScoreTotal() {
		return avgScoreTotal;
	}

	public void setAvgScoreTotal(String avgScoreTotal) {
		this.avgScoreTotal = avgScoreTotal;
	}

	public String getFinalPass() {
		String x = Company.STATUS_APPLYFAIL;
		try {
			int a = Integer.parseInt(avgScoreTotal);
			if (a >= 70)
				x = Company.STATUS_APPLYOK;
		} catch (Exception e) {

		}
		return x;
	}

	public String getFinalPassRS() {
		//this.finalPassRS="實實";
		return finalPassRS;
	}

	public void setFinalPassRS(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		if (Company.STATUS_APPLY.equals(getFinalPass())) {
			finalPassRS = resource.getString("comp.status.b.apply");
		} else if (Company.STATUS_RECEV.equals(getFinalPass())) {
			finalPassRS = resource.getString("comp.status.b.recev");
		} else if (Company.STATUS_DENY.equals(getFinalPass())) {
			finalPassRS = resource.getString("comp.status.b.deny");
		} else if (Company.STATUS_REVIEW.equals(getFinalPass())) {
			finalPassRS = resource.getString("comp.status.b.review");
		} else if (Company.STATUS_APPLYOK.equals(getFinalPass())) {
			finalPassRS = resource.getString("comp.status.b.applyok");
		} else if (Company.STATUS_APPLYFAIL.equals(getFinalPass())) {
			finalPassRS = resource.getString("comp.status.b.applyfail");
		} else if (Company.STATUS_MOVEIN.equals(getFinalPass())) {
			finalPassRS = resource.getString("comp.status.movin");
		} else if (Company.STATUS_MOVEOUT.equals(getFinalPass())) {
			finalPassRS = resource.getString("comp.status.moveout");
		} else {
			finalPassRS = getFinalPass();
		}
		//finalPassRS="實實詩";
		//System.out.println("reviewCompany ggggg getFinalPass=="+getFinalPass()+", "+getFinalPassRS());
	}

	public int hashCode() {
		return compName.hashCode();
	}

	public boolean equals(Object o) {
		if (o == null)
			return false;
		if (!(o instanceof ReviewCompany))
			return false;
		ReviewCompany other = (ReviewCompany) o;
		if (!this.compUid.equals(other.compUid))
			return false;
		return true;
	}
}
