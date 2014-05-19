package z;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Random;

import org.apache.commons.lang.RandomStringUtils;

import com.db.DbWhere;
import com.db.MySQLAccessMyBatis;
import com.model.Company;
import com.utils.KeyMaker;

public class CompanyGenerator {

	public static HashMap citys = new HashMap();
	static {
		// citys.put("0", "");
		citys.put("1", "南和市");
		citys.put("2", "新丰市");
		citys.put("3", "上原市");
	}

	public static String generateRandomWord(int wordLength) {
		Random r = new Random(); // Intialize a Random Number Generator with SysTime as the seed
		StringBuilder sb = new StringBuilder(wordLength);
		for (int i = 0; i < wordLength; i++) { // For each letter in the word
			char tmp = (char) ('a' + r.nextInt('z' - 'a')); // Generate a letter between a and z
			sb.append(tmp); // Add it to the String
		}
		return toCamelCase(sb.toString());
	}

	public static String[] generateRandomWords(int numberOfWords) {
		String[] randomStrings = new String[numberOfWords];
		Random random = new Random();
		for (int i = 0; i < numberOfWords; i++) {
			char[] word = new char[random.nextInt(5) + 2]; // words of length 3 through 10. (1 and 2 letter words are
			// boring.)
			for (int j = 0; j < word.length; j++) {
				word[j] = (char) ('a' + random.nextInt(26));
			}
			randomStrings[i] = new String(word);

			randomStrings[i] = toProperCase(randomStrings[i]);
		}
		return randomStrings;
	}

	public static String toCamelCase(String s) {
		String[] parts = s.split("_");
		String camelCaseString = "";
		for (String part : parts) {
			camelCaseString = camelCaseString + toProperCase(part);
		}
		return camelCaseString;
	}

	public static String toProperCase(String s) {
		return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
	}

	public static String getaddr() {
		String cityindex = RandomStringUtils.random(1, 0, 3, true, true, "123".toCharArray());
		String city = (String) citys.get(cityindex);

		char[] aChars = new char[] { 'x', '中', '山', '大', '安', '高', 'x', '西', '新', '东', '文', 'x', '同', '霞', '楼', '古' };
		String zone = RandomStringUtils.random(2, 0, aChars.length, true, true, aChars);
		if (!zone.contains("x")) {
			zone = zone + "区";
		} else {
			zone = "";
		}

		aChars = new char[] { '长', '中', '二', '山', '创', '大', '育', '安', '高', '建', '国', '亭', '东', '西', '新', '东', '文', '北',
				'同', '霞', '楼', '古' };
		String rd = RandomStringUtils.random(2, 0, aChars.length, true, true, aChars);
		rd = rd + "路";

		aChars = new char[] { '0', '1', '0', '2', '0', '3', '0', '0', '4', '0', '5', '0', '6', '0', '7', '0', '8', '0',
				'9' };
		String no = RandomStringUtils.random(3, 0, aChars.length, true, true, aChars);
		int nn = Integer.parseInt(no);
		if (nn == 0) {
			aChars = new char[] { '1', '2', '3', '4', '5', '6', '7', '8', '9' };
			no = RandomStringUtils.random(2, 0, aChars.length, true, true, aChars);
			nn = Integer.parseInt(no);
		}
		no = nn + "号";

		aChars = new char[] { '0', '1', '0', '2', '0', '3', '0', '0', '4', '0', '5', '0', '6', '0', '7', '0', '8', '0',
				'9' };
		String floor = RandomStringUtils.random(1, 0, aChars.length, true, true, aChars);
		if (!floor.contains("0")) {
			floor = floor + "楼";
		} else {
			floor = "";
		}

		aChars = new char[] { '0', '1', '0', '2', '0', '3', '0', '0', '4', '0', '5', '0', '6', '0', '7', '0', '8', '0',
				'9' };
		String zh = RandomStringUtils.random(1, 0, aChars.length, true, true, aChars);
		if (!zh.contains("0") && !floor.equals("")) {
			zh = "之" + zh;
		} else {
			zh = "";
		}

		return city + zone + rd + no + floor + zh;
	}

