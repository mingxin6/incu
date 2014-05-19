package com.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.Const;
import com.mod.reviewPaper.controller.ReviewCompany;
import com.mod.reviewPaper.controller.TypeReviewGroup;

/**
 * 一次審查案 (含多家企業)
 */
public class ReviewPaper extends A {

	public static String TYPE_PAPERREVIEW = "PAPER";// "書審類";
	public static String TYPE_MEETINGREVIEW = "MEETING";// "面審類";

	public static String STAT_CLOSE = "STAT_CLOSE";// "已結案";
	public static String STAT_PROC = "STAT_PROC";// "進行中";

	public static Map getCaesStatus(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		Map<String, String> statusCond = new LinkedHashMap<String, String>();
		statusCond.put("", "---");
		statusCond.put(STAT_CLOSE, resource.getString("review.status.close"));
		statusCond.put(STAT_PROC, resource.getString("review.status.open"));
		return statusCond;
	}

	String statusRS = "";

	public static String FILE_OTHERFILES = "FILE_OTHER";// "附件";
	public static String FILE_1 = "FILE_APPL";// 進駐申請表";
	public static String FILE_2 = "FILE_LETTER";// "公司設立函文";
	public static String FILE_3 = "FILE_BP";// "營運計劃書";
	public static String FILE_4 = "FILE_CERT";// "會計師簽證";
	public static String FILE_5 = "FILE_401";// "401 報表";

	String reviewPaperUid = "";
	String title = "";
	String thedate = "";
	String remark = "";


	ArrayList<ReviewPaperResult> reviewPaperResults = new ArrayList<ReviewPaperResult>();

	public boolean isClosed() {
		return status.equals(STAT_CLOSE);
	}

	public String getTYPE_PAPERREVIEW() {
		return TYPE_PAPERREVIEW;
	}

	public String getTYPE_MEETINGREVIEW() {
		return TYPE_MEETINGREVIEW;
	}

	public String getStatusRS() {
		return statusRS;
	}

	public void setStatusRS(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		if (STAT_CLOSE.equals(status)) {
			this.statusRS = resource.getString("review.status.close");
		} else if (STAT_PROC.equals(status)) {
			this.statusRS = resource.getString("review.status.open");
		} else {
			this.statusRS = status;
		}
	}

	public String getReviewPaperUid() {
		return reviewPaperUid;
	}

