package com.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.Const;
import com.mkyong.customer.controller.Selects;
import com.utils.DateUtil;
import com.vo.VOFile;

public class Company extends A {

	public static String STATUS_APPLY = "STATUS_APPLY";// "資料收集中";
	public static String STATUS_RECEV = "STATUS_RECEV";// "資料備齊";
	public static String STATUS_DENY = "STATUS_DENY";// "中止申請";
	public static String STATUS_REVIEW = "STATUS_REVIEW";// "準備審查";
	public static String STATUS_APPLYOK = "STATUS_APPLYOK";// "通過";
	public static String STATUS_APPLYFAIL = "STATUS_APPLYFAIL";// "未通過";

	public static String STATUS_MOVEIN = "STATUS_MOVEIN";// "進駐中";
	public static String STATUS_MOVEOUT = "STATUS_MOVEOUT";// "已畢業";

	public static String DOMAIN_SOFT = "DOMAIN_SOFT";// 資訊軟體
	public static String DOMAIN_SRV = "DOMAIN_SRV";// 科技化服務
	public static String DOMAIN_COMM = "DOMAIN_COMM";// 網路通訊
	public static String DOMAIN_CONT = "DOMAIN_CONT";// 數位內容
	public static String DOMAIN_EMBED = "DOMAIN_EMBED";// 嵌入式系統
	public static String DOMAIN_EE = "DOMAIN_EE";// 電機電子
	public static String DOMAIN_OTHER = "DOMAIN_OTHER";// 其他

	public static String KIND_DEMESTIC = "KIND_DEMESTIC";// "本國";
	public static String KIND_FOREIGN = "KIND_FOREIGN";// "外商";
	public static String KIND_OVERSEA = "KIND_OVERSEA";// "僑外資";

	public static String INNO_INNO = "INNO_INNO";// "創新";
	public static String INNO_NEW = "INNO_NEW";// "新創";

	// ******************************************************************************
	public String domain = "";// ??//公司領域 -- 資訊軟體,科技化服務,網路通訊,數位內容, 嵌入式系統,電機電子,其他
	public String domainRS = "";

	public String getDomainRS() {
		return domainRS;
	}

	public void setDomainRS(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		if (DOMAIN_SOFT.equals(domain)) {
			this.domainRS = resource.getString("comp.domain.software");
		} else if (DOMAIN_SRV.equals(domain)) {
			this.domainRS = resource.getString("comp.domain.ict");
		} else if (DOMAIN_COMM.equals(domain)) {
			this.domainRS = resource.getString("comp.domain.network");
		} else if (DOMAIN_CONT.equals(domain)) {
			this.domainRS = resource.getString("comp.domain.content");
		} else if (DOMAIN_EMBED.equals(domain)) {
			this.domainRS = resource.getString("comp.domain.embedded");
		} else if (DOMAIN_EE.equals(domain)) {
			this.domainRS = resource.getString("comp.domain.ee");
		} else if (DOMAIN_OTHER.equals(domain)) {
			this.domainRS = resource.getString("comp.domain.other");
		} else {
			this.domainRS = domain;
		}
	}

	// ******************************************************************************
	public String kind = "";// ??//公司類別 --本國,外商.僑外資
	public String kindRS = "";

	public String getKindRS() {
		return kindRS;
	}

	public void setKindRS(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		if (KIND_DEMESTIC.equals(kind)) {
			this.kindRS = resource.getString("comp.kind.domestic");
		} else if (KIND_FOREIGN.equals(kind)) {
			this.kindRS = resource.getString("comp.kind.foreign");
		} else if (KIND_OVERSEA.equals(kind)) {
			this.kindRS = resource.getString("comp.kind.overseas");
		} else {
			this.kindRS = kind;
		}
	}

	// ******************************************************************************
	public String innoKind = "";// ??//新創代號 -- 創新, 新創(成立三年內)
	public String innoKindRS = "";

	public String getInnoKindRS() {
		return innoKindRS;
	}

	public void setInnoKindRS(HttpServletRequest request) {
		this.innoKindRS = innoKindRS;
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		if (INNO_INNO.equals(innoKind)) {
			this.innoKindRS = resource.getString("comp.innokind.inno");
		} else if (INNO_NEW.equals(innoKind)) {
			this.innoKindRS = resource.getString("comp.innokind.new");
		} else {
			this.innoKindRS = innoKind;
		}
	}

	// ******************************************************************************
	public String compStatus = "";// 企业状态//狀態
	public String compStatusRS = "";// 企业状态//狀態

