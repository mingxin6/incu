package com.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import jxl.Cell;
import jxl.CellType;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

public class ExcelParser {
	// public ArrayList arTWDS = new ArrayList();

	public void readDoc(String file) throws IOException {
		File inputWorkbook = new File(file);
		Workbook w = null;
		try {
			w = Workbook.getWorkbook(inputWorkbook);
			Sheet sheet = w.getSheet(0);
			for (int row = 1; row < sheet.getRows(); row++) {
				// WCOBaseDens o = new WCOBaseDens();
				for (int col = 0; col < sheet.getColumns(); col++) {
					Cell cell = sheet.getCell(col, row);
					CellType type = cell.getType();

					String x = "";
					// if (col == 3 && cell.getType() == CellType.NUMBER) {
					// } else {
					x = "" + cell.getContents();
					// }
					x = x.trim();
					System.out.print(x);
					System.out.print("\t");

					// if (col == 1) {
					// o.wcoid = x;
					// } else if (col == 2) {
					// o.name = x;
					// } else if (col == 3) {
					// o.def = x;
					// }
				}
				System.out.println();
			}
			// System.out.println("arDens size=" + arWCODens.size());
		} catch (BiffException e) {
			e.printStackTrace();
		} finally {
			if (w != null)
				w.close();
		}
	}

	public static void main(String[] args) throws Exception {
		System.out.println("****************************************");

		ExcelParser o = new ExcelParser();
		o.readDoc("c:/Book1.xls");

	}
}
