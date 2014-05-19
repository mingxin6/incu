package com.utils;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.vo.VOFile;

public class FileUpDownLoadUtil {
	private static final String REALNAME = "realName";
	private static final String STORENAME = "storeName";
	private static final String SIZE = "size";
	private static final String SUFFIX = "suffix";
	private static final String CONTENTTYPE = "contentType";
	private static final String CREATETIME = "createTime";

	// private static final String UPLOADDIR = "uploadDir/";
	//
	public static final String UPLOADDIR = "c:/uploaded";
	
	public static final String DOWNLOADDIR = "c:/uploaded2";//發郵件的夾檔放此

	private static String uploadDir = UPLOADDIR; // "d:/temp5";

	// private static final String uploadDir = "WEB-INF\\uploadDir\\";

	private static String getRandomFilePrefix(String name) {
		// Long now = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss")
		// .format(new Date()));
		// Long random = (long) (Math.random() * now);
		// String fileNamePrefix = now + "" + random;

		String fileNamePrefix = KeyMaker.newKey();
		return fileNamePrefix;
	}

	public static ArrayList upload(HttpServletRequest request,
			List<MultipartFile> files, String uploadPos) throws Exception {
		uploadDir = uploadPos;
		// System.out.println("uploadDir ----xxx---->" + uploadDir);
		ArrayList ar = upload(request, files);
		uploadDir = UPLOADDIR;
		return ar;
	}

	public static ArrayList upload(HttpServletRequest request,
			List<MultipartFile> files) throws Exception {

		ArrayList result = new ArrayList();

		// String enc=request.getCharacterEncoding();
		// System.out.println("\nennnnncccoding====="+enc);

		// request.setCharacterEncoding("big5");
		// MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)
		// request;
		// Map<String, MultipartFile> fileMap = mRequest.getFileMap();
		// int i=0;
		// for (Iterator<Map.Entry<String, MultipartFile>> it =
		// fileMap.entrySet().iterator(); it.hasNext(); i++) {
		// Map.Entry<String, MultipartFile> entry = it.next();
		// MultipartFile mFile = entry.getValue();
		// String fileName = mFile.getOriginalFilename();
		//
		// try {
		// FileUtils.writeStringToFile(new File("c:/xxx.txt"),
		// "===>>>"+fileName);
		// // FileUtils.writeStringToFile(new File("c:/xxx.txt"), sql,true);
		// } catch (IOException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		// }

		// String uploadDir =
		// request.getSession().getServletContext().getRealPath("/") +
		// FileOperateUtils2.UPLOADDIR;

		File dir = new File(uploadDir);

		if (!dir.exists()) {
			dir.mkdir();
		}

		// String zipName = null;
		// String fileName = null;
		String prefix = null;
		// Map<String, Object> map = null;
		// int i = 0;

		// System.out.println("--------============>>>>>>>>>"+obj.createDate);
		for (int n = 0; n < files.size(); n++) {
			MultipartFile mFile = (MultipartFile) files.get(n);
			// try {
			if (mFile == null || mFile.getBytes().length == 0)
				continue;

			String originalFileName = mFile.getOriginalFilename();
			// String originalFileName = new
			// String(mFile.getOriginalFilename().getBytes("ISO-8859-1"),
			// "UTF-8");

			// String originalFileName = new
			// String(mFile.getOriginalFilename().getBytes("Big5"), "UTF-8");

			// String originalFileName = new
			// String(mFile.getOriginalFilename().getBytes("UTF-8"),"big5");

			// String originalFileName = new
			// String(mFile.getOriginalFilename().getBytes(Charset.forName("UTF-8")),
			// Charset.forName("Windows-1252"));

			// System.out.println(">>>>>>>====>>>>>>" + mFile.getName() + "," +
			// mFile.getOriginalFilename() + ","
			// + mFile.getSize());

			// fileName = mFile.getOriginalFilename();
			prefix = getRandomFilePrefix(originalFileName);
			// String noZipName = uploadDir + storeName;
			// zipName = zipName(noZipName);
			//
			// ZipOutputStream os = new ZipOutputStream(new
			// BufferedOutputStream(new FileOutputStream(dir + "/"
			// + storeName)));
			// outputStream.putNextEntry(new ZipEntry(fileName));
			// outputStream.setEncoding("GBK");
			// FileCopyUtils.copy(mFile.getInputStream(), os);

			// System.out.println("saving ..............." + dir + "/" +
			// prefix);

			String savedFile = dir + "/" + prefix + "_" + originalFileName;
			OutputStream os = new BufferedOutputStream(new FileOutputStream(
					savedFile));

			FileCopyUtils.copy(mFile.getInputStream(), os);
			os.close();
			// ----------------------------------------------------------------------
			VOFile voFile = new VOFile();
			voFile.setOriginalFileName(originalFileName);
			voFile.setModifiedFileName(prefix + "_" + originalFileName);
			result.add(voFile);

			if (originalFileName.equals("Book1.xls")) {
				System.out.println("savedFile=====>" + savedFile);
				ExcelParser o = new ExcelParser();
				o.readDoc(savedFile);
			}

			// map = new HashMap<String, Object>();
			// //
			// // map.put(FileOperateUtils2.REALNAME, zipName(fileName));
			// // map.put(FileOperateUtils2.STORENAME, zipName(storeName));
			// map.put(FileOperateUtils2.STORENAME, storeName);
			// // map.put(FileOperateUtils2.SIZE, new File(zipName).length());
			// // map.put(FileOperateUtils2.SUFFIX, "zip");
			// map.put(FileOperateUtils2.CONTENTTYPE,
			// "application/octet-stream");
			// map.put(FileOperateUtils2.CREATETIME, new Date());
			// //
			// for (String param : params) {
			// map.put(param, values.get(param)[i]);
			// }
			// result.add(map);
		}
		// System.out.println("createTime \t" + result);
		// String storeNameLast = storeName.substring((storeName.length() - 4),
		// storeName.length() - 0);
		// storeName.replace(storeNameLast, ".zip");
		/**
		 * 
		 */
		// MySQLAccess msa = new MySQLAccess();
		// Uploads up = new Uploads();
		// up.setFileName(fileName);
		// up.setFileWay(uploadDir);
		// up.setStoreName(storeName.replace(storeNameLast, ".zip"));
		// msa.insertUploads(up);
		return result;
	}

