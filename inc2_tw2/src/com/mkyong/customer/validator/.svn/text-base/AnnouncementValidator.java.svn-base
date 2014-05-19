package com.mkyong.customer.validator;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

import com.model.Announcement;

public class AnnouncementValidator implements Validator {

	private static transient Logger logger = LoggerFactory.getLogger(AnnouncementValidator.class);

	@Override
	public boolean supports(Class clazz) {
		return Announcement.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "公告标题不可空白.", "公告标题不可空白.");

		Announcement announcement = (Announcement) target;

		List<MultipartFile> files = announcement.getFiles();
		if (files == null)
			return;
		
		System.out.println("file count---->>>>" + files.size());

		// List<String> files = new ArrayList<String>();

		// String saveDirectory = "d:/temp2/";
		// if (null != files && files.size() > 0) {

		

		for (MultipartFile file : files) {

			try {
				if (file == null || file.getBytes().length == 0)
					continue;

				System.out.println("validator--->"+file.getName() + "," + file.getOriginalFilename() + "," + file.getSize());

				// if ( file.getBytes().length >100000 ) {
				// errors.reject("error.file.size", "太大 : File size can't exceed 100,000 bytes");
				// return;
				// }

				// if (file == null || file.getBytes().length == 0) {
				// errors.reject("error.upload.null", "File name can't be empty");
				// return;
				// }

			} catch (IOException e) {
				logger.error(e.getMessage());
			}

			// // Check content type
			// boolean acceptableContentType = false;
			// String incomingContentType = file.getContentType();
			// logger.info("FileName = " + file.getName());
			// logger.info("incomingContentType = " + incomingContentType);
			// // This related to bug when on Vista and using Firefox content type is 'application/octet-stream'
			// // Instead of one of the allowed ones
			// if ("application/octet-stream".equalsIgnoreCase(incomingContentType)) {
			// int index = file.getOriginalFilename().lastIndexOf('.');
			// String incomingExtension = file.getOriginalFilename().substring(index + 1);
			// for (String extendsion : ACCEPTED_EXTENSIONS) {
			// if (extendsion.equalsIgnoreCase(incomingExtension)) {
			// acceptableContentType = true;
			// break;
			// }
			// }
			// } else {
			// for (String contentType : ACCEPTED_CONTENT_TYPES) {
			// logger.debug("Comparing " + incomingContentType + " to " + contentType);
			// if (contentType.equalsIgnoreCase(incomingContentType)) {
			// acceptableContentType = true;
			// break;
			// }
			// }
			// }
			// if (!acceptableContentType) {
			// errors.reject("error.upload.contenttype",
			// "Please upload a file with one of the following file types; .doc, .docx, .txt, .pdf, .rtf .");
			// }
		}
	}
}
