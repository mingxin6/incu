package com.db;

import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import z.Org;
import z.OrgPerson;
import z.Person;

import com.model.ActivityRec;
import com.model.Administrator;
import com.model.Announcement;
import com.model.AwardRecord;
import com.model.Cashier;
import com.model.Company;
import com.model.CompanyIndex;
import com.model.CompanyUser;
import com.model.Fee;
import com.model.FinancialOfficer;
import com.model.FloorInfo;
import com.model.GrantRecord;
import com.model.IPREC;
import com.model.MeetingRoom;
import com.model.MeetingRoomOrder;
import com.model.Member;
import com.model.Notify;
import com.model.Notifyee;
import com.model.Outsource;
import com.model.ParkingLot;
import com.model.ParkingLotBike;
import com.model.ReviewPaper;
import com.model.ReviewPaperResult;
import com.model.Reviewer;
import com.model.Room;
import com.model.SecurityCard;
import com.model.SharedThing;
import com.model.Staff;
import com.model.Tag;
import com.model.TagRec;
import com.model.TalkNotes;
import com.model.Teacher;
import com.model.User;
import com.utils.KeyMaker;
import com.vo.VOActivityRecSearchCondition;
import com.vo.VOAnnouncementRead;
import com.vo.VOChangeId;
import com.vo.VOCompListCondition_B;
import com.vo.VOFile;
import com.vo.VOFileCondition;
import com.vo.VOLoginInfo;
import com.vo.VOTalkNotesSearchCondition;
import com.vo.VOUserAccountListCondition;

public class MySQLAccessMyBatis {
	private static SqlSessionFactory sqlSessionFactory;
	SqlSession session = null;

	public static SqlSessionFactory getSqlSessionFactory() {
		if (sqlSessionFactory == null) {
			InputStream inputStream = null;
			try {
				inputStream = Resources.getResourceAsStream("com/db/mybatis-config.xml");
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			} catch (IOException e) {
				throw new RuntimeException(e.getCause());
			} finally {
				if (inputStream != null) {
					try {
						inputStream.close();
					} catch (IOException e) {
					}
				}
			}
		}
		return sqlSessionFactory;
	}

	public static SqlSession getSqlSession() {
		return getSqlSessionFactory().openSession();
	}

	public void openSession() {
		this.session = getSqlSessionFactory().openSession();
	}

	public void closeSession() {
		this.session.commit();
		this.session.close();
	}

	public List findTalkNotesByWhereString(DbWhere dbWhere) {
		List recs = session.selectList("com.db.MyTalkNotesMapper.findTalkNotesByWhereString", dbWhere);
		return recs;
	}

	public Announcement findAnnouncementByID(String topicId) {
		Announcement announcement = session.selectOne("com.db.MyAnnouncementMapper.findAnnouncementByID", topicId);
		return announcement;
	}

	public VOAnnouncementRead findReadAnnouncementById(String topicId, String companyID) {
		VOAnnouncementRead vOAnnouncementRead = new VOAnnouncementRead();
		vOAnnouncementRead.announcementID = topicId;
		vOAnnouncementRead.companyID = companyID;
		VOAnnouncementRead obj = session.selectOne("com.db.MyAnnouncementMapper.findReadAnnouncementById",
				vOAnnouncementRead);
		return obj;
	}

	public String findUserCountByLoginId(String loginid) {
		String cnt = session.selectOne("com.db.MyUserAndRoleMapper.findUserCountByLoginId", loginid);
		return cnt;
	}

	public String findUserCountByLoginPwd(String loginPwd) {
		String cnt = session.selectOne("com.db.MyUserAndRoleMapper.findUserCountByLoginPwd", loginPwd);
		return cnt;
	}

	public List findUploadedFiles(String linkedObjId, String type) {
		VOFileCondition vo = new VOFileCondition();
		vo.linkedObjId = linkedObjId;
		vo.type = type;
		List ar = session.selectList("com.db.MyUploadMapper.findUploadedFiles", vo);
		return ar;
	}

	public String findRoleNameFromRoleId(String roleId) {
		String roleName = session.selectOne("com.db.MyUserAndRoleMapper.findRoleNameFromRoleId", roleId);
		return roleName;
	}

	public Company findCompanyByCompId(String compId) {
		Company comp = this.session.selectOne("com.db.MyCompanyMapper.findCompanyByCompId", compId);
		return comp;
	}

	public Company findCompanyB0ByCompId(String compId) {
		Company comp = this.session.selectOne("com.db.MyCompanyB0Mapper.findCompanyB0ByCompId", compId);
		return comp;
	}

	public CompanyUser findCompanyUserByUid(String uid) {
		CompanyUser compUser = this.session.selectOne("com.db.MyCompanyUserMapper.findCompanyUserByUid", uid);
		return compUser;
	}

	public Company findCompanyByCompName(String compName) {
		Company comp = this.session.selectOne("com.db.MyCompanyMapper.findCompanyByCompName", compName);
		return comp;
	}

	public String findCompanyMaxCustomId() {
		String maxCompCustomId = this.session.selectOne("com.db.MyCompanyMapper.findCompanyMaxCustomId");
		return maxCompCustomId;
	}

	public String findCompanyNameByCompId(String compName) {
		String companyName = this.session.selectOne("com.db.MyCompanyMapper.findCompanyNameByCompId", compName);
		return companyName;
	}

