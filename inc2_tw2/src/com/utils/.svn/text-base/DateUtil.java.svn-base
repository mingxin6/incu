package com.utils;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import com.vo.VOMonthlyReportCondition;
import com.vo.VOQuarterlyReportCondition;
import com.vo.VOYearlyReportCondition;

public class DateUtil {

	public static void main(String[] args) {
		DateUtil o = new DateUtil();
		// // ArrayList ar = o.getMonths("2012", "05", "2013", "03");
		//
		// String dts = "2012/12";
		// int quarter = DateUtil.getQuarter(dts);
		// System.out.println("Quarter for the date : " + dts + " is : " + quarter);
		// // -----------------------------------------------------------------------------
		// String[] m = getMonthsInQuarter("2");
		// String s = "{";
		// for (int i = 0; i < m.length; i++) {
		// s = s + "\"" + m[i] + "\"";
		// if (i != m.length - 1)
		// s = s + ",";
		// }
		// s = s + "}";
		// System.out.println(s);

		System.out.println(o.getROCDate("2000/09/09"));
	}

	public String getROCDate(String d) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat();
			sdf.applyPattern("yyyy/MM/dd");
			Date testeddate = sdf.parse(d);
			Calendar c = Calendar.getInstance();
			c.setTime(testeddate);

			// c.add(Calendar.YEAR, -1911); // add n month
			// SimpleDateFormat sdf2 = new SimpleDateFormat();
			// sdf2.applyPattern("yyyy/MM/dd");
			// String newdate = sdf2.format(c.getTime());
			// return newdate;

			DecimalFormat formatter = new DecimalFormat("00");
			DecimalFormat formatter2 = new DecimalFormat("000");

			int year = c.get(Calendar.YEAR) - 1911;
			String yyy = formatter2.format(year);

			int month = c.get(Calendar.MONTH) + 1;
			String mm = formatter.format(month);

			int day = c.get(Calendar.DAY_OF_MONTH);
			String dd = formatter.format(day);

			return yyy + "/" + mm + "/" + dd;

		} catch (Exception e) {
//			e.printStackTrace();
			return d;
		}
	}

	public static String[] getMonthsInQuarter(String q) {
		String[] q1 = { "01", "02", "03" };
		String[] q2 = { "04", "05", "06" };
		String[] q3 = { "07", "08", "09" };
		String[] q4 = { "10", "11", "12" };

		if (q.equals("1"))
			return q1;
		else if (q.equals("2"))
			return q2;
		else if (q.equals("3"))
			return q3;
		else
			return q4;
	}

	public static int getQuarter(String yearMonth) {
		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("yyyy/MM");

		try {
			Date testeddate = sdf.parse(yearMonth);
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(testeddate);

			int testedyear = calendar.get(Calendar.YEAR);
			int[] months = { 3, 6, 9, 12 };

			int count = 0;
			do {
				// System.out.println(count);

				calendar.set(testedyear, months[count], 1);
				Date quarterStartDt = calendar.getTime();

				// System.out.println(count + "---" + sdf.format(testeddate) + "," + sdf.format(quarterStartDt) + ">>>"
				// + testeddate.compareTo(quarterStartDt) + "     " + testeddate.before(quarterStartDt));

				if (testeddate.compareTo(quarterStartDt) < 0)
					return count + 1;
				else if (testeddate.compareTo(quarterStartDt) == 0)
					return count + 1 + 1;

				count++;
			} while (count < 4);

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList getMonths(String fmyr, String fmmo, String toyr, String tomo) {
		ArrayList ar = new ArrayList();

		String start = fmyr + "/" + fmmo;
		String end = toyr + "/" + tomo;

		ar.add(start);
		if (start.equals(end)) {
			return ar;
		}

		while (true) {
			start = plusOrMinusMonth(start, 1);
			// System.out.println(start);
			ar.add(start);
			if (start.equals(end)) {
				break;
			}
		}

		return ar;
	}

	public String plusOrMinusMonth(String start, int n) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		Date date;
		try {
			date = sdf.parse(start);

			Calendar c1 = Calendar.getInstance();
			c1.setTime(date);

			c1.add(Calendar.MONTH, n); // add n month
			// System.out.println("Date add 1 month : " + sdf.format(c1.getTime()));

			String newdate = sdf.format(c1.getTime());
			return newdate;
		} catch (ParseException e) {
			e.printStackTrace();
			return "";
		}
	}

	public VOMonthlyReportCondition getInitMonthlyReportCondition() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		VOMonthlyReportCondition xx = new VOMonthlyReportCondition();
		try {
			Calendar c1 = Calendar.getInstance();
			{
				c1.setTime(new Date());
				String currentMonth = sdf.format(c1.getTime());
				String[] cd = currentMonth.split("-");
				xx.toYear = cd[0];
				xx.toMonth = cd[1];
			}
			{
				c1.add(Calendar.MONTH, -11);
				String currentMonth = sdf.format(c1.getTime());
				String[] cd = currentMonth.split("-");
				xx.fromYear = cd[0];
				xx.fromMonth = cd[1];
			}
			return xx;
		} catch (Exception e) {
			e.printStackTrace();
			return xx;
		}
	}

	public VOQuarterlyReportCondition getInitQuarterlyReportCondition() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		VOQuarterlyReportCondition xx = new VOQuarterlyReportCondition();
		try {
			Calendar c1 = Calendar.getInstance();
			{
				c1.setTime(new Date());
				String currentMonth = sdf.format(c1.getTime());

				String[] cd = currentMonth.split("/");
				xx.toYear = cd[0];
				xx.toQuarter = "" + getQuarter(currentMonth);
			}
			{
				c1.add(Calendar.YEAR, -1);
				String currentMonth = sdf.format(c1.getTime());
				String[] cd = currentMonth.split("/");
				xx.fromYear = cd[0];
				xx.fromQuarter = "1";
			}
			return xx;
		} catch (Exception e) {
			e.printStackTrace();
			return xx;
		}
	}

	public VOYearlyReportCondition getInitYearlyReportCondition() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM");
		VOYearlyReportCondition xx = new VOYearlyReportCondition();
		try {
			Calendar c1 = Calendar.getInstance();
			{
				c1.setTime(new Date());
				String currentMonth = sdf.format(c1.getTime());
				String[] cd = currentMonth.split("/");
				xx.toYear = cd[0];
				// xx.toMonth = cd[1];
			}
			{
				c1.add(Calendar.YEAR, -3);
				String currentMonth = sdf.format(c1.getTime());
				String[] cd = currentMonth.split("/");
				xx.fromYear = cd[0];
				// xx.fromMonth = cd[1];
			}
			return xx;
		} catch (Exception e) {
			e.printStackTrace();
			return xx;
		}
	}
}