	public String getCompStatusRS() {
		return compStatusRS;
	}

	public void setCompStatusRS(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		ResourceBundle resource = ResourceBundle.getBundle("com.properties.selects", (Locale) session
				.getAttribute(Const.LocaleSessionKey));
		if (STATUS_APPLY.equals(compStatus)) {
			this.compStatusRS = resource.getString("comp.status.b.apply");
		} else if (STATUS_RECEV.equals(compStatus)) {
			this.compStatusRS = resource.getString("comp.status.b.recev");
		} else if (STATUS_DENY.equals(compStatus)) {
			this.compStatusRS = resource.getString("comp.status.b.deny");
		} else if (STATUS_REVIEW.equals(compStatus)) {
			this.compStatusRS = resource.getString("comp.status.b.review");
		} else if (STATUS_APPLYOK.equals(compStatus)) {
			this.compStatusRS = resource.getString("comp.status.b.applyok");
		} else if (STATUS_APPLYFAIL.equals(compStatus)) {
			this.compStatusRS = resource.getString("comp.status.b.applyfail");
		} else if (STATUS_MOVEIN.equals(compStatus)) {
			this.compStatusRS = resource.getString("comp.status.movin");
		} else if (STATUS_MOVEOUT.equals(compStatus)) {
			this.compStatusRS = resource.getString("comp.status.moveout");
		} else {
			this.compStatusRS = compStatus;
		}
	}

	// ******************************************************************************
	String seq = "";

	public String uid = "";// 编号//編號 (系統 unique id)
	public String customId = "";// 使用者自訂的 unique id

	public String compName = "";// 企业名称//公司名稱
	public String compEngName = "";// ??//公司英文名稱
	public String compShortName = "";// ??//公司簡稱

	public String logoFileName = "";// ??//公司Logo檔案名稱
	private MultipartFile logoFile;

	public String registerId = "";// 工商注册证号//統一編號

	public String registerDate = "";// 注册登记日期 //公司成立日期

	public String representative = "";// ??//負責人

	public String compAddress = "";// ??//聯絡地址

	public String moveInDate = "";// 入驻日期//首次進駐日
	public String totalEmployees = "";// 员工人数//員工人數
	public String registerCaptial = "";// 注册资本// 資本額(元)
	public String actualCaptial = "";// ??// 實收資本額(元)
	public String compIntroduction = "";// ??//公司簡介
	public String compWebURL = "";// 企业网址//公司網址
	public String prod = "";// 项目内容//主力產品
	public String room = "";// 办公用房//進駐培育間
	public String roomArea = "";// 办公用房面积//簽約坪數

	public String boss = "";// 负责人姓名//總經理
	public String phone = "";// ??//總經理電話
	public String mobilePhone = "";// 负责人电话//總經理手機
	public String email = "";// 负责人信箱//總經理Email
	public String adminContact = "";// 行政负责人姓名//聯絡人
	public String adminContactPhone = "";// ??//聯絡人電話
	public String adminContactMobilePhone = "";// 行政负责人电话//聯絡人手機
	public String adminContactEmail = "";// 行政负责人信箱//聯絡人Email

	public String adminContactEmail2 = ""; // 信箱的分行

	public String contractNumber = "";// ??//合約編號
	public String contractStartDate = "";// ??//合約起日
	public String contractEndDate = "";// ??//合約迄日

	public String remark = "";// 备注//備註

	public String moveOutDate = "";// 离驻/毕业日期//畢業日
	public String moveOutAddesss = "";// ??//畢業聯絡地址

	public String manager = "";// 园区负责经理

	String memberUid = "";// 創建此公司資料的會員唯一代碼
	String reviewPaperUid = "";// 審查案唯一代碼

	public String amId = "";
	public String amName = "";
	public String pmId = "";
	public String pmName = "";

	public String recCount = "";// 访谈记录数

	public String deposit = "";// 押金狀況
	public String bond = "";// 施工保證金

	private String accountStatus = "";

	boolean exist = false;// 是否存在於某一審查案

	// 專利
	ArrayList ipRecs = new ArrayList();
	// 獲獎
	ArrayList awardRecs = new ArrayList();
	// 補助
	ArrayList grantRecs = new ArrayList();
	// 輔導紀錄
	ArrayList talkNotes = new ArrayList();

	// 書審材料
	private List<MultipartFile> paperCheckFiles;
	private ArrayList<VOFile> paperFileInfo;
	// 面審材料
	private List<MultipartFile> interviewFiles;
	private ArrayList<VOFile> interviewFileInfo;
	// 其他文件
	private List<MultipartFile> handoverFiles;
	private ArrayList<VOFile> handoverFileInfo;