	public String findCompanyNameByCompId(String compName, SqlSession sess) {
		String companyName = sess.selectOne("com.db.MyCompanyMapper.findCompanyNameByCompId", compName);
		return companyName;
	}

	public int deleteUser(String uid) {
		int n = this.session.delete("com.db.MyUserAndRoleMapper.deleteUser", uid);
		return n;
	}

	// public List findAllCompanys(HashMap mp) {
	// List recs = session.selectList("com.db.MyCompanyMapper.findAllCompanys", mp);
	// return recs;
	// }

	public int deleteCompanyB0(String compId) {
		int n = this.session.delete("com.db.MyCompanyB0Mapper.deleteCompanyB0", compId);
		return n;
	}

	public List findAllFees() {
		List recs = session.selectList("com.db.MyFeesMapper.findAllFees");
		return recs;
	}

	// public List findAllCompanysByCondition(VOCompListCondition compListCondition) {
	// List recs = session.selectList("com.db.MyCompanyMapper.findAllCompanysByCondition", compListCondition);
	// return recs;
	// }

	public List findCompanyByWhereString(DbWhere where) {
		List recs = session.selectList("com.db.MyCompanyMapper.findCompanyByWhereString", where);
		return recs;
	}

	public List findCompanyUsersByWhereString(DbWhere where) {
		List recs = session.selectList("com.db.MyCompanyUserMapper.findCompanyUsersByWhereString", where);
		return recs;
	}

	public List findCompanyB0ByWhereString(DbWhere where) {
		List recs = session.selectList("com.db.MyCompanyB0Mapper.findCompanyB0ByWhereString", where);
		return recs;
	}

	public List findRoomsByWhereString(DbWhere where) {
		List recs = session.selectList("com.db.MyRoomMapper.findRoomsByWhereString", where);
		return recs;
	}

	public List findNotifyByWhereString(DbWhere where) {
		List recs = session.selectList("com.db.MyNotifyMapper.findNotifyByWhereString", where);
		return recs;
	}

	public List findNotifyeeByWhereString(DbWhere where) {
		List recs = session.selectList("com.db.MyNotifyMapper.findNotifyeeByWhereString", where);
		return recs;
	}

	public List findAllCompanysByCondition_B0(VOCompListCondition_B compListCondition) {
		List recs = session.selectList("com.db.MyCompanyB0Mapper.findAllCompanysByCondition_B0", compListCondition);
		return recs;
	}

	public ArrayList findIPsByCompId(String compId) {
		ArrayList<IPREC> ipRecs = (ArrayList) session.selectList("com.db.MyIpRecordMapper.findIPRECsByCompId", compId);
		return ipRecs;
	}

	public ArrayList findAwardsByCompId(String compId) {
		ArrayList recs = (ArrayList) session.selectList("com.db.MyAwardMapper.findAwardRecordsByCompId", compId);
		return recs;
	}

	public List<Fee> findFeesByYearMonth(String yearMonth) {
		List<Fee> ar = session.selectList("com.db.MyFeesMapper.findFeesByYearMonth", yearMonth);
		return ar;
	}

	public ArrayList findGrantsByCompId(String compId) {
		ArrayList recs = (ArrayList) session.selectList("com.db.MyGrantMapper.findGrantRecordsByCompId", compId);
		return recs;
	}

	public int insertAnnouncement(Announcement snnouncement) {
		int n = this.session.insert("com.db.MyAnnouncementMapper.insertAnnouncement", snnouncement);
		return n;
	}

	public int insertFee(Fee fee) {
		int n = this.session.insert("com.db.MyFeesMapper.insertFee", fee);
		return n;
	}

	public int insertAward(AwardRecord awardRecord) {
		int n = this.session.insert("com.db.MyAwardMapper.insertAwardRecord", awardRecord);
		return n;
	}

	public int insertCompany(Company comp) {
		int n = this.session.insert("com.db.MyCompanyMapper.insertCompany", comp);
		return n;
	}

	public int insertCompanyB0(Company comp) {
		int n = this.session.insert("com.db.MyCompanyB0Mapper.insertCompanyB0", comp);
		return n;
	}

	public int insertCompanyB0Denied(Company comp) {
		int n = this.session.insert("com.db.MyCompanyB0Mapper.insertCompanyB0Denied", comp);
		return n;
	}

	public int insertGrant(GrantRecord grantRecord) {
		int n = this.session.insert("com.db.MyGrantMapper.insertGrantRecord", grantRecord);
		return n;
	}

	public int insertIp(IPREC ipRec) {
		int n = this.session.insert("com.db.MyIpRecordMapper.insertIpRecord", ipRec);
		return n;
	}

	public int insertSharedThing(SharedThing sharedThing) {
		int n = this.session.insert("com.db.MyMapper.insertSharedThing", sharedThing);
		return n;
	}

	public int insertUploadedFileInfo(VOFile uploadedFileInfo) {
		int n = this.session.insert("com.db.MyUploadMapper.insertUploadedFileInfo", uploadedFileInfo);
		return n;
	}

	public int insertUploadedCompanyFileInfo(VOFile uploadedFileInfo) {
		int n = this.session.insert("com.db.MyUploadMapper.insertUploadedCompanyFileInfo", uploadedFileInfo);
		return n;
	}

