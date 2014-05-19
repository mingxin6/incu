package z;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import com.db.MySQLAccessMyBatis;
import com.model.Company;
import com.model.Fee;
import com.model.Teacher;
import com.utils.KeyMaker;

public class SplitCSVLine {
	public static String[] splitCSV(BufferedReader reader) throws IOException {
		return splitCSV(reader, null, ',', '"');
	}

	/**
	 * 
	 * @param reader
	 *            - some line enabled reader, we lazy
	 * @param expectedColumns
	 *            - convenient int[1] to return the expected
	 * @param separator
	 *            - the C(omma) SV (or alternative like semi-colon)
	 * @param quote
	 *            - double quote char ('"') or alternative
	 * @return String[] containing the field
	 * @throws IOException
	 */
	public static String[] splitCSV(BufferedReader reader,
			int[] expectedColumns, char separator, char quote)
			throws IOException {
		final List<String> tokens = new ArrayList<String>(
				expectedColumns == null ? 8 : expectedColumns[0]);
		final StringBuilder sb = new StringBuilder(24);

		for (boolean quoted = false;; sb.append('\n')) {// lazy, we do not
			// preserve the original
			// new line, but meh
			final String line = reader.readLine();
			if (line == null)
				break;
			for (int i = 0, len = line.length(); i < len; i++) {
				final char c = line.charAt(i);
				if (c == quote) {
					if (quoted && i < len - 1 && line.charAt(i + 1) == quote) {// 2xdouble
						// quote
						// in
						// quoted
						sb.append(c);
						i++;// skip it
					} else {
						if (quoted) {
							// next symbol must be either separator or eol
							// according to RFC 4180
							if (i == len - 1 || line.charAt(i + 1) == separator) {
								quoted = false;
								continue;
							}
						} else {// not quoted
							if (sb.length() == 0) {// at the very start
								quoted = true;
								continue;
							}
						}
						// if fall here, bogus, just add the quote and move on;
						// or throw exception if you like to
						/*
						 * 5. Each field may or may not be enclosed in double
						 * quotes (however some programs, such as Microsoft
						 * Excel, do not use double quotes at all). If fields
						 * are not enclosed with double quotes, then double
						 * quotes may not appear inside the fields.
						 */
						sb.append(c);
					}
				} else if (c == separator && !quoted) {
					tokens.add(sb.toString());
					sb.setLength(0);
				} else {
					sb.append(c);
				}
			}
			if (!quoted)
				break;
		}
		tokens.add(sb.toString());// add last
		if (expectedColumns != null)
			expectedColumns[0] = tokens.size();
		return tokens.toArray(new String[tokens.size()]);
	}

	public static String convertDate(String s) throws ParseException {

		if (s.trim().equals("")) {
			return "";
		}

		java.text.SimpleDateFormat simple = new java.text.SimpleDateFormat();
		simple.applyPattern("yyyy/MM/dd");

		java.util.Date date;
		date = simple.parse(s);
		String xx = simple.format(date);

		return xx;
	}

	static void insertFee(String[] ar, MySQLAccessMyBatis o, String yearMonth) {
		Fee fee = new Fee();
		fee.setCompName(ar[0]);
		fee.setRent(ar[1]);
		fee.setManagementFee(ar[2]);
		fee.setUtilityFee(ar[3]);
		fee.setConsumableFee(ar[4]);
		fee.setTotal(ar[5]);
		fee.setYearMonth(yearMonth);

		Company com = o.findCompanyByCompName(ar[0]);
		if (com != null) {
			fee.setCid(com.uid);
			fee.setRegisterId(com.registerId);
		}

		o.insertFee(fee);
	}

	static void insertTeacher(String[] ar, MySQLAccessMyBatis o) {
		Teacher obj = new Teacher();
		obj.setUid("Teacher" + KeyMaker.newKey());
		obj.setDomain(ar[0]);
		obj.setName(ar[1]);
		obj.setTitle(ar[3]);
		obj.setUnit(ar[2]);
		// obj.setRemark(ar[4]);

		
		o.insertTeachers(obj);
	}