	// ------------------------------------------------------------------------
	// 進駐申請表
	private List<MultipartFile> applicationFiles;
	private ArrayList<VOFile> applicationFileInfo;
	// 公司設立函文
	private List<MultipartFile> establishPaperFiles;
	private ArrayList<VOFile> establishPaperFileInfo;
	// 營運計劃書
	private List<MultipartFile> businessPlanFiles;
	private ArrayList<VOFile> businessPlanFileInfo;
	// 會計師簽證
	private List<MultipartFile> accountantNoteFiles;
	private ArrayList<VOFile> accountantNoteFileInfo;
	// 401 報表
	private List<MultipartFile> form401Files;
	private ArrayList<VOFile> form401FileInfo;

	// ************************************************************************

	public ArrayList<VOFile> getVOFiles() {
		ArrayList<VOFile> ar = new ArrayList<VOFile>();
		ar.addAll(applicationFileInfo);
		ar.addAll(establishPaperFileInfo);
		ar.addAll(businessPlanFileInfo);
		ar.addAll(accountantNoteFileInfo);
		ar.addAll(form401FileInfo);

		ar.addAll(handoverFileInfo);
		return ar;
	}

	public static String getDBStatusString() {
		String s = "";
		Iterator it = Selects.getCompanyStatusConditionB0().keySet().iterator();
		while (it.hasNext()) {
			String x = (String) it.next();
			s = s + "'" + x + "'";
			if (it.hasNext())
				s = s + ",";
		}
		return s;
	}

	
	public void setResources(HttpServletRequest request){
		setCompStatusRS(request);
		setDomainRS(request);
		setKindRS(request);
		setInnoKindRS(request);
	}
	public boolean getIsNewApplying() {
		return compStatus.equals(STATUS_APPLY);
	}

	public boolean getIsAccepted() {
		return compStatus.equals(STATUS_RECEV);
	}

	public boolean getIsDenied() {
		return compStatus.equals(STATUS_DENY);
	}

	public boolean getIsPass() {
		return compStatus.equals(STATUS_APPLYOK);
	}

	public boolean getIsFail() {
		return compStatus.equals(STATUS_APPLYFAIL);
	}

	public boolean getIsAboutToReview() {
		return compStatus.equals(STATUS_REVIEW);
	}

	// ************************************************************************

	public String getCustomId() {
		return customId;
	}

	public String getAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(String accountStatus) {
		this.accountStatus = accountStatus;
	}

	public void setCustomId(String customId) {
		this.customId = customId;
	}

	public ArrayList getTalkNotes() {
		return talkNotes;
	}

	public void setTalkNotes(ArrayList talkNotes) {
		this.talkNotes = talkNotes;
	}

	public List<MultipartFile> getPaperCheckFiles() {
		return paperCheckFiles;
	}

	public void setPaperCheckFiles(List<MultipartFile> paperCheckFiles) {
		this.paperCheckFiles = paperCheckFiles;
	}

	public ArrayList<VOFile> getPaperFileInfo() {
		return paperFileInfo;
	}

	public void setPaperFileInfo(ArrayList<VOFile> paperFileInfo) {
		this.paperFileInfo = paperFileInfo;
	}

	public List<MultipartFile> getInterviewFiles() {
		return interviewFiles;
	}

	public void setInterviewFiles(List<MultipartFile> interviewFiles) {
		this.interviewFiles = interviewFiles;
	}

	public ArrayList<VOFile> getInterviewFileInfo() {
		return interviewFileInfo;
	}

	public void setInterviewFileInfo(ArrayList<VOFile> interviewFileInfo) {
		this.interviewFileInfo = interviewFileInfo;
	}

	public List<MultipartFile> getHandoverFiles() {
		return handoverFiles;
	}

	public void setHandoverFiles(List<MultipartFile> handoverFiles) {
		this.handoverFiles = handoverFiles;
	}

	public ArrayList<VOFile> getHandoverFileInfo() {
		return handoverFileInfo;
	}

	public void setHandoverFileInfo(ArrayList<VOFile> handoverFileInfo) {
		this.handoverFileInfo = handoverFileInfo;
	}

	public String getAdminContactEmail2() {
		String xx = adminContactEmail.replace(";", "<br>");
		return xx;
	}

