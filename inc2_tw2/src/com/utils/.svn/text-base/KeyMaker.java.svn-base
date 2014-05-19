package com.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class KeyMaker {

	static String lastDT = "";

	public synchronized static String newKey() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String DT = sdf.format(new Date());
		while (DT.equals(lastDT)) {
			try {
				Thread.sleep(1);
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			DT = sdf.format(new Date());
		}

		lastDT = DT;
		// System.out.println("lastDT= "+lastDT);
		return DT;
	}

	public static void main(String[] arg) {
		for (int i = 0; i < 10; i++) {
			System.out.println(KeyMaker.newKey());
		}
	}

}