	public void setReviewPaperUid(String reviewPaperUid) {
		this.reviewPaperUid = reviewPaperUid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThedate() {
		return thedate;
	}

	public void setThedate(String thedate) {
		this.thedate = thedate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	

	public ArrayList<ReviewPaperResult> getReviewPaperResults() {
		return reviewPaperResults;
	}

	public void setReviewPaperResults(ArrayList<ReviewPaperResult> reviewPaperResults) {
		this.reviewPaperResults = reviewPaperResults;
	}

	public ArrayList<String> getReviewerIds(String type) {
		ArrayList ar = new ArrayList();
		for (int i = 0; i < reviewPaperResults.size(); i++) {
			ReviewPaperResult r = (ReviewPaperResult) reviewPaperResults.get(i);
			if (!r.getType().equals(type))
				continue;

			if (!ar.contains(r.getReviewerUid())) {
				ar.add(r.getReviewerUid());
			}
		}
		return ar;
	}

	public ArrayList<String> getCompanyIds() {
		ArrayList ar = new ArrayList();
		for (int i = 0; i < reviewPaperResults.size(); i++) {
			ReviewPaperResult r = (ReviewPaperResult) reviewPaperResults.get(i);
			if (!ar.contains(r.getCompanyUid())) {
				ar.add(r.getCompanyUid());
			}
		}
		return ar;
	}

	public boolean isAllHaveAvgScoreTotal() {
		boolean b = true;
		HashMap mp = getMp();
		Iterator it = mp.keySet().iterator();
		while (it.hasNext()) {// 每個企業
			ReviewCompany reviewCompany = (ReviewCompany) it.next();
			String avg = reviewCompany.getAvgScoreTotal();
			if (avg.equals("0")) {
				b = false;
				break;
			}
		}
		return b;
	}

	HashMap<ReviewCompany, HashMap<String, TypeReviewGroup>> mp = new HashMap<ReviewCompany, HashMap<String, TypeReviewGroup>>();

	public void setMp() {
		// key ReviewCompany-->type(書審, 面審)-->ReviewGroup --> avgScore & reviewList(審查紀錄)
		HashMap<ReviewCompany, HashMap<String, TypeReviewGroup>> mymap = new HashMap<ReviewCompany, HashMap<String, TypeReviewGroup>>();

		System.out.println("### reviewPaperResults size--->" + reviewPaperResults.size());

		// 依企業將評審紀錄分群, 形成一個 model
		for (int i = 0; i < reviewPaperResults.size(); i++) {
			ReviewPaperResult r = (ReviewPaperResult) reviewPaperResults.get(i);

			ReviewCompany comkey = new ReviewCompany(r.getCompanyUid(), r.getCompanyName());

			String type = r.getType();
			HashMap<String, TypeReviewGroup> compEntry = mymap.get(comkey);

			if (compEntry == null) {
				ArrayList ar = new ArrayList();
				ar.add(r);

				TypeReviewGroup g = new TypeReviewGroup();
				g.setType(type);
				g.setReviewResults(ar);

				HashMap<String, TypeReviewGroup> m = new HashMap<String, TypeReviewGroup>();
				m.put(type, g);

				mymap.put(comkey, m);
			} else {
				TypeReviewGroup reviewG = compEntry.get(type);
				if (reviewG == null) {
					TypeReviewGroup g = new TypeReviewGroup();
					g.setType(type);
					g.getReviewResults().add(r);

					compEntry.put(type, g);
				} else {
					reviewG.getReviewResults().add(r);
				}
			}
		}

		// 列印 debug
		// {
		// System.out.println("### company group size--->" + mp.keySet().size());
		//
		// Iterator it = mp.keySet().iterator();
		// while (it.hasNext()) {// 每個企業
		// ReviewCompany reviewCompany = (ReviewCompany) it.next();
		// HashMap<String, TypeReviewGroup> typesMap = mp.get(reviewCompany);// 一個企業的兩種 type
		//
		// System.out.println(reviewCompany.getCompName() + " has ### type group size--->"
		// + typesMap.keySet().size());
		//
		// Iterator it2 = typesMap.keySet().iterator();
		// int m = 1;
		// while (it2.hasNext()) {// 每個 type
		// String type = (String) it2.next();
		// TypeReviewGroup g = (TypeReviewGroup) typesMap.get(type); // 每種 type 的紀錄群
		//
		// System.out.println(m + " ### type group has --->" + g.getReviewResults().size() + " records");
		// ;
		// }
		//
		// }
		//
		// }

		// 計算每個企業的總平均
		Iterator it = mymap.keySet().iterator();
		while (it.hasNext()) {// 每個企業
			ReviewCompany reviewCompany = (ReviewCompany) it.next();
			int scoreTotal = 0;
			// int count = 0;
			HashMap<String, TypeReviewGroup> typesMap = mymap.get(reviewCompany);// 一個企業的兩種 type
			Iterator it2 = typesMap.keySet().iterator();
			while (it2.hasNext()) {// 每個 type
				String type = (String) it2.next();
				TypeReviewGroup g = (TypeReviewGroup) typesMap.get(type); // 每種 type 的紀錄群

				String groupAvg = g.getAvgScore();
				try {
					int n = Integer.parseInt(groupAvg);
					scoreTotal = scoreTotal + n;

				} catch (Exception e) {
					// e.printStackTrace();
				}

				// ArrayList ar = g.getReviewResults();
				// for (int i = 0; i < ar.size(); i++) {
				// ReviewPaperResult r = (ReviewPaperResult) ar.get(i);// 每個紀錄
				//
				// // System.out.println(count + "--->" + r.reviewerUid + "," + r.getReviewerName() + "," +
				// // r.getScore());
				//
				// String score = r.getScore();
				// try {
				// int n = Integer.parseInt(score);
				// scoreTotal = scoreTotal + n;
				// // System.out.println(scoreTotal);
				// } catch (Exception e) {
				// // e.printStackTrace();
				// }
				// count++;
				// }
			}
			// System.out.println("--->>>> scoreTotal="+scoreTotal);
			reviewCompany.setAvgScoreTotal("" + new BigDecimal(scoreTotal / 2.0).setScale(0, BigDecimal.ROUND_HALF_UP));

			// System.out.println(count + "--->" + scoreTotal);
			// if (count == 0) {
			// reviewCompany.setAvgScoreTotal("0");
			// } else {
			// reviewCompany.setAvgScoreTotal("" + (scoreTotal / count));
			// }
		}
		this.mp = mymap;
	}

	public HashMap<ReviewCompany, HashMap<String, TypeReviewGroup>> getMp() {
		// // key ReviewCompany-->type(書審, 面審)-->ReviewGroup --> avgScore & reviewList(審查紀錄)
		// HashMap<ReviewCompany, HashMap<String, TypeReviewGroup>> mp = new HashMap<ReviewCompany, HashMap<String,
		// TypeReviewGroup>>();
		//
		// System.out.println("### reviewPaperResults size--->" + reviewPaperResults.size());
		//
		// // 依企業將評審紀錄分群, 形成一個 model
		// for (int i = 0; i < reviewPaperResults.size(); i++) {
		// ReviewPaperResult r = (ReviewPaperResult) reviewPaperResults.get(i);
		//
		// ReviewCompany comkey = new ReviewCompany(r.getCompanyUid(), r.getCompanyName());
		//
		// String type = r.getType();
		// HashMap<String, TypeReviewGroup> compEntry = mp.get(comkey);
		//
		// if (compEntry == null) {
		// ArrayList ar = new ArrayList();
		// ar.add(r);
		//
		// TypeReviewGroup g = new TypeReviewGroup();
		// g.setType(type);
		// g.setReviewResults(ar);
		//
		// HashMap<String, TypeReviewGroup> m = new HashMap<String, TypeReviewGroup>();
		// m.put(type, g);
		//
		// mp.put(comkey, m);
		// } else {
		// TypeReviewGroup reviewG = compEntry.get(type);
		// if (reviewG == null) {
		// TypeReviewGroup g = new TypeReviewGroup();
		// g.setType(type);
		// g.getReviewResults().add(r);
		//
		// compEntry.put(type, g);
		// } else {
		// reviewG.getReviewResults().add(r);
		// }
		// }
		// }
		//
		// // 列印 debug
		// // {
		// // System.out.println("### company group size--->" + mp.keySet().size());
		// //
		// // Iterator it = mp.keySet().iterator();
		// // while (it.hasNext()) {// 每個企業
		// // ReviewCompany reviewCompany = (ReviewCompany) it.next();
		// // HashMap<String, TypeReviewGroup> typesMap = mp.get(reviewCompany);// 一個企業的兩種 type
		// //
		// // System.out.println(reviewCompany.getCompName() + " has ### type group size--->"
		// // + typesMap.keySet().size());
		// //
		// // Iterator it2 = typesMap.keySet().iterator();
		// // int m = 1;
		// // while (it2.hasNext()) {// 每個 type
		// // String type = (String) it2.next();
		// // TypeReviewGroup g = (TypeReviewGroup) typesMap.get(type); // 每種 type 的紀錄群
		// //
		// // System.out.println(m + " ### type group has --->" + g.getReviewResults().size() + " records");
		// // ;
		// // }
		// //
		// // }
		// //
		// // }
		//
		// // 計算每個企業的總平均
		// Iterator it = mp.keySet().iterator();
		// while (it.hasNext()) {// 每個企業
		// ReviewCompany reviewCompany = (ReviewCompany) it.next();
		// int scoreTotal = 0;
		// // int count = 0;
		// HashMap<String, TypeReviewGroup> typesMap = mp.get(reviewCompany);// 一個企業的兩種 type
		// Iterator it2 = typesMap.keySet().iterator();
		// while (it2.hasNext()) {// 每個 type
		// String type = (String) it2.next();
		// TypeReviewGroup g = (TypeReviewGroup) typesMap.get(type); // 每種 type 的紀錄群
		//
		// String groupAvg = g.getAvgScore();
		// try {
		// int n = Integer.parseInt(groupAvg);
		// scoreTotal = scoreTotal + n;
		//
		// } catch (Exception e) {
		// // e.printStackTrace();
		// }
		//
		// // ArrayList ar = g.getReviewResults();
		// // for (int i = 0; i < ar.size(); i++) {
		// // ReviewPaperResult r = (ReviewPaperResult) ar.get(i);// 每個紀錄
		// //
		// // // System.out.println(count + "--->" + r.reviewerUid + "," + r.getReviewerName() + "," +
		// // // r.getScore());
		// //
		// // String score = r.getScore();
		// // try {
		// // int n = Integer.parseInt(score);
		// // scoreTotal = scoreTotal + n;
		// // // System.out.println(scoreTotal);
		// // } catch (Exception e) {
		// // // e.printStackTrace();
		// // }
		// // count++;
		// // }
		// }
		// // System.out.println("--->>>> scoreTotal="+scoreTotal);
		// reviewCompany.setAvgScoreTotal("" + new BigDecimal(scoreTotal / 2.0).setScale(0, BigDecimal.ROUND_HALF_UP));
		//
		// // System.out.println(count + "--->" + scoreTotal);
		// // if (count == 0) {
		// // reviewCompany.setAvgScoreTotal("0");
		// // } else {
		// // reviewCompany.setAvgScoreTotal("" + (scoreTotal / count));
		// // }
		// }
		return mp;
	}

	public boolean hasCompanyUid(String companyUid) {
		boolean b = false;
		ArrayList resultRecs = getReviewPaperResults();
		for (int i = 0; i < resultRecs.size(); i++) {
			ReviewPaperResult r = (ReviewPaperResult) resultRecs.get(i);
			if (r.getCompanyUid().equals(companyUid)) {
				b = true;
				break;
			}
		}
		return b;
	}

	public boolean hasPaperReviewerUid(String reviewerUid) {
		boolean b = false;
		ArrayList resultRecs = getReviewPaperResults();
		for (int i = 0; i < resultRecs.size(); i++) {
			ReviewPaperResult r = (ReviewPaperResult) resultRecs.get(i);
			if (!r.getType().equals(ReviewPaper.TYPE_PAPERREVIEW))
				continue;
			if (r.getReviewerUid().equals(reviewerUid)) {
				b = true;
				break;
			}
		}
		return b;
	}

	public boolean hasMeetingReviewerUid(String reviewerUid) {
		boolean b = false;
		ArrayList resultRecs = getReviewPaperResults();
		for (int i = 0; i < resultRecs.size(); i++) {
			ReviewPaperResult r = (ReviewPaperResult) resultRecs.get(i);
			if (!r.getType().equals(ReviewPaper.TYPE_MEETINGREVIEW))
				continue;
			if (r.getReviewerUid().equals(reviewerUid)) {
				b = true;
				break;
			}
		}
		return b;
	}

	public boolean hasCombination(String type, String reviewerUid, String companyUid) {
		boolean b = false;
		ArrayList resultRecs = getReviewPaperResults();
		for (int i = 0; i < resultRecs.size(); i++) {
			ReviewPaperResult r = (ReviewPaperResult) resultRecs.get(i);
			if (r.getType().equals(type) //
					&& r.getReviewerUid().equals(reviewerUid)//
					&& r.getCompanyUid().equals(companyUid)) {
				b = true;
				break;
			}
		}
		return b;
	}

	public static void main(String[] args) {

	}

}
