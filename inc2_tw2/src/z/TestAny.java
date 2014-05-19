package z;

//import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TestAny {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String x = DateFormat.getDateInstance().format(new Date());
		System.out.println(x);

		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		System.out.println(dateFormat.format(date));

	}

}