	public int deleteUploadedFileInfo(String deletedFile) {
		int n = this.session.delete("com.db.MyUploadMapper.deleteUploadedFileInfo", deletedFile);
		return n;
	}

	public int deleteIp(String uid) {
		int n = this.session.delete("com.db.MyIpRecordMapper.deleteIP", uid);
		return n;
	}

	public int deleteAward(String uid) {
		int n = this.session.delete("com.db.MyAwardMapper.deleteAward", uid);
		return n;
	}

	public int deleteGrant(String uid) {
		int n = this.session.delete("com.db.MyGrantMapper.deleteGrant", uid);
		return n;
	}

	public int updateAnnouncement(Announcement announcement) {
		int n = this.session.update("com.db.MyAnnouncementMapper.updateAnnouncement", announcement);
		return n;
	}

	public int updateIp(IPREC ipRec) {
		int n = this.session.update("com.db.MyIpRecordMapper.updateIp", ipRec);
		return n;
	}

	public int updateAward(AwardRecord awardRecord) {
		int n = this.session.update("com.db.MyAwardMapper.updateAward", awardRecord);
		return n;
	}

	public int updateGrant(GrantRecord grantRecord) {
		int n = this.session.update("com.db.MyGrantMapper.updateGrant", grantRecord);
		return n;
	}

	public int updateFee(Fee fee) {
		int n = this.session.update("com.db.MyFeesMapper.updateFee", fee);
		return n;
	}

	public int updateCompany(Company comp) {
		int n = this.session.update("com.db.MyCompanyMapper.updateCompany", comp);
		return n;
	}

	public int updateCompanyB0(Company comp) {
		int n = this.session.update("com.db.MyCompanyB0Mapper.updateCompanyB0", comp);
		return n;
	}

	// public int updateCompIdOfCompanyTable(String oldId, String newId) {
	// VOChangeId voChangeId = new VOChangeId();
	// voChangeId.setOldId(oldId);
	// voChangeId.setNewId(newId);
	// int n = this.session.update("com.db.MyCompanyMapper.updateCompIdOfCompanyTable", voChangeId);
	// return n;
	// }

	public int updateCompIdOfUploadedFilesTable(String oldId, String newId) {
		VOChangeId voChangeId = new VOChangeId();
		voChangeId.setOldId(oldId);
		voChangeId.setNewId(newId);
		int n = this.session.update("com.db.MyUploadMapper.updateCompIdOfUploadedFilesTable", voChangeId);
		return n;
	}

	public int updateCompStatus(String compId, String compStatus) {
		HashMap mp = new HashMap();
		mp.put("compId", compId);
		mp.put("compStatus", compStatus);
		int n = this.session.update("com.db.MyCompanyMapper.updateCompStatus", mp);
		return n;
	}

	public int updateCompStatusB0(String compId, String compStatus) {
		HashMap mp = new HashMap();
		mp.put("compId", compId);
		mp.put("compStatus", compStatus);
		int n = this.session.update("com.db.MyCompanyB0Mapper.updateCompStatusB0", mp);
		return n;
	}

	public int updateCompStatusB0nSaveReviewPaperUid(String compId, String compStatus, String reviewPaperUid) {
		HashMap mp = new HashMap();
		mp.put("compId", compId);
		mp.put("compStatus", compStatus);
		mp.put("reviewPaperUid", reviewPaperUid);
		int n = this.session.update("com.db.MyCompanyB0Mapper.updateCompStatusB0nSaveReviewPaperUid", mp);
		return n;
	}

	public int updateReviewPaperStatus(String reviewPaperUid, String status) {
		HashMap mp = new HashMap();
		mp.put("reviewPaperUid", reviewPaperUid);
		mp.put("status", status);
		int n = this.session.update("com.db.MyReviewPaperMapper.updateReviewPaperStatus", mp);
		return n;
	}

	public int updateReviewPaper(ReviewPaper reviewPaper) {
		int n = this.session.update("com.db.MyReviewPaperMapper.updateReviewPaper", reviewPaper);
		return n;
	}

	public int denyNewApply(Company comp) {
		HashMap mp = new HashMap();
		mp.put("compId", comp.getUid());
		mp.put("compStatus", Company.STATUS_DENY);
		mp.put("remark", comp.getRemark());

		int n = this.session.update("com.db.MyCompanyB0Mapper.denyNewApply", mp);
		return n;
	}

	// jason;s
	public List<CompanyIndex> findAllCompanysIndex() {
		List<CompanyIndex> ciList = session.selectList("com.db.MyMapper.findAllCompanysIndex");
		return ciList;
	}

	public List<FloorInfo> findAllFloorInfo() {
		List<FloorInfo> fiList = session.selectList("com.db.MyMapper.findAllFloorInfo");
		return fiList;
	}

	public List<String> readUserAuthByID(String personUid) {
		List<String> list = session.selectList("com.db.MyUserAndRoleMapper.readUserAuthByID", personUid);
		return list;
	}

	// public int findTotalCompanys(VOCompListCondition conditionVO) {
	// int count = session.selectOne("com.db.MyCompanyMapper.findTotalCompanysByCondition", conditionVO);
	// return count;
	// }

