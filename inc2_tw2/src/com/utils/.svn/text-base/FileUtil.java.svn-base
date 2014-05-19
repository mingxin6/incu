package com.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.channels.FileChannel;

import org.apache.commons.io.FileUtils;

public class FileUtil {

	public static void w(String s) {
		File file = new File("d:/temp/output.txt");
		try {
			FileUtils.writeStringToFile(file, s + System.getProperty("line.separator"), "UTF-8", true);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

	public void copyFile(File sourceFile, File destFile) throws IOException {
		if (!destFile.exists()) {
			destFile.createNewFile();
		}

		FileChannel source = null;
		FileChannel destination = null;
		try {
			source = new RandomAccessFile(sourceFile, "rw").getChannel();
			destination = new RandomAccessFile(destFile, "rw").getChannel();

			long position = 0;
			long count = source.size();

			source.transferTo(position, count, destination);
		} finally {
			if (source != null) {
				source.close();
			}
			if (destination != null) {
				destination.close();
			}
		}
	}

	public static void writeStringToFile(String s) {
		// try {
		// // Create file
		// FileWriter fstream = new FileWriter("d:/temp/out.txt");
		// BufferedWriter out = new BufferedWriter(fstream);
		// out.write(s);
		// // Close the output stream
		// out.close();
		// } catch (Exception e) {// Catch exception if any
		// System.err.println("Error: " + e.getMessage());
		// }

		BufferedWriter bw = null;

		try {
			bw = new BufferedWriter(new FileWriter("d:/temp/out.txt", true));
			bw.write(s);
			bw.newLine();
			bw.flush();
		} catch (Exception ioe) {
			ioe.printStackTrace();
		} finally { // always close the file
			if (bw != null) {
				try {
					bw.close();
				} catch (Exception ioe2) {
					// just ignore it
				}
			}
		}

	}

	public File makeDir(String dirname) {
		File directory = new File(dirname);
		if (directory.exists() && directory.isDirectory()) {
			System.out.println("The dir exist");
			return null;
		} else {
			try {
				directory.mkdir();
				System.out.println("The dir ok");
				return directory;
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}

	}

	public static void deleteDir(File folder) {
		File[] files = folder.listFiles();
		if (files != null) { // some JVMs return null for empty dirs
			for (File f : files) {
				if (f.isDirectory()) {
					deleteDir(f);
				} else {
					f.delete();
				}
			}
		}
		folder.delete();
	}

	public static void main(String[] args) {
		FileUtil fileUtil = new FileUtil();

		File dir = fileUtil.makeDir("c:/zzzzz/kkk");
		System.out.println(dir.getAbsolutePath());

		File source = new File("C:/uploaded/20140325170340558_工作表.xlsx");
		File destination = new File(dir.getAbsolutePath() + "/" + "工作表.xlsx");

		try {
			fileUtil.copyFile(source, destination);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		File folder = new File("c:/zzzzz/kkk2");
		fileUtil.deleteDir(folder);

	}

}