	public void setAdminContactEmail2(String adminContactEmail2) {
		this.adminContactEmail2 = adminContactEmail2;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getCompStatus() {
		return compStatus;
	}

	public void setCompStatus(String compStatus) {
		this.compStatus = compStatus;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getCompEngName() {
		return compEngName;
	}

	public void setCompEngName(String compEngName) {
		this.compEngName = compEngName;
	}

	public String getCompShortName() {
		return compShortName;
	}

	public void setCompShortName(String compShortName) {
		this.compShortName = compShortName;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	public MultipartFile getLogoFile() {
		return logoFile;
	}

	public void setLogoFile(MultipartFile logoFile) {
		this.logoFile = logoFile;
	}

	public String getRegisterId() {
		return registerId;
	}

	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}

	public String getRegisterDate() {
		return registerDate;
	}

	// registerDate 民國年
	public String getRegisterDate2() {
		return new DateUtil().getROCDate(getRegisterDate());
	}

	public void setRegisterDate(String registerDate) {
		this.registerDate = registerDate;
	}

	public String getRepresentative() {
		return representative;
	}

	public void setRepresentative(String representative) {
		this.representative = representative;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getDomain() {
		return domain;
	}

	public String getCompAddress() {
		return compAddress;
	}

	public void setCompAddress(String compAddress) {
		this.compAddress = compAddress;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public String getMoveInDate() {
		return moveInDate;
	}

	// 民國年
	public String getMoveInDate2() {
		return new DateUtil().getROCDate(getMoveInDate());
	}

	public void setMoveInDate(String moveInDate) {
		this.moveInDate = moveInDate;
	}

	public String getTotalEmployees() {
		return totalEmployees;
	}

	public void setTotalEmployees(String totalEmployees) {
		this.totalEmployees = totalEmployees;
	}

	public String getRegisterCaptial() {
		return registerCaptial;
	}

	public void setRegisterCaptial(String registerCaptial) {
		this.registerCaptial = registerCaptial;
	}

	public String getActualCaptial() {
		return actualCaptial;
	}

	public void setActualCaptial(String actualCaptial) {
		this.actualCaptial = actualCaptial;
	}

	public String getCompIntroduction() {
		return compIntroduction;
	}

	public void setCompIntroduction(String compIntroduction) {
		this.compIntroduction = compIntroduction;
	}

	public String getCompWebURL() {
		return compWebURL;
	}

	public void setCompWebURL(String compWebURL) {
		this.compWebURL = compWebURL;
	}

	public String getProd() {
		return prod;
	}

	public void setProd(String prod) {
		this.prod = prod;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getRoomArea() {
		return roomArea;
	}

	public void setRoomArea(String roomArea) {
		this.roomArea = roomArea;
	}

	public String getBoss() {
		return boss;
	}

	public void setBoss(String boss) {
		this.boss = boss;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAdminContact() {
		return adminContact;
	}

	public void setAdminContact(String adminContact) {
		this.adminContact = adminContact;
	}

	public String getAdminContactPhone() {
		return adminContactPhone;
	}

	public void setAdminContactPhone(String adminContactPhone) {
		this.adminContactPhone = adminContactPhone;
	}

	public String getAdminContactMobilePhone() {
		return adminContactMobilePhone;
	}

	public void setAdminContactMobilePhone(String adminContactMobilePhone) {
		this.adminContactMobilePhone = adminContactMobilePhone;
	}

	public String getAdminContactEmail() {
		return adminContactEmail;
	}

	public void setAdminContactEmail(String adminContactEmail) {
		this.adminContactEmail = adminContactEmail;
	}

	public String getContractNumber() {
		return contractNumber;
	}

	public void setContractNumber(String contractNumber) {
		this.contractNumber = contractNumber;
	}

	public String getContractStartDate() {
		return contractStartDate;
	}

	// 民國年
	public String getContractStartDate2() {
		return new DateUtil().getROCDate(getContractStartDate());
	}

	public void setContractStartDate(String contractStartDate) {
		this.contractStartDate = contractStartDate;
	}

	public String getContractEndDate() {
		return contractEndDate;
	}

	// 民國年
	public String getContractEndDate2() {
		return new DateUtil().getROCDate(getContractEndDate());
	}

	public void setContractEndDate(String contractEndDate) {
		this.contractEndDate = contractEndDate;
	}

	public String getInnoKind() {
		return innoKind;
	}

	public void setInnoKind(String innoKind) {
		this.innoKind = innoKind;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getMoveOutDate() {
		return moveOutDate;
	}

	// 民國年
	public String getMoveOutDate2() {
		return new DateUtil().getROCDate(getMoveOutDate());
	}

	public void setMoveOutDate(String moveOutDate) {
		this.moveOutDate = moveOutDate;
	}

	public String getMoveOutAddesss() {
		return moveOutAddesss;
	}

	public void setMoveOutAddesss(String moveOutAddesss) {
		this.moveOutAddesss = moveOutAddesss;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getRecCount() {
		return recCount;
	}

	public void setRecCount(String recCount) {
		this.recCount = recCount;
	}

	public List getIpRecs() {
		return ipRecs;
	}

	public void setIpRecs(ArrayList ipRecs) {
		this.ipRecs = ipRecs;
	}

	public List getAwardRecs() {
		return awardRecs;
	}

	public void setAwardRecs(ArrayList awardRecs) {
		this.awardRecs = awardRecs;
	}

	public List getGrantRecs() {
		return grantRecs;
	}

	public void setGrantRecs(ArrayList grantRecs) {
		this.grantRecs = grantRecs;
	}

	public boolean isExist() {
		return exist;
	}

	public void setExist(boolean exist) {
		this.exist = exist;
	}

	public String getAmId() {
		return amId;
	}

	public void setAmId(String amId) {
		this.amId = amId;
	}

	public String getAmName() {
		return amName;
	}

	public void setAmName(String amName) {
		this.amName = amName;
	}

	public String getPmId() {
		return pmId;
	}

	public void setPmId(String pmId) {
		this.pmId = pmId;
	}

	public String getPmName() {
		return pmName;
	}

	public void setPmName(String pmName) {
		this.pmName = pmName;
	}

	public String getReviewPaperUid() {
		return reviewPaperUid;
	}

	public void setReviewPaperUid(String reviewPaperUid) {
		this.reviewPaperUid = reviewPaperUid;
	}

	public String getMemberUid() {
		return memberUid;
	}

	public void setMemberUid(String memberUid) {
		this.memberUid = memberUid;
	}

	public String getDeposit() {
		return deposit;
	}

	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}

	public String getBond() {
		return bond;
	}

	public void setBond(String bond) {
		this.bond = bond;
	}

	public List<MultipartFile> getApplicationFiles() {
		return applicationFiles;
	}

	public void setApplicationFiles(List<MultipartFile> applicationFiles) {
		this.applicationFiles = applicationFiles;
	}

	public ArrayList<VOFile> getApplicationFileInfo() {
		return applicationFileInfo;
	}

	public void setApplicationFileInfo(ArrayList<VOFile> applicationFileInfo) {
		this.applicationFileInfo = applicationFileInfo;
	}

	public List<MultipartFile> getEstablishPaperFiles() {
		return establishPaperFiles;
	}

	public void setEstablishPaperFiles(List<MultipartFile> establishPaperFiles) {
		this.establishPaperFiles = establishPaperFiles;
	}

	public ArrayList<VOFile> getEstablishPaperFileInfo() {
		return establishPaperFileInfo;
	}

	public void setEstablishPaperFileInfo(ArrayList<VOFile> establishPaperFileInfo) {
		this.establishPaperFileInfo = establishPaperFileInfo;
	}

	public List<MultipartFile> getBusinessPlanFiles() {
		return businessPlanFiles;
	}

	public void setBusinessPlanFiles(List<MultipartFile> businessPlanFiles) {
		this.businessPlanFiles = businessPlanFiles;
	}

	public ArrayList<VOFile> getBusinessPlanFileInfo() {
		return businessPlanFileInfo;
	}

	public void setBusinessPlanFileInfo(ArrayList<VOFile> businessPlanFileInfo) {
		this.businessPlanFileInfo = businessPlanFileInfo;
	}

	public List<MultipartFile> getAccountantNoteFiles() {
		return accountantNoteFiles;
	}

	public void setAccountantNoteFiles(List<MultipartFile> accountantNoteFiles) {
		this.accountantNoteFiles = accountantNoteFiles;
	}

	public ArrayList<VOFile> getAccountantNoteFileInfo() {
		return accountantNoteFileInfo;
	}

	public void setAccountantNoteFileInfo(ArrayList<VOFile> accountantNoteFileInfo) {
		this.accountantNoteFileInfo = accountantNoteFileInfo;
	}

	public List<MultipartFile> getForm401Files() {
		return form401Files;
	}

	public void setForm401Files(List<MultipartFile> form401Files) {
		this.form401Files = form401Files;
	}

	public ArrayList<VOFile> getForm401FileInfo() {
		return form401FileInfo;
	}

	public void setForm401FileInfo(ArrayList<VOFile> form401FileInfo) {
		this.form401FileInfo = form401FileInfo;
	}

}