	public List findCompanyB0ByMemberUid(String memberUid) {
		List comps = session.selectList("com.db.MyCompanyB0Mapper.findCompanyB0ByMemberUid", memberUid);
		return comps;
	}

	public int findTotalService() {
		int count = session.selectOne("com.db.MyMapper.findTotalService");
		return count;
	}

	public Org findOrgByUid(String orgUid) {
		Org org = session.selectOne("com.db.MyOrgMapper.findOrgByUid", orgUid);
		return org;
	}

	public List<Org> findOrgsByParantUid(String orgUid) {
		List<Org> list = session.selectList("com.db.MyOrgMapper.findOrgsByParantUid", orgUid);
		return list;
	}

	public List<Person> findPersonByOrgUid(String orgUid) {
		List<Person> list = session.selectList("com.db.MyPersonMapper.findPersonByOrgUid", orgUid);
		return list;
	}

	public List<OrgPerson> findOrgPersonByPersonUid(String personUid) {
		List<OrgPerson> list = session.selectList("com.db.MyOrgPersonMapper.findOrgPersonByPersonUid", personUid);
		return list;
	}

	public List<User> findUsersByConditions(VOUserAccountListCondition c) {
		List<User> list = session.selectList("com.db.MyUserAndRoleMapper.findUsersByConditions", c);
		return list;
	}

	public List<OrgPerson> findOrgPersonByOrgUid(String orgUid) {
		List<OrgPerson> list = session.selectList("com.db.MyOrgPersonMapper.findOrgPersonByOrgUid", orgUid);
		return list;
	}

	public Person findPersonByUid(String personUid) {
		Person person = session.selectOne("com.db.MyPersonMapper.findPersonByUid", personUid);
		return person;
	}

	public User findUserByLoginIdAndPwd(String loginid, String loginPwd) {
		VOLoginInfo vo = new VOLoginInfo();
		vo.userLoginId = loginid;
		vo.userLoginPwd = loginPwd;
		User user = session.selectOne("com.db.MyUserAndRoleMapper.findUserByLoginIdAndPwd", vo);
		return user;
	}

	public User findUsersByUid(String userId) {
		User user = session.selectOne("com.db.MyUserAndRoleMapper.findUsersByUid", userId);
		return user;
	}

	public int updateUser(User user) {
		int n = this.session.update("com.db.MyUserAndRoleMapper.updateUser", user);
		return n;
	}

	public int updateReviewPaperResult(ReviewPaperResult reviewPaperResult) {
		int n = this.session.update("com.db.MyReviewPaperMapper.updateReviewPaperResult", reviewPaperResult);
		return n;
	}

	public int insertUser(User user) {
		int n = this.session.insert("com.db.MyUserAndRoleMapper.insertUser", user);
		return n;
	}

	public int insertCompanyUser(CompanyUser compuser) {
		int n = this.session.insert("com.db.MyCompanyUserMapper.insertCompanyUser", compuser);
		return n;
	}

	public int insertNotify(Notify notify) {
		int n = this.session.insert("com.db.MyNotifyMapper.insertNotify", notify);
		return n;
	}

	public int insertNotifyee(Notifyee notifyee) {
		int n = this.session.insert("com.db.MyNotifyMapper.insertNotifyee", notifyee);
		return n;
	}

	// ************************************************************************
	// TalkNote

	public int findTalkNoteCount() {
		int cnt = session.selectOne("com.db.MyTalkNotesMapper.findTalkNoteCount");
		return cnt;
	}

	public String findVisitCount(String compId) {
		String cnt = session.selectOne("com.db.MyTalkNotesMapper.findVisitCount", compId);
		return cnt;
	}

	public String findVisitCount2(Map map) {
		String cnt = session.selectOne("com.db.MyTalkNotesMapper.findVisitCount2", map);
		return cnt;
	}

	public String findVisitCount3(Map map) {
		String cnt = session.selectOne("com.db.MyTalkNotesMapper.findVisitCount3", map);

		return cnt;
	}

	public TalkNotes findTalkNotesById(String talkNoteId) {
		TalkNotes obj = session.selectOne("com.db.MyTalkNotesMapper.findTalkNotesById", talkNoteId);
		return obj;
	}

	public List findTalkNotesByCompanyId(String compId) {
		List ar = session.selectList("com.db.MyTalkNotesMapper.findTalkNotesByCompanyId", compId);
		return ar;
	}

	public List findTalkNotesBySearch(VOTalkNotesSearchCondition c) {
		List ar = session.selectList("com.db.MyTalkNotesMapper.findTalkNotesBySearch", c);
		return ar;
	}

	public int insertTalkNotes(TalkNotes talkNotes) {
		int n = this.session.insert("com.db.MyTalkNotesMapper.insertTalkNotes", talkNotes);
		return n;
	}

	public int updateTalkNotes(TalkNotes talkNotes) {
		int n = this.session.update("com.db.MyTalkNotesMapper.updateTalkNotes", talkNotes);
		return n;
	}

	public int updateTalkNotesScoreAndStatus(TalkNotes talkNotes) {
		int n = this.session.update("com.db.MyTalkNotesMapper.updateTalkNotesScoreAndStatus", talkNotes);
		return n;
	}

	public int updateComapnyIdForStatusTransfer(String oldId, String newId) {
		VOChangeId voChangeId = new VOChangeId();
		voChangeId.setOldId(oldId);
		voChangeId.setNewId(newId);
		int n = this.session.update("com.db.MyTalkNotesMapper.updateComapnyIdForStatusTransfer", voChangeId);
		return n;
	}

