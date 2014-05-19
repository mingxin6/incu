package com.mod.reviewPaper.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import com.mod.company.controller.MySQLAccessCompany;
import com.mod.companyB0.controller.MySQLAccessCompany_B0;
import com.mod.notify.controller.MySQLAccessNotify;
import com.model.Company;
import com.model.Notify;
import com.model.Notifyee;
import com.model.ReviewPaper;
import com.utils.KeyMaker;

public class ReviewPaperCloseController extends SimpleFormController {
	public ReviewPaperCloseController() {
		setCommandClass(Notify.class);
		setCommandName("notify");
	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		Notify notify = (Notify) command;

		// 通知企業審查結果
		Notify notify2 = new Notify();
		notify2.setNotifyUid("notify" + KeyMaker.newKey());
		notify2.setReferenceUid(notify.getReferenceUid());
		notify2.setSubject(notify.getSubject());
		notify2.setContent(notify.getContent());

		ArrayList<Notifyee> notifyees = notify.getNotifyees();
		ArrayList<Notifyee> notifyees2s = notify2.getNotifyees();
		for (int i = 0; i < notifyees.size(); i++) {
			Notifyee notifyee = (Notifyee) notifyees.get(i);
			Notifyee notifyee2 = new Notifyee();
			notifyee2.setNotifyeeUid("notifyee" + KeyMaker.newKey());
			notifyee2.setNotifyUid(notify2.getNotifyUid());
			notifyee2.setEmail(notifyee.getEmail());
			notifyee2.setName(notifyee.getName());
			notifyees2s.add(notifyee2);
		}

		String reviewPaperUid = notify2.getReferenceUid();

		// save......
		MySQLAccessNotify oo=new MySQLAccessNotify();
		oo.insertNotifyAndNotifyees(notify2);

		// 改變審查案狀態
		MySQLAccessReviewPaper o = new MySQLAccessReviewPaper();
		o.updateReviewPaperStatus(reviewPaperUid, ReviewPaper.STAT_CLOSE);
		// -----------------------------------------------------------------

		// 改變每家企業的狀態....並儲存審查案唯一代碼
		MySQLAccessCompany_B0 o2 = new MySQLAccessCompany_B0();

		ReviewPaper reviewPaper = new MySQLAccessReviewPaper().findReviewPaperByReviewPaperUid(reviewPaperUid);
		// 由以下方法可取得所有企業的分數與結果 (from ReviewCompany)
		HashMap<ReviewCompany, HashMap<String, TypeReviewGroup>> mp = reviewPaper.getMp();
		Iterator it = mp.keySet().iterator();
		while (it.hasNext()) {// loop 審查案中的企業
			ReviewCompany rc = (ReviewCompany) it.next();
			String compId = rc.getCompUid();
			String status = rc.getFinalPass();

			// 審查案唯一代碼 reviewPaperUid

			o2.updateCompStatusB0nSaveReviewPaperUid(compId, status, reviewPaperUid);
		}

		return new ModelAndView(new RedirectView("reviewPaperView.htm?reviewPaperUid=" + reviewPaperUid));
	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		String reviewPaperUid = request.getParameter("reviewPaperUid");
		ReviewPaper reviewPaper = new MySQLAccessReviewPaper().findReviewPaperByReviewPaperUid(reviewPaperUid);
		reviewPaper.setStatusRS(request);

		// 由以下方法可取得所有企業的分數與結果 (from ReviewCompany)
		// HashMap<ReviewCompany, HashMap<String, ReviewGroup>> mp=reviewPaper.getMp();

		ArrayList<String> compIds = reviewPaper.getCompanyIds();

		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.hj", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		
		Notify notify = new Notify();
		notify.setReferenceUid(reviewPaperUid);
		notify.setSubject(resource.getString("notify.close.subject"));//申請進駐審查結案通知
		notify.setContent(resource.getString("notify.close.content"));//貴公司的進駐申請已審查結束, 請聯繫承辦人.謝謝.

		ArrayList<Notifyee> notifyees = notify.getNotifyees();

		MySQLAccessCompany_B0 z = new MySQLAccessCompany_B0();
		for (int i = 0; i < compIds.size(); i++) {
			String compId = (String) compIds.get(i);

			Company comp = z.findNewApply(compId);
			comp.setCompStatusRS(request);
			Notifyee notifyee = new Notifyee();
			notifyee.setEmail(comp.getAdminContactEmail());
			notifyee.setName(comp.getCompName());
			notifyees.add(notifyee);
		}

		return notify;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		Map referenceData = new HashMap();
		// referenceData.put("comp", acceptedCompanies);
		return referenceData;
	}
}