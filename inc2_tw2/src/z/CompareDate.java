package z;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

public class CompareDate {

	boolean preToday(String endtime) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date end = dateFormat.parse(endtime);
		Date today = new Date();

		DateFormat df = SimpleDateFormat.getDateInstance(DateFormat.DATE_FIELD);
		String endStr = df.format(end);
		String todayStr = df.format(today);

		int n = todayStr.compareTo(endStr);
		if (n > 0)
			return true;
		else
			return false;
	}

	public static void main(String[] av) throws ParseException {
		String endtime = "2014-05-26 14:00";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date d1 = dateFormat.parse(endtime);

		/** Today's date */
		Date today = new Date();

		// Get msec from each, and subtract.
		long diff = today.getTime() - d1.getTime();

		System.out.println(diff / (1000 * 60 * 60 * 24));
	}

}