	public List findTalkNotesByTagWhereString(DbWhere dbWhere) {
		List recs = session.selectList("com.db.MyTalkNotesMapper.findTalkNotesByTagWhereString", dbWhere);
		return recs;
	}

	// ************************************************************************
	// ActivityRec

	public List findActivityRecBySearch(VOActivityRecSearchCondition voActivityRecSearchCondition) {
		List ar = session
				.selectList("com.db.MyActivityRecMapper.findActivityRecBySearch", voActivityRecSearchCondition);
		return ar;
	}

	public ActivityRec findActivityRecById(String uid) {
		ActivityRec obj = session.selectOne("com.db.MyActivityRecMapper.findActivityRecById", uid);
		return obj;
	}

	public int insertActivityRec(ActivityRec activityRec) {
		int n = session.insert("com.db.MyActivityRecMapper.insertActivityRec", activityRec);
		return n;
	}

	public int updateActivityRec(ActivityRec activityRec) {
		int n = session.update("com.db.MyActivityRecMapper.updateActivityRec", activityRec);
		return n;
	}

	// ************************************************************************
	// MeetingRoom

	public List findAllMeetingRooms() {
		List recs = session.selectList("com.db.MyMeetingRoomMapper.findAllMeetingRooms");
		return recs;
	}

	public List findAllMeetingRoomsOK() {
		List recs = session.selectList("com.db.MyMeetingRoomMapper.findAllMeetingRoomsOK");
		return recs;
	}

	public MeetingRoom findMeetingRoomById(String uid) {
		MeetingRoom obj = session.selectOne("com.db.MyMeetingRoomMapper.findMeetingRoomById", uid);
		return obj;
	}

	public int insertMeetingRoom(MeetingRoom meetingRoom) {
		int n = this.session.insert("com.db.MyMeetingRoomMapper.insertMeetingRoom", meetingRoom);
		return n;
	}

	public int updateMeetingRoom(MeetingRoom meetingRoom) {
		int n = this.session.update("com.db.MyMeetingRoomMapper.updateMeetingRoom", meetingRoom);
		return n;
	}

	public int deleteMeetingRoom(String uid) {
		int n = this.session.delete("com.db.MyMeetingRoomMapper.deleteMeetingRoom", uid);
		return n;
	}

	// ************************************************************************
	// MeetingRoomOrder

	public List findAllMeetingRoomOrders() {
		List recs = session.selectList("com.db.MyMeetingRoomOrderMapper.findAllMeetingRoomOrders");
		return recs;
	}

	public MeetingRoomOrder findMeetingRoomOrderById(String uid) {
		MeetingRoomOrder obj = session.selectOne("com.db.MyMeetingRoomOrderMapper.findMeetingRoomOrderById", uid);
		return obj;
	}

	public List findMeetingRoomOrderByRoomNo(String meetingRoomNo) {
		List recs = session.selectList("com.db.MyMeetingRoomOrderMapper.findMeetingRoomOrderByRoomNo", meetingRoomNo);
		return recs;
	}

	public int insertMeetingRoomOrder(MeetingRoomOrder meetingRoomOrder) {
		int n = this.session.insert("com.db.MyMeetingRoomOrderMapper.insertMeetingRoomOrder", meetingRoomOrder);
		return n;
	}

	public int deleteMeetingRoomOrder(String uid) {
		int n = this.session.delete("com.db.MyMeetingRoomOrderMapper.deleteMeetingRoomOrder", uid);
		return n;
	}

	// ************************************************************************
	// Outsource
	public List findAllOutsources() {
		List recs = session.selectList("com.db.MyOutsourceMapper.findAllOutsources");
		return recs;
	}

	public Outsource findOutsourceById(String uid) {
		Outsource obj = session.selectOne("com.db.MyOutsourceMapper.findOutsourceById", uid);
		return obj;
	}

	public int insertOutsources(Outsource outsource) {
		int n = this.session.insert("com.db.MyOutsourceMapper.insertOutsources", outsource);
		return n;
	}

	public int updateOutsource(Outsource outsource) {
		int n = this.session.update("com.db.MyOutsourceMapper.updateOutsource", outsource);
		return n;
	}

	public int deleteOutsource(String uid) {
		int n = this.session.delete("com.db.MyOutsourceMapper.deleteOutsource", uid);
		return n;
	}

	// ************************************************************************
	// ParkingLot

	public List findAllParkingLots() {
		List recs = session.selectList("com.db.MyParkingLotMapper.findAllParkingLots");
		return recs;
	}

	public ParkingLot findParkingLotById(String uid) {
		ParkingLot obj = session.selectOne("com.db.MyParkingLotMapper.findParkingLotById", uid);
		return obj;
	}

	public ParkingLot findParkingLotByUser(String usedby) {
		ParkingLot obj = session.selectOne("com.db.MyParkingLotMapper.findParkingLotByUser", usedby);
		return obj;
	}

	public int insertParkingLots(ParkingLot parkingLot) {
		int n = this.session.insert("com.db.MyParkingLotMapper.insertParkingLots", parkingLot);
		return n;
	}

