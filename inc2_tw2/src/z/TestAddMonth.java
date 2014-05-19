package z;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TestAddMonth {
	public static void main(String[] args) throws Exception {
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c1 = Calendar.getInstance();
			c1.set(1999, 0, 20); // 1999 jan 20
			System.out.println("Date is : " + sdf.format(c1.getTime()));

			c1.roll(Calendar.MONTH, false); // roll down, substract 1 month

			System.out.println("Date roll down 1 month : " + sdf.format(c1.getTime()));
		}
		// ------------------------------------------------------------------------
		{

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c1 = Calendar.getInstance();
			c1.set(1999, 0, 20); // 1999 jan 20
			System.out.println("Date is : " + sdf.format(c1.getTime()));
			c1.add(Calendar.MONTH, -1); // substract 1 month
			System.out.println("Date minus 1 month : " + sdf.format(c1.getTime()));
			/*
			 * output : Date is : 1999-01-20 Date roll down 1 month : 1999-12-20 Date is : 1999-01-20 Date minus 1 month
			 * : 1998-12-20
			 */
		}
		// ------------------------------------------------------------------------
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
			Calendar c1 = Calendar.getInstance();

			c1.set(1999, 11,01); // 1999 jan 20
			System.out.println("Date is : " + sdf.format(c1.getTime())+"---"+c1.get(c1.YEAR)+","+c1.get(c1.MONTH));
			
			
			
			
			c1.add(Calendar.MONTH, 1); // add 1 month
			System.out.println("Date add 1 month : " + sdf.format(c1.getTime()));
		}
		
		{
			String dateString="199912";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
			Date date = sdf.parse(dateString); 
			
			Calendar c1 = Calendar.getInstance();
			c1.setTime(date);

			
			c1.add(Calendar.MONTH, 1); // add 1 month
			System.out.println("Date add 1 month : " + sdf.format(c1.getTime()));
			
//			System.out.println(date);
		}
	}
}
