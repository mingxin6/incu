package com.db;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.model.Company;
import com.model.ReviewPaper;
import com.utils.FileUpDownLoadUtil;
import com.vo.VOFile;

public class MySQLAcc extends DB {

	public void loadReviewDocs(Company comp, MySQLAccessMyBatis o) {
		comp.setApplicationFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_1));
		comp.setEstablishPaperFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_2));
		comp.setBusinessPlanFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_3));
		comp.setAccountantNoteFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_4));
		comp.setForm401FileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_5));

		comp.setHandoverFileInfo((ArrayList) o.findUploadedFiles(comp.uid, ReviewPaper.FILE_OTHERFILES));
	}

	public boolean hasUploaedFile(List<MultipartFile> files) throws Exception {
		boolean b = false;
		for (int n = 0; n < files.size(); n++) {
			MultipartFile mFile = (MultipartFile) files.get(n);
			if (mFile != null && mFile.getBytes().length != 0) {
				b = true;
				break;
			}
		}
		return b;
	}
	
	public void processUpload(String compUid, String fileType, List uploaded, String deleteCheck1, String deleteCheck2,
			HttpServletRequest request, MySQLAccessMyBatis o) throws Exception {
		// System.out.println("uploaded.size()==" + uploaded.size());
		if (hasUploaedFile(uploaded)) {
			// 刪除舊檔
			String[] deleteCheck = request.getParameterValues(deleteCheck1);
			if (deleteCheck != null) {
				for (int i = 0; i < deleteCheck.length; i++) {
					o.deleteUploadedFileInfo(deleteCheck[i]);
				}
			}
			// 上傳新檔
			ArrayList applicationFileInfo = FileUpDownLoadUtil.upload(request, uploaded);
			// SAVE file info
			for (int i = 0; i < applicationFileInfo.size(); i++) {
				VOFile voFile = (VOFile) applicationFileInfo.get(i);
				voFile.setUid(UUID.randomUUID().toString());
				voFile.setLinkedObjId(compUid);
				voFile.setType(fileType);
				o.insertUploadedCompanyFileInfo(voFile);
			}
		} else {
			String[] deleteCheck = request.getParameterValues(deleteCheck2);
			if (deleteCheck != null) {
				for (int i = 0; i < deleteCheck.length; i++) {
					o.deleteUploadedFileInfo(deleteCheck[i]);
				}
			}
		}
	}

	public void processUpload2(String compUid, String fileType, List uploaded, String deleteCheck1,
			HttpServletRequest request, MySQLAccessMyBatis o) throws Exception {
		// DELETE file info
		String[] deletedChecks = request.getParameterValues(deleteCheck1);
		if (deletedChecks != null) {
			for (int i = 0; i < deletedChecks.length; i++) {
				o.deleteUploadedFileInfo(deletedChecks[i]);
			}
		}

		// UPLOAD file
		ArrayList fileInfo = FileUpDownLoadUtil.upload(request, uploaded);

		// SAVE file info
		for (int i = 0; i < fileInfo.size(); i++) {
			VOFile voFile = (VOFile) fileInfo.get(i);
			voFile.setUid(UUID.randomUUID().toString());
			voFile.setLinkedObjId(compUid);
			voFile.setType(fileType);
			o.insertUploadedCompanyFileInfo(voFile);
		}
	}

}