	public int updateParkingLot(ParkingLot parkingLot) {
		int n = this.session.update("com.db.MyParkingLotMapper.updateParkingLot", parkingLot);
		return n;
	}

	public int deleteParkingLot(String uid) {
		int n = this.session.delete("com.db.MyParkingLotMapper.deleteParkingLot", uid);
		return n;
	}

	// ************************************************************************
	// ParkingLotBike

	public List findAllParkingLotBikes() {
		List recs = session.selectList("com.db.MyParkingLotBikeMapper.findAllParkingLotBikes");
		return recs;
	}

	public ParkingLotBike findParkingLotBikeById(String uid) {
		ParkingLotBike obj = session.selectOne("com.db.MyParkingLotBikeMapper.findParkingLotBikeById", uid);
		return obj;
	}

	public ParkingLotBike findParkingLotBikeByUser(String usedby) {
		ParkingLotBike obj = session.selectOne("com.db.MyParkingLotBikeMapper.findParkingLotBikeByUser", usedby);
		return obj;
	}

	public int insertParkingLotBikes(ParkingLotBike parkingLotBike) {

		int n = this.session.insert("com.db.MyParkingLotBikeMapper.insertParkingLotBikes", parkingLotBike);
		return n;
	}

	public int updateParkingLotBike(ParkingLotBike parkingLotBike) {
		int n = this.session.update("com.db.MyParkingLotBikeMapper.updateParkingLotBike", parkingLotBike);
		return n;
	}

	public int deleteParkingLotBike(String uid) {
		int n = this.session.delete("com.db.MyParkingLotBikeMapper.deleteParkingLotBike", uid);
		return n;
	}

	// ************************************************************************
	// Reviewer

	public List findAllReviewers() {
		List recs = session.selectList("com.db.MyReviewerMapper.findAllReviewers");
		return recs;
	}

	public Reviewer findReviewerById(String uid) {
		Reviewer obj = session.selectOne("com.db.MyReviewerMapper.findReviewerById", uid);
		return obj;
	}

	public List findReviewPapersByWhereString(DbWhere dbWhere) {
		List recs = session.selectList("com.db.MyReviewPaperMapper.findReviewPapersByWhereString", dbWhere);
		return recs;
	}

	public List findReviewPaperResultsByWhereString(DbWhere dbWhere) {
		List recs = session.selectList("com.db.MyReviewPaperMapper.findReviewPaperResultsByWhereString", dbWhere);
		return recs;
	}

	public int insertReviewers(Reviewer reviewer) {
		int n = this.session.insert("com.db.MyReviewerMapper.insertReviewers", reviewer);
		return n;
	}

	public int insertReviewPaper(ReviewPaper reviewPaper) {
		int n = this.session.insert("com.db.MyReviewPaperMapper.insertReviewPaper", reviewPaper);
		return n;
	}

	public int insertReviewPaperResult(ReviewPaperResult reviewPaperResult) {
		int n = this.session.insert("com.db.MyReviewPaperMapper.insertReviewPaperResult", reviewPaperResult);
		return n;
	}

	public int updateReviewer(Reviewer reviewer) {
		int n = this.session.update("com.db.MyReviewerMapper.updateReviewer", reviewer);
		return n;
	}

	// public int deleteReviewer(Reviewer reviewer) {
	// int n = this.session.delete("com.db.MyReviewerMapper.deleteReviewer", reviewer);
	// return n;
	// }

	// ************************************************************************
	// Room

	public List findAllRooms() {
		List recs = session.selectList("com.db.MyRoomMapper.findAllRooms");
		return recs;
	}

	public Room findRoomById(String uid) {
		Room obj = session.selectOne("com.db.MyRoomMapper.findRoomById", uid);
		return obj;
	}

	public List findRoomByCompId(String compId) {
		List recs = session.selectList("com.db.MyRoomMapper.findRoomByCompId", compId);
		return recs;
	}

	public int insertRooms(Room room) {
		int n = this.session.insert("com.db.MyRoomMapper.insertRooms", room);
		return n;
	}

	public int updateRoom(Room room) {
		int n = this.session.update("com.db.MyRoomMapper.updateRoom", room);
		return n;
	}

	public int deleteRoom(String uid) {
		int n = this.session.delete("com.db.MyRoomMapper.deleteRoom", uid);
		return n;
	}

	public int deleteReviewPaperResult(String uid) {
		int n = this.session.delete("com.db.MyReviewPaperMapper.deleteReviewPaperResult", uid);
		return n;
	}

	public int deleteReviewPaper(String uid) {
		int n = this.session.delete("com.db.MyReviewPaperMapper.deleteReviewPaper", uid);
		return n;
	}

	public int deleteReviewPaperResultByReviewPaperUid(String reviewPaperUid) {
		int n = this.session.delete("com.db.MyReviewPaperMapper.deleteReviewPaperResultByReviewPaperUid",
				reviewPaperUid);
		return n;
	}

	// ************************************************************************
	// SecurityCard

	public List findAllSecurityCards() {
		List recs = session.selectList("com.db.MySecurityCardMapper.findAllSecurityCards");
		return recs;
	}

	public SecurityCard findSecurityCardById(String uid) {
		SecurityCard obj = session.selectOne("com.db.MySecurityCardMapper.findSecurityCardById", uid);
		return obj;
	}

