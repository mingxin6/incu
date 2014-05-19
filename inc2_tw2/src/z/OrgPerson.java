package z;

public class OrgPerson {

	String orgUid = "";
	String personUid = "";
	String isHead = "";

	public boolean isLeader() {
		if (isHead.trim().equals("Y"))
			return true;
		return false;
	}

	public String getOrgUid() {
		return orgUid;
	}

	public void setOrgUid(String orgUid) {
		this.orgUid = orgUid;
	}

	public String getPersonUid() {
		return personUid;
	}

	public void setPersonUid(String personUid) {
		this.personUid = personUid;
	}

	public String getIsHead() {
		return isHead;
	}

	public void setIsHead(String isHead) {
		this.isHead = isHead;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
