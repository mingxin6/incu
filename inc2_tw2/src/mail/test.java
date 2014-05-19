package mail;

public class test {

	public void send() {
		String smtp = "smtp.163.com";

		String from = "18651802394@163.com";// 发信人

		// String to = "18651802394@163.com";// 收件人
		// String copyto = "18651802394@163.com";// 抄送人

		String to = "hjmu2007@gmail.com";// 收件人
		String copyto = "henrymu@iii.org.tw";// 抄送人

		String subject = "邮件主题";
		String content = "邮件内容";

		String username = "18651802394@163.com";// 账户
		String password = "qxf18651802394";// 密码
		// String filename = "c:/xx.txt";
		String filename = "";
		Mail.sendAndCc(smtp, from, to, copyto, subject, content, username,
				password, filename);
	}

	public static void main(String[] args) {
		test o = new test();
		o.send();
	}
}
