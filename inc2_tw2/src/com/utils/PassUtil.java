package com.utils;

import org.acegisecurity.providers.encoding.Md5PasswordEncoder;

public class PassUtil {

	public String encodeClearText(String clearText) {
//		PasswordEncoder encoder = new Md5PasswordEncoder();
		Md5PasswordEncoder passwordEncoder=new Md5PasswordEncoder();
		return passwordEncoder.encodePassword(clearText, null);
	}
	
	public static void main(String[] args){
		PassUtil o=new PassUtil();
		
		String s=o.encodeClearText("p@ssw0rd");
		System.out.println(s);
	}
}
