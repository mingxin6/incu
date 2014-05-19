package z;

public class CurrencyDenom {
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
			String s = getStatusCode();
			return s;
		}

	}

	public static void main(String[] args) {

		System.out.println(UserStatus.values().length);
		//String[] aaa=UserStatus.values();
		
		System.out.println(UserStatus.PENDING);

		String s = "P";
//String s2=UserStatus.PENDING.toString();
		System.out.println(s.equals(UserStatus.PENDING+""));
	}
}