	public SecurityCard findSecurityCardByUser(String user) {
		SecurityCard obj = session.selectOne("com.db.MySecurityCardMapper.findSecurityCardByUser", user);
		return obj;
	}

	public int insertSecurityCards(SecurityCard securityCard) {
		int n = this.session.insert("com.db.MySecurityCardMapper.insertSecurityCards", securityCard);
		return n;
	}

	public int updateSecurityCard(SecurityCard securityCard) {
		int n = this.session.update("com.db.MySecurityCardMapper.updateSecurityCard", securityCard);
		return n;
	}

	public int deleteSecurityCard(String uid) {
		int n = this.session.delete("com.db.MySecurityCardMapper.deleteSecurityCard", uid);
		return n;
	}

	// ************************************************************************
	// Teacher

	public List findAllTeachers() {
		List recs = session.selectList("com.db.MyTeacherMapper.findAllTeachers");
		return recs;
	}

	public Teacher findTeacherById(String uid) {
		Teacher obj = session.selectOne("com.db.MyTeacherMapper.findTeacherById", uid);
		return obj;
	}

	public int insertTeachers(Teacher teacher) {
		int n = this.session.insert("com.db.MyTeacherMapper.insertTeachers", teacher);
		return n;
	}

	public int updateTeacher(Teacher teacher) {
		int n = this.session.update("com.db.MyTeacherMapper.updateTeacher", teacher);
		return n;
	}

	public int deleteTeacher(String uid) {
		int n = this.session.delete("com.db.MyTeacherMapper.deleteTeacher", uid);
		return n;
	}

	// public List findAllCompanysWithoutCondition() {
	// List recs = session.selectList("com.db.MyCompanyMapper.findAllCompanysWithoutCondition");
	// return recs;
	// }
	//
	// public int updateCompanyBAK(Company c) {
	// int n = session.update("com.db.MyCompanyMapper.updateCompanyBAK",c);
	// return n;
	// }

	// ************************************************************************
	// Staff

	public List findAllStaffs() {
		List recs = session.selectList("com.db.MyStaffMapper.findAllStaffs");
		return recs;
	}

	public List findStaffsByWhereString(DbWhere where) {
		List recs = session.selectList("com.db.MyStaffMapper.findStaffsByWhereString", where);
		return recs;
	}

	public Staff findStaffById(String uid) {
		Staff obj = session.selectOne("com.db.MyStaffMapper.findStaffById", uid);
		return obj;
	}

	public Staff findStaffByIdOK(String uid) {
		Staff obj = session.selectOne("com.db.MyStaffMapper.findStaffByIdOK", uid);
		return obj;
	}

	public int insertStaffs(Staff staff) {
		int n = this.session.insert("com.db.MyStaffMapper.insertStaffs", staff);
		return n;
	}

	public int updateStaff(Staff staff) {
		int n = this.session.update("com.db.MyStaffMapper.updateStaff", staff);
		return n;
	}

	public int deleteStaff(String uid) {
		int n = this.session.delete("com.db.MyStaffMapper.deleteStaff", uid);
		return n;
	}

	// ************************************************************************
	// CompanyUser

	public List findAllCompanyUsers() {
		List recs = session.selectList("com.db.MyCompanyUserMapper.findAllCompanyUsers");
		return recs;
	}

	public List findCompanyUserByWhereString(DbWhere where) {
		List recs = session.selectList("com.db.MyCompanyUserMapper.findCompanyUserByWhereString", where);
		return recs;
	}

	public CompanyUser findCompanyUserById(String uid) {
		CompanyUser obj = session.selectOne("com.db.MyCompanyUserMapper.findCompanyUserById", uid);
		return obj;
	}

	public int insertCompanyUsers(CompanyUser companyUser) {
		int n = this.session.insert("com.db.MyCompanyUserMapper.insertCompanyUsers", companyUser);
		return n;
	}

	public int updateCompanyUser(CompanyUser companyUser) {
		int n = this.session.update("com.db.MyCompanyUserMapper.updateCompanyUser", companyUser);
		return n;
	}

	public int deleteCompanyUser(String uid) {
		int n = this.session.delete("com.db.MyCompanyUserMapper.deleteCompanyUser", uid);
		return n;
	}

	// ************************************************************************
	// Member

	public List findAllMembers() {
		List recs = session.selectList("com.db.MyMemberMapper.findAllMembers");
		return recs;
	}

	public Member findMemberById(String uid) {
		Member obj = session.selectOne("com.db.MyMemberMapper.findMemberById", uid);
		return obj;
	}

	public int insertMembers(Member member) {
		int n = this.session.insert("com.db.MyMemberMapper.insertMembers", member);
		return n;
	}

	public int updateMember(Member member) {
		int n = this.session.update("com.db.MyMemberMapper.updateMember", member);
		return n;
	}

	public int deleteMember(String uid) {
		int n = this.session.delete("com.db.MyMemberMapper.deleteMember", uid);
		return n;
	}

	// ************************************************************************
	// FinancialOfficer

	public List findAllFinancialOfficers() {
		List recs = session.selectList("com.db.MyFinancialOfficerMapper.findAllFinancialOfficers");
		return recs;
	}

	public FinancialOfficer findFinancialOfficerById(String uid) {
		FinancialOfficer obj = session.selectOne("com.db.MyFinancialOfficerMapper.findFinancialOfficerById", uid);
		return obj;
	}

