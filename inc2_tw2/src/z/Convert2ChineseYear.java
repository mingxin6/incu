package z;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Convert2ChineseYear {
	public static void main(String args[]) {
		Calendar cal = new GregorianCalendar(); // 取得今日時間
		int year = cal.get(cal.YEAR); // 取得西元年
		int month = cal.get(cal.MONTH); // 取得月份(0~11)
		int day = cal.get(cal.DAY_OF_MONTH); // 取得日期
		
		int chYear=year - 1911;
		
		
		System.out.println("民國" + chYear + "年" + (month + 1) + "月" + day
				+ "日");
	}
}