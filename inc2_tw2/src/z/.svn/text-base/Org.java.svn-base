package z;

import java.util.ArrayList;
import java.util.TreeSet;

import com.db.MySQLAccessMyBatis;

public class Org {

	String orgUid = "";
	String orgName = "";
	String parantOrgUid = "";
	String orgHeadPersonUid = "";
	ArrayList<Person> persons = new ArrayList();
	ArrayList<Org> subOrgs = new ArrayList();

	public void load(MySQLAccessMyBatis o) {
		ArrayList orgPersons = (ArrayList) o.findOrgPersonByOrgUid(orgUid);
		for (int i = 0; i < orgPersons.size(); i++) {
			OrgPerson orgPerson = (OrgPerson) orgPersons.get(i);
			Person p = o.findPersonByUid(orgPerson.getPersonUid());
			if (orgPerson.isLeader()) {
				orgHeadPersonUid = orgPerson.getPersonUid();
			}
			persons.add(p);
		}

		subOrgs = (ArrayList) o.findOrgsByParantUid(orgUid);
		if (subOrgs.size() == 0)
			return;

		for (int i = 0; i < subOrgs.size(); i++) {
			Org subOrg = (Org) subOrgs.get(i);
			subOrg.load(o);
			// System.out.println(subOrg.toString());
		}
	}

	public String getOrgHeadPersonUid() {
		return orgHeadPersonUid;
	}

	public void setOrgHeadPersonUid(String orgHeadPersonUid) {
		this.orgHeadPersonUid = orgHeadPersonUid;
	}

	public ArrayList<Person> getPersons() {
		return persons;
	}

	public void setPersons(ArrayList<Person> persons) {
		this.persons = persons;
	}

	public String getOrgUid() {
		return orgUid;
	}

	public void setOrgUid(String orgUid) {
		this.orgUid = orgUid;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getParantOrgUid() {
		return parantOrgUid;
	}

	public void setParantOrgUid(String parantOrgUid) {
		this.parantOrgUid = parantOrgUid;
	}

	public void getPersonUidSet(TreeSet set) {
		ArrayList ps = getPersons();
		for (int i = 0; i < ps.size(); i++) {
			Person p = (Person) ps.get(i);
			set.add(p.getPersonUid());
		}
		ArrayList orgs = getSubOrgs();
		for (int i = 0; i < orgs.size(); i++) {
			Org org = (Org) orgs.get(i);
			org.getPersonUidSet(set);
		}
	}

	public void prn() {
		System.out.println("Org [ orgName=" + orgName + ", orgUid=" + orgUid
				+ ", parantOrgUid=" + parantOrgUid + ", persons.size="
				+ persons.size() + ", subOrgs.size=" + subOrgs.size() + "]"
				+ ", orgHeadPersonUid=" + orgHeadPersonUid);

		ArrayList ps = getPersons();
		for (int i = 0; i < ps.size(); i++) {
			Person p = (Person) ps.get(i);
			p.prn();
		}
		System.out.println("---------------------------------");
		ArrayList orgs = getSubOrgs();
		for (int i = 0; i < orgs.size(); i++) {
			Org org = (Org) orgs.get(i);
			org.prn();
		}
	}

	public ArrayList<Org> getSubOrgs() {
		return subOrgs;
	}

	public void setSubOrgs(ArrayList<Org> subOrgs) {
		this.subOrgs = subOrgs;
	}

	public static void main(String[] args) {

	}

}
