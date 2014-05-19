package com.mod.reviewPaper.controller;

import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;

import com.db.DbWhere;
import com.db.MySQLAccessMyBatis;
import com.mod.reviewer.controller.MySQLAccessReviewer;
import com.model.Company;
import com.model.ReviewPaper;
import com.model.ReviewPaperResult;
import com.utils.KeyMaker;
import com.utils.UserUtil;
import com.vo.VOReviewPaperSearchCondition;

public class MySQLAccessReviewPaper extends MySQLAccessReviewer {

	public ArrayList findReviewPapers(VOReviewPaperSearchCondition c) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		StringBuffer sb = new StringBuffer();
		sb.append(" 1=1 ");
		if (!c.getStatus().equals("")) {
			sb.append(" AND status='" + c.getStatus() + "'");
		}
		DbWhere d = new DbWhere();
		d.setWhere(sb.toString());
		ArrayList recs = (ArrayList) o.findReviewPapersByWhereString(d);
		o.closeSession();

		for (int i = 0; i < recs.size(); i++) {
			ReviewPaper reviewPaper = (ReviewPaper) recs.get(i);
			reviewPaper.setMp();
		}

		return recs;
	}

	// public ArrayList findUnfinishedReview() {
	// MySQLAccessMyBatis o = new MySQLAccessMyBatis();
	// o.openSession();
	// DbWhere d = new DbWhere();
	// d.setWhere(" status= '" + ReviewPaper.STAT_PROC + "'");
	// ArrayList recs = (ArrayList) o.findReviewPapersByWhereString(d);
	// o.closeSession();
	// return recs;
	// }

	public ArrayList findEntryWithCompanyId(String compId) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		DbWhere d = new DbWhere();
		String cond = "  companyUid ='" + compId + "' order by companyUid";
		System.out.println(cond);
		d.setWhere(cond);
		ArrayList lines = (ArrayList) o.findReviewPaperResultsByWhereString(d);

		o.closeSession();
		return lines;
	}

	public ReviewPaper findReviewPaperByReviewPaperUid(String reviewPaperUid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		DbWhere d = new DbWhere();
		d.setWhere(" reviewPaperUid='" + reviewPaperUid + "'");
		ArrayList recs = (ArrayList) o.findReviewPapersByWhereString(d);
		if (recs.size() == 0) {
			return new ReviewPaper();
		}
		ReviewPaper reviewPaper = (ReviewPaper) recs.get(0);

		// -----------------------------------------------------------------------------------------
		// 明細
		d.setWhere(" reviewPaperUid='" + reviewPaperUid + "' order by companyUid");
		ArrayList lines = (ArrayList) o.findReviewPaperResultsByWhereString(d);
		for (int i = 0; i < lines.size(); i++) {
			ReviewPaperResult r = (ReviewPaperResult) lines.get(i);
			ArrayList fileInfo = (ArrayList) o.findUploadedFiles("" + r.getReviewPaperResultUid(), "");
			r.setFileInfo(fileInfo);
		}

		// System.out.println("~~~~~~~nnnn lines size="+lines.size());
		// -----------------------------------------------------------------------------------------
		reviewPaper.setReviewPaperResults(lines);
		o.closeSession();

		reviewPaper.setMp();
		return reviewPaper;
	}

	// public int insertNotifyAndNotifyees(Notify notify) {
	// MySQLAccessMyBatis o = new MySQLAccessMyBatis();
	// o.openSession();
	// int n = o.insertNotify(notify);
	//
	// ArrayList<Notifyee> notifyees = notify.getNotifyees();
	// for (int i = 0; i < notifyees.size(); i++) {
	// Notifyee notifyee = (Notifyee) notifyees.get(i);
	// o.insertNotifyee(notifyee);
	// }
	// o.closeSession();
	// return n;
	// }
	//
	// public int insertNotifyee(Notifyee notifyee) {
	// MySQLAccessMyBatis o = new MySQLAccessMyBatis();
	// o.openSession();
	// int n = o.insertNotifyee(notifyee);
	// o.closeSession();
	// return n;
	// }

	public int insertReviewPaper(ReviewPaper reviewPaper, HttpServletRequest request, String[] compChecked,
			String[] p_reviewerChecked, String[] m_reviewerChecked) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		String reviewPaperUid = "rpaper" + KeyMaker.newKey();
		reviewPaper.setReviewPaperUid(reviewPaperUid);
		reviewPaper.setStatus(ReviewPaper.STAT_PROC);
		new UserUtil().markCreater(request, reviewPaper);
		new UserUtil().markLastModify(request, reviewPaper);
		int n = o.insertReviewPaper(reviewPaper);

		for (int i = 0; i < compChecked.length; i++) {
			String[] a1 = compChecked[i].split("_");
			String compid = a1[0];
			String companyName = a1[1];

			o.updateCompStatusB0(compid, Company.STATUS_REVIEW);

			for (int k = 0; k < p_reviewerChecked.length; k++) {
				String[] a2 = p_reviewerChecked[k].split("_");
				String rid = a2[0];
				String reviewerName = a2[1];

				ReviewPaperResult r = new ReviewPaperResult();
				r.setReviewPaperResultUid("rp" + KeyMaker.newKey());
				r.setType(ReviewPaper.TYPE_PAPERREVIEW);
				r.setReviewerUid(rid);
				r.setReviewerName(reviewerName);
				r.setCompanyUid(compid);
				r.setCompanyName(companyName);
				r.setReviewPaperUid(reviewPaperUid);
				new UserUtil().markCreater(request, r);
				new UserUtil().markLastModify(request, r);
				o.insertReviewPaperResult(r);
			}

			for (int k = 0; k < m_reviewerChecked.length; k++) {
				String[] a2 = m_reviewerChecked[k].split("_");
				String rid = a2[0];
				String reviewerName = a2[1];

				ReviewPaperResult r = new ReviewPaperResult();
				r.setReviewPaperResultUid("rp" + KeyMaker.newKey());
				r.setType(ReviewPaper.TYPE_MEETINGREVIEW);
				r.setReviewerUid(rid);
				r.setReviewerName(reviewerName);
				r.setCompanyUid(compid);
				r.setCompanyName(companyName);
				r.setReviewPaperUid(reviewPaperUid);
				new UserUtil().markCreater(request, r);
				new UserUtil().markLastModify(request, r);
				o.insertReviewPaperResult(r);
			}
		}

		o.closeSession();
		return n;
	}

	public int updateReviewPaper(ReviewPaper reviewPaper, HttpServletRequest request, String[] compChecked,
			String[] p_reviewerChecked, String[] m_reviewerChecked) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		String reviewPaperUid = reviewPaper.getReviewPaperUid();
		o.updateReviewPaper(reviewPaper);

		ReviewPaper review = new MySQLAccessReviewPaper().findReviewPaperByReviewPaperUid(reviewPaperUid);

		HashSet set = new HashSet();
		// 儲存新增加的審查記錄
		for (int i = 0; i < compChecked.length; i++) {
			String[] a1 = compChecked[i].split("_");
			String compid = a1[0];
			String companyName = a1[1];

			o.updateCompStatusB0(compid, Company.STATUS_REVIEW);

			for (int k = 0; k < p_reviewerChecked.length; k++) {
				String[] a2 = p_reviewerChecked[k].split("_");
				String rid = a2[0];
				String reviewerName = a2[1];

				set.add(ReviewPaper.TYPE_PAPERREVIEW + "_" + rid + "_" + compid);

				if (!review.hasCombination(ReviewPaper.TYPE_PAPERREVIEW, rid, compid)) {
					ReviewPaperResult r = new ReviewPaperResult();
					r.setReviewPaperResultUid("rp" + KeyMaker.newKey());
					r.setType(ReviewPaper.TYPE_PAPERREVIEW);
					r.setReviewerUid(rid);
					r.setReviewerName(reviewerName);
					r.setCompanyUid(compid);
					r.setCompanyName(companyName);
					r.setReviewPaperUid(reviewPaperUid);
					new UserUtil().markCreater(request, r);
					new UserUtil().markLastModify(request, r);
					o.insertReviewPaperResult(r);
				}
			}

			for (int k = 0; k < m_reviewerChecked.length; k++) {
				String[] a2 = m_reviewerChecked[k].split("_");
				String rid = a2[0];
				String reviewerName = a2[1];

				set.add(ReviewPaper.TYPE_MEETINGREVIEW + "_" + rid + "_" + compid);

				if (!review.hasCombination(ReviewPaper.TYPE_MEETINGREVIEW, rid, compid)) {
					ReviewPaperResult r = new ReviewPaperResult();
					r.setReviewPaperResultUid("rp" + KeyMaker.newKey());
					r.setType(ReviewPaper.TYPE_MEETINGREVIEW);
					r.setReviewerUid(rid);
					r.setReviewerName(reviewerName);
					r.setCompanyUid(compid);
					r.setCompanyName(companyName);
					r.setReviewPaperUid(reviewPaperUid);
					new UserUtil().markCreater(request, r);
					new UserUtil().markLastModify(request, r);
					o.insertReviewPaperResult(r);
				}
			}
		}

		// 刪除被移除的審查紀錄
		ArrayList resultRecs = review.getReviewPaperResults();
		for (int i = 0; i < resultRecs.size(); i++) {
			ReviewPaperResult r = (ReviewPaperResult) resultRecs.get(i);
			String reviewPaperResultUid = r.getReviewPaperResultUid();
			String t = r.getType();
			String cid = r.getCompanyUid();
			String rid = r.getReviewerUid();
			String key = t + "_" + rid + "_" + cid;
			if (!set.contains(key)) {
				o.deleteReviewPaperResult(reviewPaperResultUid);
				o.updateCompStatusB0(cid, Company.STATUS_RECEV);
			}
		}
		o.closeSession();
		return 0;
	}

	public int updateReviewPaperStatus(String reviewPaperUid, String status) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		int n = o.updateReviewPaperStatus(reviewPaperUid, status);
		o.closeSession();
		return n;
	}

	public void deleteReviewPaperAndAllResults(String reviewPaperUid) {
		ReviewPaper reviewPaper = findReviewPaperByReviewPaperUid(reviewPaperUid);

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		ArrayList<String> compIds = reviewPaper.getCompanyIds();
		for (int i = 0; i < compIds.size(); i++) {
			String compId = (String) compIds.get(i);
			o.updateCompStatusB0(compId, Company.STATUS_RECEV);
		}

		o.deleteReviewPaper(reviewPaperUid);
		o.deleteReviewPaperResultByReviewPaperUid(reviewPaperUid);

		o.closeSession();
	}

	// public ArrayList<Notify> findNotifyByWhereString(String reviewPaperUid) {
	// MySQLAccessMyBatis o = new MySQLAccessMyBatis();
	// o.openSession();
	//
	// DbWhere d = new DbWhere();
	// d.setWhere(" referenceUid='" + reviewPaperUid + "'");
	// ArrayList<Notify> recs = (ArrayList) o.findNotifyByWhereString(d);
	//
	// for (int i = 0; i < recs.size(); i++) {
	// Notify notify = recs.get(i);
	// String notifyUid = notify.getNotifyUid();
	//
	// DbWhere d2 = new DbWhere();
	// d2.setWhere(" notifyUid='" + notifyUid + "'");
	// ArrayList<Notifyee> notifyees = (ArrayList) o.findNotifyeeByWhereString(d2);
	// notify.setNotifyees(notifyees);
	// }
	// o.closeSession();
	// return recs;
	// }

	public static void main(String[] args) {

	}

}