	public static Company xxx(Company c, MySQLAccessMyBatis o) {

		// c.setCustomId(c.getUid());

		{
			c.setCompAddress(getaddr());
		}

		{
			if (c.getCompStatus().equals("STATUS_MOVEOUT")) {
				c.setMoveOutAddesss(getaddr());
			} else {
				c.setMoveOutAddesss("");
			}
		}

		{
			c.setCompEngName(CompanyGenerator.generateRandomWords(1)[0] + " "
					+ CompanyGenerator.generateRandomWords(1)[0] + "  Co., Ltd.");
		}
		{
			c.setCompWebURL("http://www." + CompanyGenerator.generateRandomWords(1)[0] + ".com");
		}
		{
			String e1 = RandomStringUtils.random(5, 0, 35, true, true, "abcdefghijklmnopqrstuvxyz1234567890"
					.toCharArray())
					+ "@test.com";
			c.setAdminContactEmail(e1);
		}
		{
			String e2 = RandomStringUtils.random(5, 0, 35, true, true, "abcdefghijklmnopqrstuvxyz1234567890"
					.toCharArray())
					+ "@test.com";
			c.setEmail(e2);
		}
		{
			String e2 = RandomStringUtils.random(8, 0, 9, true, true, "1234567890".toCharArray());
			c.setRegisterId(e2);
		}
		{
			String e2 = RandomStringUtils.random(3, 0, 4, true, true, "12345".toCharArray());
			String e = RandomStringUtils.random(4, 0, 9, true, true, "1234567890".toCharArray());
			c.setPhone("2" + e2 + "-" + e);
		}
		{
			String e2 = RandomStringUtils.random(3, 0, 4, true, true, "12345".toCharArray());
			String e = RandomStringUtils.random(4, 0, 9, true, true, "1234567890".toCharArray());
			c.setPhone("2" + e2 + "-" + e);
		}
		{
			String e2 = RandomStringUtils.random(4, 0, 10, true, true, "1234567890".toCharArray());
			c.setContractNumber("合约字第" + e2 + "字");
		}
		{
			c.setRemark("");
		}
		{
			String e2 = RandomStringUtils.random(2, 0, 4, true, true, "12345".toCharArray());
			String e = RandomStringUtils.random(3, 0, 9, true, true, "1234567890".toCharArray());
			String e3 = RandomStringUtils.random(3, 0, 9, true, true, "1234567890".toCharArray());
			c.setMobilePhone("09" + e2 + "-" + e + "-" + e3);
		}
		{
			String e2 = RandomStringUtils.random(3, 0, 4, true, true, "12345".toCharArray());
			String e = RandomStringUtils.random(4, 0, 9, true, true, "1234567890".toCharArray());
			c.setAdminContactPhone("2" + e2 + "-" + e);
		}
		{
			String e2 = RandomStringUtils.random(2, 0, 4, true, true, "12345".toCharArray());
			String e = RandomStringUtils.random(3, 0, 9, true, true, "1234567890".toCharArray());
			String e3 = RandomStringUtils.random(3, 0, 9, true, true, "1234567890".toCharArray());
			c.setAdminContactMobilePhone("09" + e2 + "-" + e + "-" + e3);
		}
		{
			String lastName = RandomStringUtils.random(1, 0, 10, true, true, "赵钱孙李刘伍胡陈王张黄洪".toCharArray());
			String firstName = RandomStringUtils
					.random(2, 0, 24, true, true, "常长杰立丽美自强世雄文国彬玉英金辉司思芳慈章宏钧君".toCharArray());
			c.setBoss(lastName + firstName);
		}
		{
			String lastName = RandomStringUtils.random(1, 0, 10, true, true, "赵钱孙李刘伍胡陈王张黄洪".toCharArray());
			String firstName = RandomStringUtils
					.random(2, 0, 24, true, true, "常长杰立丽美自强世雄文国彬玉英金辉司思芳慈章宏钧君".toCharArray());
			c.setAdminContact(lastName + firstName);
		}
		{
			String lastName = RandomStringUtils.random(1, 0, 10, true, true, "赵钱孙李刘伍胡陈王张黄洪".toCharArray());
			String firstName = RandomStringUtils
					.random(2, 0, 24, true, true, "常长杰立丽美自强世雄文国彬玉英金辉司思芳慈章宏钧君".toCharArray());
			c.setRepresentative(lastName + firstName);
		}

		return c;

	}

	public static int randBetween(int start, int end) {
		return start + (int) Math.round(Math.random() * (end - start));
	}

	public static String getRandomDate(int startyear, int endyear, String dateFmt) {
		GregorianCalendar gc = new GregorianCalendar();
		int year = randBetween(startyear, endyear);
		gc.set(gc.YEAR, year);
		int dayOfYear = randBetween(1, gc.getActualMaximum(gc.DAY_OF_YEAR));
		gc.set(gc.DAY_OF_YEAR, dayOfYear);

		SimpleDateFormat sdf = new SimpleDateFormat(dateFmt);

		String newdate = sdf.format(gc.getTime());

		System.out.println(gc.get(gc.YEAR) + "/" + gc.get(gc.MONTH) + "/" + gc.get(gc.DAY_OF_MONTH));
		System.out.println(newdate);

		return newdate;
	}

	public static void main(String[] args) {
		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		// {
		// StringBuffer sb = new StringBuffer();
		// sb.append(" 1=1 ");
		//
		// DbWhere d = new DbWhere();
		// d.setWhere(sb.toString());
		//
		// ArrayList list = (ArrayList) o.findCompanyByWhereString(d);
		//
		// System.out.println("list size=" + list.size());
		//
		// for (int i = 0; i < list.size(); i++) {
		// Company c = (Company) list.get(i);
		// c = xxx(c, o);
		// o.updateCompany(c);
		// }
		//
		// }
		{
			String uid = "comp" + KeyMaker.newKey();
			System.out.println(uid);

			Company c = new Company();
			c = xxx(c, o);

			String compName = RandomStringUtils.random(2, 0, 24, true, true, "常长杰立丽美自强世雄文国彬玉英金辉司思芳慈章宏钧君".toCharArray());

			c.setCompName(compName + "有限公司");
			c.setCompShortName(compName);
			c.setUid(uid);
			c.setDomain("DOMAIN_SOFT");
			c.setRegisterDate(getRandomDate(2008, 2011, "yyyy/MM/dd"));
			c.setCreatedTime(getRandomDate(2012, 2013, "yyyyMMddHHmmssSSS"));
			c.setCompStatus("STATUS_APPLY");
			o.insertCompanyB0(c);

		}

		o.closeSession();

	}

}
