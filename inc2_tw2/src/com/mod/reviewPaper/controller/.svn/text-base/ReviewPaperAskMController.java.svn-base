package com.mod.reviewPaper.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;
import org.springframework.web.servlet.view.RedirectView;

import com.Const;
import com.db.MySQLAccess;
import com.mod.companyB0.controller.MySQLAccessCompany_B0;
import com.mod.notify.controller.MySQLAccessNotify;
import com.mod.reviewer.controller.MySQLAccessReviewer;
import com.model.Company;
import com.model.Notify;
import com.model.Notifyee;
import com.model.ReviewPaper;
import com.model.Reviewer;
import com.utils.FileUpDownLoadUtil;
import com.utils.FileUtil;
import com.utils.KeyMaker;
import com.utils.UserUtil;
import com.vo.VOFile;

/*
 * 發出會議審查通知
 */
public class ReviewPaperAskMController extends SimpleFormController {
	public ReviewPaperAskMController() {
		setCommandClass(Notify.class);
		setCommandName("notify");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Notify voNotify = (Notify) command;
		String reviewPaperUid = voNotify.getReferenceUid();// 審查案的 unique id

		// ---------------------------------------------------------------------
		MySQLAccessReviewPaper dbReviewPaper = new MySQLAccessReviewPaper();
		MySQLAccessReviewer dbReviewer = new MySQLAccessReviewer();
		MySQLAccess db = new MySQLAccess();
		MySQLAccessCompany_B0 dbCompB0 = new MySQLAccessCompany_B0();
		MySQLAccessNotify mySQLAccessNotify = new MySQLAccessNotify();
		// ---------------------------------------------------------------------

		ReviewPaper reviewPaper = dbReviewPaper.findReviewPaperByReviewPaperUid(reviewPaperUid);
		reviewPaper.setStatusRS(request);
		ArrayList<String> reviewerIds = reviewPaper.getReviewerIds(ReviewPaper.TYPE_MEETINGREVIEW);// 每位審查委員
		ArrayList<String> compIds = reviewPaper.getCompanyIds();// 每家企業

		// -------------------------------------------------------------------
		
		
		Notify notify = new Notify();
		notify.setNotifyUid("notify" + KeyMaker.newKey());
		notify.setReferenceUid(voNotify.getReferenceUid());// 審查案的 unique id
		notify.setSubject(voNotify.getSubject());// 主旨
		notify.setContent(voNotify.getContent());// 內容
		notify.markCreatinfo(request);

		for (int m = 0; m < compIds.size(); m++) {// 審查案的每家公司
			String compId = (String) compIds.get(m);
			Company comp = dbCompB0.readCompanyB0ByUniqueID(compId);
			comp.setCompStatusRS(request);
			System.out.println(comp == null ? "xxxxx Comp is null, compId=" + compId
					: "-----------------------------comp is not null");

			ArrayList<VOFile> attach = comp.getVOFiles();// 所有受審查的文件

			FileUtil fileUtil = new FileUtil();
			String tempDir = FileUpDownLoadUtil.DOWNLOADDIR + "/" + KeyMaker.newKey();
			File sendDir = fileUtil.makeDir(tempDir);// 建立外送目錄
			// 將文件搬到外送目錄
			for (int i = 0; i < attach.size(); i++) {//
				VOFile voFile = (VOFile) attach.get(i);
				try {
					File source = new File(FileUpDownLoadUtil.UPLOADDIR + "/" + voFile.getModifiedFileName());
					File dest = new File(sendDir.getAbsolutePath() + "/" + voFile.getOriginalFileName());
					fileUtil.copyFile(source, dest);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			for (int i = 0; i < reviewerIds.size(); i++) {// /審查案的每位審查委員
				String reviewerId = (String) reviewerIds.get(i);
				Reviewer rvr = dbReviewer.findReviewerById(reviewerId);

				Notifyee notifyee = new Notifyee();
				notifyee.setNotifyeeUid("notifyee" + KeyMaker.newKey());

				
				notifyee
				.setSubject(notify.getSubject() + "(" + reviewPaper.getTitle() + "_" + comp.getCompName() + ")");
				
				
				notifyee.setContent(notify.getContent());
				notifyee.setNotifyUid(notify.getNotifyUid());
				notifyee.setEmail(rvr.getEmail());
				notifyee.setName(rvr.getName());
				notifyee.setCompName(comp.getCompName());
				notifyee.setAttachDir(tempDir);
				notifyee.setStatus(Notify.STATUS_NEW);

				notify.getNotifyees().add(notifyee);
			}
		}

		// save......
		mySQLAccessNotify.insertNotifyAndNotifyees(notify);

		return new ModelAndView(new RedirectView("reviewPaperView.htm?reviewPaperUid=" + reviewPaperUid));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String reviewPaperUid = request.getParameter("reviewPaperUid");
		MySQLAccessReviewPaper rpSQL = new MySQLAccessReviewPaper();
		ReviewPaper reviewPaper = rpSQL.findReviewPaperByReviewPaperUid(reviewPaperUid);
		reviewPaper.setStatusRS(request);
		ArrayList<String> reviewerIds = reviewPaper.getReviewerIds(ReviewPaper.TYPE_MEETINGREVIEW);

		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.hj", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		
		// String key = "notify" + KeyMaker.newKey();
		Notify notify = new Notify();
		// notify.setNotifyUid(key);
		notify.setReferenceUid(reviewPaperUid);
		notify.setSubject(resource.getString("notify.review.paper.subject"));//"審查會議通知"
		notify.setContent(resource.getString("notify.review.paper.content"));//"審查會議通知"

		ArrayList<Notifyee> notifyees = notify.getNotifyees();
		MySQLAccessReviewer z = new MySQLAccessReviewer();
		for (int i = 0; i < reviewerIds.size(); i++) {
			String reviewerId = (String) reviewerIds.get(i);
			Reviewer rvr = z.findReviewerById(reviewerId);
			Notifyee notifyee = new Notifyee();
			// notifyee.setNotifyeeUid("notifyee" + KeyMaker.newKey());
			// notifyee.setNotifyUid(key);
			notifyee.setEmail(rvr.getEmail());
			notifyee.setName(rvr.getName());
			notifyees.add(notifyee);
		}

		MySQLAccessNotify mySQLAccessNotify = new MySQLAccessNotify();
		ArrayList<Notify> oldNotifys = mySQLAccessNotify.findNotifyByWhereString(reviewPaperUid);
		request.setAttribute("oldNotifys", oldNotifys);

		return notify;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// referenceData.put("comp", acceptedCompanies);
		return referenceData;
	}
}