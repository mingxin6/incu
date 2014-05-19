package com.mod.talkNote.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

import com.mkyong.customer.controller.SelectMonth;
import com.mkyong.customer.controller.SelectYear;
import com.mod.staff.controller.MySQLAccessStaff;
import com.mod.tag.controller.MySQLAccessTag;
import com.model.Staff;
import com.model.TalkNotes;
import com.model.User;
import com.vo.VOTalkNotesSearchCondition;

// ALL 輔導記錄
public class TalkNotesListController extends TalkNotesList {

	public TalkNotesListController() {
		super("TalkNotesListController","talkNotesList");
	}

	VOTalkNotesSearchCondition xxx(HttpServletRequest request, String condObjName) {
		HttpSession session = request.getSession(false);
		VOTalkNotesSearchCondition c = (VOTalkNotesSearchCondition) session.getAttribute(condObjName);
		User u = (User) session.getAttribute("user");

		MySQLAccessStaff dbStaff = new MySQLAccessStaff();
		Staff staff = dbStaff.findStaffById(u.getUid());
		String userIdList = staff.getCoveredUsersForDBQuery();

		if (c == null) {
			c = new VOTalkNotesSearchCondition();
			c.setType("");
			if (!staff.isCanSeeAll() && !staff.isCannotSeeAll()) {// 沒有設定-->只看登入者自己的
				c.setConsultantId(u.getUid());
				c.setUserIdList("");
			} else if (staff.isCannotSeeAll()) {// 可看部分
				c.setConsultantId("");
				c.setUserIdList("'" + u.getUid() + "'" + "," + userIdList);
			} else if (staff.isCannotSeeAll()) {// 可看全部
				c.setConsultantId("");
				c.setUserIdList("");
			}
		}

		return c;
	}
}