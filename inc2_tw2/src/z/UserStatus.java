package z;
public enum UserStatus {
	PENDING("P"), ACTIVE("A"), INACTIVE("I"), DELETED("D");
 
	private String statusCode;
 
	private UserStatus(String s) {
		statusCode = s;
	}
 
	public String getStatusCode() {
		return statusCode;
	}
 
	@Override
	public String toString() {
		String s=getStatusCode();
		return s;
	}
	
	public static void main(String[] args) {
		 
		System.out.println(UserStatus.ACTIVE.getStatusCode());
		System.out.println(UserStatus.DELETED);
 
	}
}