package com.mod.tag.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.db.DbWhere;
import com.db.MySQLAccessMyBatis;
import com.model.Tag;
import com.model.TagRec;
import com.model.User;
import com.utils.KeyMaker;

public class MySQLAccessTag {

	public ArrayList findTagsByUid(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList ar = (ArrayList) o.findTagsByUid(u.getUid());
		o.closeSession();
		return ar;
	}

	public ArrayList findTagsStringArrayByUid(HttpServletRequest request) {
		ArrayList tagNames = new ArrayList();
		ArrayList a = findTagsByUid(request);
		for (int i = 0; i < a.size(); i++) {
			Tag tag = (Tag) a.get(i);
			tagNames.add(tag.getTagName());
		}
		return tagNames;
	}

	public void insertTag(String[] tags, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		deleteTagByUid(request);

		String[] myTags = request.getParameterValues("myTag");
		for (int i = 0; i < myTags.length; i++) {
			// System.out.println(myTags[i]);
			if (myTags[i].trim().equals(""))
				continue;
			Tag tag = new Tag();
			tag.setTagUid("tag" + KeyMaker.newKey());
			tag.setUserUid(u.getUid());
			tag.setTagName(myTags[i]);
			o.insertTags(tag);
		}
		o.closeSession();
	}

	public void deleteTagByUid(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession(false);
		User u = (User) session.getAttribute("user");

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		o.deleteTagByUid(u.getUid());

		o.closeSession();
	}
	
	//********************************************************************************
	
	public List findTalkNoteTagRecsByWhereString(DbWhere where) {
		List recs=null;
		return recs;
	}

	public int insertTagRecs(TagRec tagRec) {
		int n=0;
		return n;
	}

	public int deleteTagRecsByUid(TagRec userUid) {
		int n=0;
		return n;
	}

}
