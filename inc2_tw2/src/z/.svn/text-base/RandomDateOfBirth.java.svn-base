package z;

import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

public class RandomDateOfBirth {

	public static void main(String[] args) {
		GregorianCalendar gc = new GregorianCalendar();
		int year = randBetween(2008, 2010);
		gc.set(gc.YEAR, year);
		int dayOfYear = randBetween(1, gc.getActualMaximum(gc.DAY_OF_YEAR));
		gc.set(gc.DAY_OF_YEAR, dayOfYear);

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");

		String newdate = sdf.format(gc.getTime());

		System.out.println(gc.get(gc.YEAR) + "/" + gc.get(gc.MONTH) + "/" + gc.get(gc.DAY_OF_MONTH));
		System.out.println(newdate);
	}

	public static int randBetween(int start, int end) {
		return start + (int) Math.round(Math.random() * (end - start));
	}
}