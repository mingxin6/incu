package z;

import java.util.ArrayList;
import java.util.TreeSet;

import com.db.MySQLAccessMyBatis;

public class Person {
	String personUid = "";
	String personName = "";
	ArrayList<Org> orgs = new ArrayList();

	public TreeSet getPersonUidSet(MySQLAccessMyBatis o) {
		// One person can belong to many orgs
		ArrayList orgPersons = (ArrayList) o
				.findOrgPersonByPersonUid(personUid);
		for (int i = 0; i < orgPersons.size(); i++) {
			OrgPerson orgPerson = (OrgPerson) orgPersons.get(i);
			Org org = o.findOrgByUid(orgPerson.getOrgUid());
			getOrgs().add(org);
			if (!orgPerson.isLeader())
				continue;
			org.load(o);
		}

		{
			// print
			System.out.println(getPersonUid() + "," + getPersonName()
					+ ", belong to " + getOrgs().size() + " orgs");
			ArrayList orgs = getOrgs();
			for (int i = 0; i < orgs.size(); i++) {
				System.out.println("==================================");
				Org org = (Org) orgs.get(i);
				org.prn();
			}
		}

		TreeSet set = new TreeSet();
		{
			// HashSet set = new HashSet();
			set.add(getPersonUid());
			ArrayList orgs = getOrgs();
			for (int i = 0; i < orgs.size(); i++) {
				System.out.println("==================================");
				Org org = (Org) orgs.get(i);
				org.getPersonUidSet(set);
			}
			
		}

		return set;
	}

	public String getPersonUid() {
		return personUid;
	}

	public void setPersonUid(String personUid) {
		this.personUid = personUid;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	public ArrayList<Org> getOrgs() {
		return orgs;
	}

	public void setOrgs(ArrayList<Org> subOrgs) {
		this.orgs = subOrgs;
	}

	public void prn() {
		System.out.println("Person [orgs.size=" + orgs.size() + ", personName="
				+ personName + ", personUid=" + personUid + "]");
	}

	public static void main(String[] args) {

	}

}