	static void insertCompany(String[] ar, MySQLAccessMyBatis o) {
		try {
			// if (n == 1) {
			// ar2 = ar;
			// for (int k = 0; k < ar2.length; k++) {
			// System.out.println("=ar2[" + k + "];//" + ar2[k]);
			// }
			// }
			//
			// if (ar[1].equals("NSI193")) {
			// for (int k = 0; k < ar.length; k++) {
			// System.out.println(k + " " + ar[k] + "//" + ar2[k]);
			// }
			// }

			Company comp = new Company();
			comp.compStatus = ar[0];// ﻿狀態
			if (comp.compStatus.equals("1")) {
				comp.compStatus = "進駐中";
			} else if (comp.compStatus.equals("2")) {
				comp.compStatus = "已畢業";
			}
			comp.uid = ar[1];// 編號
			comp.compName = ar[5];// 公司名稱
			comp.compEngName = ar[6];// 公司英文名稱
			comp.registerId = ar[7];// 統一編號
			comp.registerDate = convertDate(ar[8]);// 公司成立日期

			comp.representative = ar[9];// 負責人

			comp.kind = ar[2];// 公司類別
			if (comp.kind.equals("1")) {
				comp.kind = "本土公司";
			} else if (comp.kind.equals("2")) {
				comp.kind = "外國公司";
			} else if (comp.kind.equals("3")) {
				comp.kind = "僑外資";
			}

			comp.domain = ar[34];// 產業別代號//公司領域
			if (comp.domain.equals("1")) {
				comp.domain = "科技化服務";
			} else if (comp.domain.equals("2")) {
				comp.domain = "嵌入式系統";
			} else if (comp.domain.equals("3")) {
				comp.domain = "資訊軟體";
			} else if (comp.domain.equals("4")) {
				comp.domain = "網路通訊";
			} else if (comp.domain.equals("5")) {
				comp.domain = "數位內容";
			} else if (comp.domain.equals("6")) {
				comp.domain = "生物技術";
			} else {
				comp.domain = "其他";
			}

			comp.compAddress = ar[38];// 聯絡地址

			comp.moveInDate = convertDate(ar[3]);// 首次進駐日
			comp.totalEmployees = ar[10];// 員工人數
			comp.registerCaptial = ar[11];// 資本額(元)
			comp.actualCaptial = ar[12];// 實收資本額(元)
			comp.compIntroduction = ar[16];// 公司簡介
			comp.compWebURL = ar[17];// 公司網址
			comp.prod = ar[15];// 主力產品
			comp.room = ar[18];// 進駐培育間
			comp.roomArea = ar[19];// 簽約坪數
			comp.boss = ar[20];// 總經理
			comp.phone = ar[21];// 總經理電話
			comp.mobilePhone = ar[22];// 總經理手機
			comp.email = ar[23];// 總經理Email
			comp.adminContact = ar[25];// 聯絡人
			comp.adminContactPhone = ar[26];// 聯絡人電話
			comp.adminContactMobilePhone = ar[27];// 聯絡人手機
			comp.adminContactEmail = ar[28];// 聯絡人Email
			comp.contractNumber = ar[32];// 合約編號
			comp.contractStartDate = convertDate(ar[30]);// 合約起日
			comp.contractEndDate = convertDate(ar[31]);// 合約迄日

			comp.innoKind = ar[33];// 新創代號

			if (comp.innoKind.equals("0")) {
				comp.innoKind = "非新創";
			} else if (comp.innoKind.equals("1")) {
				comp.innoKind = "創新";
			} else if (comp.innoKind.trim().equals("2")) {
				comp.innoKind = "新創(成立三年內)";
			}

			comp.remark = ar[29] + ar[35];// 備註

			comp.moveOutDate = convertDate(ar[36]);// 畢業日
			comp.moveOutAddesss = ar[37];// 畢業聯絡地址

			// =ar[4];//樓層
			// =ar[24];//CEO年齡與性別
			// =ar[13];//100年度公司營業額
			// =ar[14];//101年度公司營業額
			// comp.remark = ar[29];// 培育間變更情況(註明時間月/日/年(民國))
			// =ar[39];//專利名稱
			// =ar[40];//取得專利國家
			// =ar[41];//取得專利時間
			// =ar[42];//專利証號
			// =ar[43];//獎項名稱
			// =ar[44];//取得獎項國家
			// =ar[45];//有無獎金
			// =ar[46];//申請名稱
			// =ar[47];//取得補助時間
			// =ar[48];//計畫總金額
			// =ar[49];//計畫補助金額

			comp.manager = "";

			o.insertCompanyB0(comp);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) throws Throwable {
		try {
			FileInputStream fstream = new FileInputStream("d:/temp5/teachers.txt");
			// Get the object of DataInputStream
			DataInputStream in = new DataInputStream(fstream);
			BufferedReader br = new BufferedReader(new InputStreamReader(in));

			String strLine;
			int n = 1;
			String[] ar2 = null;
			// MySQLAccess o = new MySQLAccess();
			MySQLAccessMyBatis o = new MySQLAccessMyBatis();
			o.openSession();
			while ((strLine = br.readLine()) != null) {
				System.out.println(strLine);

				java.io.StringReader r = new java.io.StringReader(strLine);
				String[] ar = splitCSV(new BufferedReader(r));
				System.out.print(n + " len=" + ar.length + "--->");
				System.out.println(java.util.Arrays.toString(ar));

				insertTeacher(ar, o);

				n++;

			}
			o.closeSession();
			in.close();
		} catch (Exception e) {// Catch exception if any
			System.err.println("Error: " + e.getMessage());
		}

	}
}