	public int insertFinancialOfficers(FinancialOfficer financialOfficer) {
		int n = this.session.insert("com.db.MyFinancialOfficerMapper.insertFinancialOfficers", financialOfficer);
		return n;
	}

	public int updateFinancialOfficer(FinancialOfficer financialOfficer) {
		int n = this.session.update("com.db.MyFinancialOfficerMapper.updateFinancialOfficer", financialOfficer);
		return n;
	}

	public int deleteFinancialOfficer(String uid) {
		int n = this.session.delete("com.db.MyFinancialOfficerMapper.deleteFinancialOfficer", uid);
		return n;
	}

	// ************************************************************************
	// Cashier

	public List findAllCashiers() {
		List recs = session.selectList("com.db.MyCashierMapper.findAllCashiers");
		return recs;
	}

	public Cashier findCashierById(String uid) {
		Cashier obj = session.selectOne("com.db.MyCashierMapper.findCashierById", uid);
		return obj;
	}

	public int insertCashiers(Cashier cashier) {
		int n = this.session.insert("com.db.MyCashierMapper.insertCashiers", cashier);
		return n;
	}

	public int updateCashier(Cashier cashier) {
		int n = this.session.update("com.db.MyCashierMapper.updateCashier", cashier);
		return n;
	}

	public int deleteCashier(String uid) {
		int n = this.session.delete("com.db.MyCashierMapper.deleteCashier", uid);
		return n;
	}

	// ************************************************************************
	// Administrator

	public List findAllAdministrators() {
		List recs = session.selectList("com.db.MyAdministratorMapper.findAllAdministrators");
		return recs;
	}

	public Administrator findAdministratorById(String uid) {
		Administrator obj = session.selectOne("com.db.MyAdministratorMapper.findAdministratorById", uid);
		return obj;
	}

	public int insertAdministrators(Administrator administrator) {
		int n = this.session.insert("com.db.MyAdministratorMapper.insertAdministrators", administrator);
		return n;
	}

	public int updateAdministrator(Administrator administrator) {
		int n = this.session.update("com.db.MyAdministratorMapper.updateAdministrator", administrator);
		return n;
	}

	public int deleteAdministrator(String uid) {
		int n = this.session.delete("com.db.MyAdministratorMapper.deleteAdministrator", uid);
		return n;
	}

	// ************************************************************************
	// Tag

	public List findTagsByUid(String userUid) {
		List recs = session.selectList("com.db.MyTagMapper.findTagsByUid", userUid);
		return recs;
	}

	public int insertTags(Tag tag) {
		int n = this.session.insert("com.db.MyTagMapper.insertTags", tag);
		return n;
	}

	public int deleteTagByUid(String userUid) {
		int n = this.session.delete("com.db.MyTagMapper.deleteTagByUid", userUid);
		return n;
	}

	public List findTalkNoteTagRecsByWhereString(DbWhere where) {
		List recs = session.selectList("com.db.MyTagMapper.findTalkNoteTagRecsByWhereString", where);
		return recs;
	}

	public int insertTagRec(TagRec tagRec) {
		int n = this.session.insert("com.db.MyTagMapper.insertTagRec", tagRec);
		return n;
	}

	public int deleteTagRec(TagRec tagRec) {
		int n = this.session.delete("com.db.MyTagMapper.deleteTagRec", tagRec);
		return n;
	}

	// ************************************************************************
	public static void main(String[] args) throws ParseException {
		{// keep
			// MySQLAccessMyBatis o = new MySQLAccessMyBatis();
			// o.openSession();
			// String personUid = "111";
			// Person p = o.findPersonByUid(personUid);
			// TreeSet set = p.getPersonUidSet(o);
			// System.out.println(set.toString());
			// o.closeSession();

		}

		MySQLAccessMyBatis o = new MySQLAccessMyBatis();
		o.openSession();

		{
			StringBuffer sb = new StringBuffer();
			sb.append(" 1=1 ");
			sb.append(" AND companystatus='STATUS_MOVEIN'");
			sb.append(" order by CompanyName ");

			DbWhere d = new DbWhere();
			d.setWhere(sb.toString());

			ArrayList list = (ArrayList) o.findCompanyByWhereString(d);

			System.out.println("list size=" + list.size());
			NumberFormat formatter = new DecimalFormat("0000");
			for (int i = 67; i < 100; i++) {
				// /Company c = (Company) list.get(i);
				ParkingLotBike p = new ParkingLotBike();
				p.setUid("ParkingLotBike" + KeyMaker.newKey());
				p.setParkingLotBikeNo("B" + formatter.format(i));
				// p.setUsedBy(c.getCompName());
				p.setStatus("ok");
				o.insertParkingLotBikes(p);
			}
		}

		// {
		// ArrayList list = (ArrayList) o.findAllRooms();
		// for (int i = 0; i < list.size(); i++) {
		// Room c = (Room) list.get(i);
		// String compId = c.getCompId();
		// Company com = o.findCompanyByCompId(compId);
		// if (com == null)
		// continue;
		// c.setCompCustomid(com.getCustomId());
		// c.setCompName(com.getCompName());
		//
		// o.updateRoom(c);
		// }
		// }
		o.closeSession();

		System.out.println("done ");
	}
}
