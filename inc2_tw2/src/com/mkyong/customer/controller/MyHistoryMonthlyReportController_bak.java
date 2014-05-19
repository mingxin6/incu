package com.mkyong.customer.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.db.MySQLAccess;
import com.model.MonthlyReport;
import com.model.User;
import com.utils.DateUtil;
import com.utils.KeyMaker;
import com.vo.MMM;
import com.vo.VOMonthlyReportCondition;

public class MyHistoryMonthlyReportController_bak extends SimpleFormController {

	public MyHistoryMonthlyReportController_bak() {
		setCommandClass(MMM.class);
		setCommandName("mmm");
		// setSessionForm(true);

	}

	@Override
	protected ModelAndView onSubmit(HttpServletRequest request, HttpServletResponse response, Object command,
			BindException errors) throws Exception {
		HttpSession session = request.getSession(false);
		System.out.println("command.getClass().getName()--->" + command.getClass().getName());

		User user = (User) session.getAttribute("user");

		MMM mmm = (MMM) command;
		System.out.println("mmm.dotype=" + mmm.dotype);

		if (mmm.dotype.equals("save")) {
			// -----------------------------------------------------------------------------
			// 储存提交的资料...
			TreeMap monthlyreportlist = mmm.getMonthlyreportlist();
			Iterator it = monthlyreportlist.keySet().iterator();

			MySQLAccess o = new MySQLAccess();
			while (it.hasNext()) {
				String k = (String) it.next();
				MonthlyReport mrpt = (MonthlyReport) monthlyreportlist.get(k);

				try {
					if (!mrpt.uid.equals("")) {
						
						o.updateMonthlyReport(mrpt);// update if exist
						
					} else {
						mrpt.uid = KeyMaker.newKey();
//						mrpt.compName = user.userComp;
						mrpt.yearMonth = k;

//						File f = new File("d:/temp/output.txt");
//						FileUtils.writeStringToFile(f, mrpt.compName + mrpt.yearMonth+System.getProperty("line.separator"), "UTF-8", true);
						

						String[] ym = k.split("/");
						mrpt.year = ym[0];
						mrpt.month = ym[1];
						o.insertMonthlyReport(mrpt);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} else {// filter
			// -----------------------------------------------------------------------------
			// 依据过滤条件重抓资料

			VOMonthlyReportCondition voMonthlyReportCondition = (VOMonthlyReportCondition) mmm
					.getVoMonthlyReportCondition();

			TreeMap mp = new TreeMap();
			MySQLAccess o = new MySQLAccess();
			try {
//				mp = o.readHistoryMonthlyReports(user.compid, voMonthlyReportCondition);
				mmm.setMonthlyreportlist(mp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// -----------------------------------------------------------------------------

		//
		request.setAttribute("years", SelectYearMonth.getYears());
		request.setAttribute("months", SelectYearMonth.getMonths());

		// request.setAttribute("mmm", mmm);
		//
		session.setAttribute("mmm", mmm);
		//
		return new ModelAndView("myHistoryMonthlyReportForm", "mmm", mmm);

	}

	@Override
	protected Object formBackingObject(HttpServletRequest request) throws Exception {
		

		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		MMM mmm = (MMM) session.getAttribute("mmm");

		if (mmm == null) {
			mmm = new MMM();
			// }

			VOMonthlyReportCondition voMonthlyReportCondition = mmm.getVoMonthlyReportCondition();
			if (voMonthlyReportCondition == null) {
				DateUtil x = new DateUtil();
				voMonthlyReportCondition = x.getInitMonthlyReportCondition();
				mmm.setVoMonthlyReportCondition(voMonthlyReportCondition);
			}

			TreeMap mp = new TreeMap();
			MySQLAccess o = new MySQLAccess();
			try {
//				mp = o.readHistoryMonthlyReports(user.compid, voMonthlyReportCondition);
				mmm.setMonthlyreportlist(mp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//mmm = new MMM();
		return mmm;
	}

	@Override
	protected Map referenceData(HttpServletRequest request) throws Exception {
		System.out.println("referenceData--------!!!!!!");

		Map referenceData = new HashMap();

		referenceData.put("years", SelectYearMonth.getYears());
		referenceData.put("months", SelectYearMonth.getMonths());
		// -------------------------------------------------------------
		// ArrayList ar = new ArrayList();
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		// VOMonthlyReportCondition voMonthlyReportCondition = (VOMonthlyReportCondition) session
		// .getAttribute("voMonthlyReportCondition");
		MMM mmm = (MMM) session.getAttribute("mmm");

		if (mmm == null) {
			mmm = new MMM();
		}

		VOMonthlyReportCondition voMonthlyReportCondition = mmm.getVoMonthlyReportCondition();
		if (voMonthlyReportCondition == null) {
			// voMonthlyReportCondition = new VOMonthlyReportCondition();
			DateUtil x = new DateUtil();
			voMonthlyReportCondition = x.getInitMonthlyReportCondition();
			mmm.setVoMonthlyReportCondition(voMonthlyReportCondition);
		}

		TreeMap mp = new TreeMap();
		MySQLAccess o = new MySQLAccess();
		try {
//			mp = o.readHistoryMonthlyReports(user.compid, voMonthlyReportCondition);
			mmm.setMonthlyreportlist(mp);
		} catch (Exception e) {
			e.printStackTrace();
		}

		referenceData.put("mmm", mmm);
		referenceData.put("monthlyreportlist", mp);

		return referenceData;
	}
}