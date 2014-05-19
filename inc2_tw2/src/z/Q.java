package z;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Q {

	public static void main(String[] args) throws ParseException {
		// SimpleDateFormat sdf = new SimpleDateFormat();
		// sdf.applyPattern("MM/dd/yyyy");
		// Calendar calendar = Calendar.getInstance();
		// Date processDate = sdf.parse("7/1/2007");
		//
		// calendar.setTime(processDate);
		// Date date1 = calendar.getTime();
		// int quarter = Q.getQuarter(date1);
		// System.out.println("Quarter for the date : " + sdf.format(calendar.getTime()) + " is : " + quarter);
		// -----------------------------------------------------------------------------------------------
		String fmyr = "2011";
		String fmQ = "4";
		String toyr = "2013";
		String toQ = "1";

		int fromY = Integer.parseInt(fmyr);
		int toY = Integer.parseInt(toyr);
		boolean f = false;
		for (int i = fromY; i <= toY; i++) {
			for (int q = 1; q <= 4; q++) {

				if (i == fromY && q == Integer.parseInt(fmQ)) {
					f = true;
				}

				if (i == toY && q == Integer.parseInt(toQ)+1 ) {
					f = false;
				}

				if (f)
					System.out.println(i + "Q" + q);
			}
		}

	}

	public static int getQuarter(Date testeddate) {
		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("MM/dd/yyyy");

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(testeddate);
		int testedyear = calendar.get(Calendar.YEAR);
		int[] months = { 3, 6, 9, 12 };

		int count = 0;
		do {
			System.out.println(count);

			calendar.set(testedyear, months[count], 1);
			Date quarterStartDt = calendar.getTime();

			System.out.println(count + "---" + sdf.format(testeddate) + "," + sdf.format(quarterStartDt) + ">>>"
					+ testeddate.compareTo(quarterStartDt) + "     " + testeddate.before(quarterStartDt));

			if (testeddate.compareTo(quarterStartDt) < 0)
				return count + 1;
			else if (testeddate.compareTo(quarterStartDt) == 0)
				return count + 1 + 1;

			count++;
		} while (count < 4);
		return 0;
	}

	// Find previous quarter begin and end dates for a given date
	public static void Z() throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat();
		sdf.applyPattern("MM/dd/yyyy");
		Calendar calendar = Calendar.getInstance();
		Date processDate = sdf.parse("4/10/2007");
		calendar.setTime(processDate);
		Date date1 = calendar.getTime();
		int quarter = Q.getQuarter(date1);
		String currentQuarterBeginDate = "";
		String fromDt = "";
		String toDt = "";
		if (quarter == 1) {
			currentQuarterBeginDate = "01/01/" + calendar.get(Calendar.YEAR);
		}
		if (quarter == 2) {
			currentQuarterBeginDate = "04/01/" + calendar.get(Calendar.YEAR);
		}
		if (quarter == 3) {
			currentQuarterBeginDate = "07/01/" + calendar.get(Calendar.YEAR);
		}
		if (quarter == 4) {
			currentQuarterBeginDate = "10/01/" + calendar.get(Calendar.YEAR);
		}
		calendar.setTime(sdf.parse(currentQuarterBeginDate));
		calendar.add(Calendar.MONTH, 3 * -1);
		fromDt = sdf.format(calendar.getTime());
		String formmatedQuarterBeginDate = sdf.format(calendar.getTime());
		calendar.setTime(new java.util.Date(formmatedQuarterBeginDate));
		calendar.add(Calendar.MONTH, 3);
		calendar.add(Calendar.DAY_OF_MONTH, -1);
		toDt = sdf.format(calendar.getTime());
		System.out.println("Previous Quarter Begin Date : " + fromDt);
		System.out.println("Previous Quarter End Date : " + toDt);

	}

}