	public static void download(HttpServletRequest request,
			HttpServletResponse response, String originalFileName,
			String modifiedFileName) throws Exception {

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		// 下载文件名乱码__多浏览器支持
		String originalFileNameforHeader = null;
		String userAgent = request.getHeader("user-agent");
		// System.out.println("user-agent: "+userAgent);
		userAgent = userAgent.toLowerCase();
		if (userAgent != null) {
			if ((userAgent.indexOf("msie") != -1)) {
				// originalFileNameforHeader = URLEncoder.encode(new
				// String(originalFileName.getBytes("ISO8859-1"), "UTF-8"),
				// "UTF-8");
				// 上面为tomcat URIencoding未设置utf-8
				originalFileNameforHeader = URLEncoder.encode(originalFileName,
						"UTF-8");
				System.out.println("ie's is " + originalFileNameforHeader);
			} else if ((userAgent.indexOf("applewebkit") != -1)) {
				// originalFileNameforHeader = originalFileName;
				// 上面为tomcat URIencoding未设置utf-8
				originalFileNameforHeader = new String(originalFileName
						.getBytes("utf-8"), "ISO8859-1");
				;
			}

		}

		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;

		System.out.println(new String(modifiedFileName.getBytes("ISO8859-1"),
				"utf-8"));
		System.out.println(modifiedFileName);

		// String ctxPath =
		// request.getSession().getServletContext().getRealPath("/") +
		// FileUpDownLoadUtil.UPLOADDIR;
		String downLoadPath = uploadDir + "/" + modifiedFileName;

		long fileLength = new File(downLoadPath).length();

		String contentType = "application/octet-stream";

		response.setContentType(contentType);
		response.setHeader("Content-disposition", "attachment; filename="
				+ originalFileNameforHeader);
		response.setHeader("Content-Length", String.valueOf(fileLength));

		bis = new BufferedInputStream(new FileInputStream(downLoadPath));
		bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buff = new byte[2048];
		int bytesRead;
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);
		}
		bis.close();
		bos.close();
	}
}
