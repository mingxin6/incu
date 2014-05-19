package z;

import org.apache.commons.lang.RandomStringUtils;

public class RandomStr {

	public static void main(String[] args) {
		RandomStringUtils o = new RandomStringUtils();

		// Random 8 chars string using only the elements in the array aChars
		// Only charcters between place 0 and 5 in the array can be used.
		// Both letters and numbers are permitted
		System.out.print("5) 8 char string using specific characters in an array >>>");

		char[] aChars = new char[] { 'a', '1', 'c', '2', 'e', 'f', 'g' };
		for(int i=0;i<10;i++){
		System.out.println(RandomStringUtils.random(5, 0, 35, true, true, "abcdefghijklmnopqrstuvxyz1234567890".toCharArray()));}
		
		String result = RandomStringUtils.random(32, 0, 20, true, true, "陳李32rfHIJk9iQ8Ud7h0X".toCharArray());
        System.out.println("random = " + result);
	}

}
