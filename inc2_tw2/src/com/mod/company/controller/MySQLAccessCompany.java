package com.mod.company.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import com.db.DbWhere;
import com.db.MySQLAccessMyBatis;
import com.model.Company;
import com.model.Staff;
import com.vo.VOCompListCondition;

public class MySQLAccessCompany {

	public void insertCompany(Company comp) throws SQLException {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		String maxCompCustomId = o.findCompanyMaxCustomId();
		String numberPart = maxCompCustomId.substring(3);
		System.out.println("numberPartnumberPart=" + numberPart);
		int nsiNumber = Integer.parseInt(numberPart) + 1;
		String newNSI = "NSI" + nsiNumber;
		comp.setCustomId(newNSI);

		String amid = comp.getAmId();
		Staff AM = o.findStaffById(amid);
		String pmid = comp.getPmId();
		Staff PM = o.findStaffById(pmid);
		// comp.setAmId(AM.getUid());
		comp.setAmName(AM.getName());
		// comp.setPmId(PM.getUid());
		comp.setPmName(PM.getName());

		o.insertCompany(comp);
		o.closeSession();
	}

	// public void insertCompanyDenied(Company comp) throws SQLException {
	// MySQLAccessMyBatis o = new MySQLAccessMyBatis();
	// o.openSession();
	// o.insertCompanyDenied(comp);
	// o.closeSession();
	// }

	public ArrayList readCompList(VOCompListCondition compListCondition) {
		VOCompListCondition c = new VOCompListCondition();
		c.setCompName(compListCondition.getCompName());
		c.setCompStatus(compListCondition.getCompStatus());
		if (!c.getCompName().trim().equals("")) {
			String s = "%" + c.getCompName() + "%";
			c.setCompName(s);
		}

		StringBuffer sb = new StringBuffer();
		sb.append(" 1=1 ");
		if (!c.getCompName().equals("")) {
			sb.append(" AND CompanyName like '" + c.getCompName() + "'");
		}
		if (!c.getCompStatus().equals("")&&!c.getCompStatus().equals("NONE")) {
			sb.append(" AND CompanyStatus = '" + c.getCompStatus() + "'");
		} else {
			sb.append(" AND CompanyStatus = '" + Company.STATUS_MOVEIN + "'");
		}
		sb.append(" order by customId desc ");

		DbWhere d = new DbWhere();
		d.setWhere(sb.toString());

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		ArrayList recs = (ArrayList) o.findCompanyByWhereString(d);
		// ArrayList recs = (ArrayList) o.findAllCompanysByCondition(c);
		for (int i = 0; i < recs.size(); i++) {
			Company rec = (Company) recs.get(i);

			rec.setAwardRecs(o.findAwardsByCompId(rec.uid));
			rec.setGrantRecs(o.findGrantsByCompId(rec.uid));
			rec.setIpRecs(o.findIPsByCompId(rec.uid));

			// 輔導紀錄
			rec.recCount = o.findVisitCount(rec.uid); // talkNotes count
		}
		o.closeSession();
		return recs;
	}

	public ArrayList findMovinCompany() {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		StringBuffer sb = new StringBuffer();
		sb.append(" companyStatus='" + Company.STATUS_MOVEIN + "'");

		DbWhere d = new DbWhere();
		d.setWhere(sb.toString());

		ArrayList recs = (ArrayList) o.findCompanyByWhereString(d);
		o.closeSession();
		return recs;
	}

	public Company findCompanyByCompName(String compName) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		Company comp = o.findCompanyByCompName(compName);//
		o.closeSession();
		return comp;
	}

	public int updateCompStatus(String compId, String status) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();
		int n = o.updateCompStatus(compId, status);//
		o.closeSession();
		return n;
	}

}
