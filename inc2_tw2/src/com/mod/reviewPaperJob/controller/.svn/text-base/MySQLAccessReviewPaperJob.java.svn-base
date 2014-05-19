package com.mod.reviewPaperJob.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.db.DbWhere;
import com.db.MySQLAccessMyBatis;
import com.mod.reviewer.controller.MySQLAccessReviewer;
import com.model.ActivityRec;
import com.model.Company;
import com.model.ReviewPaper;
import com.model.ReviewPaperResult;
import com.utils.FileUpDownLoadUtil;
import com.utils.KeyMaker;
import com.utils.UserUtil;
import com.vo.VOFile;

public class MySQLAccessReviewPaperJob extends MySQLAccessReviewer {

	public ArrayList findReviewPaperJobs(String reviewerUid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		DbWhere d = new DbWhere();
		d.setWhere(" reviewerUid= '" + reviewerUid + "' order by createdTime");
		ArrayList lines = (ArrayList) o.findReviewPaperResultsByWhereString(d);

		for (int i = 0; i < lines.size(); i++) {
			ReviewPaperResult reviewPaperResult = (ReviewPaperResult) lines.get(i);
			String reviewPaperUid = reviewPaperResult.getReviewPaperUid();

			// System.out.println("reviewPaperUid..." +reviewPaperUid);

			ReviewPaper reviewPaper = new ReviewPaper();
			DbWhere d2 = new DbWhere();
			d2.setWhere(" reviewPaperUid='" + reviewPaperUid + "'");
			ArrayList recs = (ArrayList) o.findReviewPapersByWhereString(d2);
			if (recs.size() != 0) {
				reviewPaper = (ReviewPaper) recs.get(0);

				// System.out.println("reviewPaper... ... date="+reviewPaper.getThedate()+",id="+reviewPaper.getReviewPaperUid());

			}
			reviewPaperResult.setReviewPaper(reviewPaper);
		}

		o.closeSession();
		return lines;
	}

	public ReviewPaperResult findReviewPaperJob(String reviewPaperResultUid) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		DbWhere d = new DbWhere();
		d.setWhere(" reviewPaperResultUid= '" + reviewPaperResultUid + "'");
		ArrayList lines = (ArrayList) o.findReviewPaperResultsByWhereString(d);

		if (lines.size() == 0) {
			return new ReviewPaperResult();
		}

		for (int i = 0; i < lines.size(); i++) {
			ReviewPaperResult reviewPaperResult = (ReviewPaperResult) lines.get(i);
			String reviewPaperUid = reviewPaperResult.getReviewPaperUid();

			// System.out.println("reviewPaperUid..." +reviewPaperUid);

			ReviewPaper reviewPaper = new ReviewPaper();
			DbWhere d2 = new DbWhere();
			d2.setWhere(" reviewPaperUid='" + reviewPaperUid + "'");
			ArrayList recs = (ArrayList) o.findReviewPapersByWhereString(d2);
			if (recs.size() != 0) {
				reviewPaper = (ReviewPaper) recs.get(0);

				// System.out.println("reviewPaper... ... date="+reviewPaper.getThedate()+",id="+reviewPaper.getReviewPaperUid());

			}
			reviewPaperResult.setReviewPaper(reviewPaper);
		}
		ReviewPaperResult r = (ReviewPaperResult) lines.get(0);

		// -----------------------------------------------------------------------------------------
		ArrayList fileInfo = (ArrayList) o.findUploadedFiles("" + r.getReviewPaperResultUid(), "");
		r.setFileInfo(fileInfo);

		o.closeSession();
		return r;
	}

	public void updateReviewPaperResult(ReviewPaperResult reviewPaperResult, HttpServletRequest request)
			throws Exception {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		o.updateReviewPaperResult(reviewPaperResult);

		// DELETE file info
		String[] deletedFiles = request.getParameterValues("deleteCheck");
		if (deletedFiles != null) {
			for (int i = 0; i < deletedFiles.length; i++) {
				o.deleteUploadedFileInfo(deletedFiles[i]);
			}
		}
		// UPLOAD file
		List files = reviewPaperResult.getFiles();
		ArrayList fileInfo = FileUpDownLoadUtil.upload(request, files);

		// SAVE file info
		for (int i = 0; i < fileInfo.size(); i++) {
			VOFile voFile = (VOFile) fileInfo.get(i);
			voFile.setUid(UUID.randomUUID().toString());
			voFile.setLinkedObjId(reviewPaperResult.getReviewPaperResultUid());
			o.insertUploadedFileInfo(voFile);
		}
		o.closeSession();
	}

	// public ReviewPaper findReviewPaperByReviewPaperUid(String reviewPaperUid) {
	// MySQLAccessMyBatis o = new MySQLAccessMyBatis();
	// o.openSession();
	// DbWhere d = new DbWhere();
	// d.setWhere(" reviewPaperUid='" + reviewPaperUid + "'");
	// ArrayList recs = (ArrayList) o.findReviewPapersByWhereString(d);
	// if (recs.size() == 0) {
	// return new ReviewPaper();
	// }
	//
	// ReviewPaper reviewPaper = (ReviewPaper) recs.get(0);
	//
	// d.setWhere(" reviewPaperUid='" + reviewPaperUid + "' order by companyUid");
	// ArrayList lines = (ArrayList) o.findReviewPaperResultsByWhereString(d);
	// reviewPaper.setReviewPaperResults(lines);
	// o.closeSession();
	// return reviewPaper;
	// }

	// public ArrayList findReviewPaperResultsByReviewPaperUid(String reviewPaperUid) {
	// MySQLAccessMyBatis o = new MySQLAccessMyBatis();
	// o.openSession();
	// DbWhere d = new DbWhere();
	// d.setWhere(" reviewPaperUid='" + reviewPaperUid + "'");
	// ArrayList recs = (ArrayList) o.findReviewPaperResultsByWhereString(d);
	// o.closeSession();
	// return recs;
	// }

	public static void main(String[] args) {

	}

}
