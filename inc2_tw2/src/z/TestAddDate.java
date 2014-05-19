package z;

import java.util.Calendar;
import java.text.SimpleDateFormat;

public class TestAddDate {
	
	public static void main(String[] args) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar c1 = Calendar.getInstance();
		c1.set(1999, 0, 20); // 1999 jan 20
		
		System.out.println("Date is : " + sdf.format(c1.getTime()));
		
		c1.add(Calendar.DATE, 20); // or Calendar.DAY_OF_MONTH which is a synonym
		
		System.out.println("Date + 20 days is : " + sdf.format(c1.getTime()));
		/*
		 * output : Date is : 1999-01-20 Date + 20 days is : 1999-02-09
		 */
	}
}
