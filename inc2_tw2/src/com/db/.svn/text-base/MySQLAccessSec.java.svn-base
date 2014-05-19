package com.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.model.Activity;
import com.model.Actvisitor;
import com.model.CompanyIntro;
import com.model.EquipmentAccept;
import com.model.EquipmentData;
import com.model.ManagementDept;
import com.model.ServiceResourceAccept;
import com.model.ServiceResourceData;
import com.model.SharedResources;
import com.model.UploadedFile;

public class MySQLAccessSec extends DB {

	private Statement stmt = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	public Connection  getConn(){
		return this.conn;
	}
	

	@Override
	public void connectDB() {
		// TODO Auto-generated method stub
		super.connectDB();
	}


	public void closeDB() {
		try {
			if (rs != null) {
				rs.close();
			}
	
			if (stmt != null) {
				stmt.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
	
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
	
		}
	}
	/**
	 * 
	 * Begin of 园区部门DB操作
	 */
	public void insertManagementDept(ManagementDept obj) throws SQLException {

		String sql = "insert into ManagementDept(" + "MDID" + "," + "MANAGEMENT" + "," + "DEPARTMENT" + "," + "DUTY"
				+ "," + "CONTACTS" + "," + "TEL" + ") values ( ?,?,?,?,?,? )";

		connectDB();

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, obj.getMdid());
		pstmt.setString(2, obj.getManagement());
		pstmt.setString(3, obj.getDepartment().trim());
		pstmt.setString(4, obj.getDuty());
		pstmt.setString(5, obj.getContacts());
		pstmt.setString(6, obj.getTel());

		System.out.println(sql);

		pstmt.executeUpdate();

		closeDB();
	}

	public void updateManagementDept(ManagementDept obj) throws Exception {

		String sql = "update ManagementDept set " + "MANAGEMENT=? " + ", DEPARTMENT=? " + ", DUTY=? " + ", CONTACTS=? "
				+ ", TEL=? " + " WHERE MDID=?";

		connectDB();
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, obj.getManagement());
		pstmt.setString(2, obj.getDepartment().trim());
		pstmt.setString(3, obj.getDuty());
		pstmt.setString(4, obj.getContacts());
		pstmt.setString(5, obj.getTel());
		pstmt.setString(6, obj.getMdid());
		pstmt.executeUpdate();
		System.out.println("更新update" + obj.getMdid() + "---" + obj.getDepartment());

		closeDB();
	}

	private ManagementDept fillManagementDept(ResultSet rs) {

		ManagementDept obj = new ManagementDept();

		try {
			obj.setMdid(rs.getString("MDID"));
			obj.setManagement(rs.getString("MANAGEMENT"));
			obj.setDepartment(rs.getString("DEPARTMENT"));
			obj.setDuty(rs.getString("DUTY"));
			obj.setContacts(rs.getString("CONTACTS"));
			obj.setTel(rs.getString("TEL"));

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return obj;
	}

	public ManagementDept readManagementDeptByID(String mdid) {
		ManagementDept obj = new ManagementDept();
		String sql = "select * FROM ManagementDept where MDID=?";

		try {
			connectDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mdid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				obj = this.fillManagementDept(rs);
			}
			System.out.println("----------" + obj.getDepartment() + "部门" + obj.getDuty());
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
			return new ManagementDept();
		} finally {
			closeDB();
		}
	}

	public List<ManagementDept> readManagementDeptList() throws Exception {
		List<ManagementDept> returnList = new ArrayList<ManagementDept>();
		try {

			connectDB();
			String sql = "select * FROM managementdept where 1=1 order by MDID desc";
			this.pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			rs = pstmt.executeQuery();

			int n = 1;
			while (rs.next()) {
				ManagementDept obj = this.fillManagementDept(rs);
				obj.setSeq(n + "");
				returnList.add(obj);
				n++;
			}

			return returnList;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}
	
	public boolean hasManagementDeptName(String str)  {
		boolean backValue = true;
		try {

			connectDB();
			String sql = "select * FROM managementdept where 1=1 and department = ? order by MDID desc";
			this.pstmt = conn.prepareStatement(sql);
			this.pstmt.setString(1, str.trim());
			System.out.println(sql);
			rs = pstmt.executeQuery();
			if(false == rs.next()){
				backValue = false;
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return backValue;

	}

	/**
	 * 
	 * End of 园区部门DB操作
	 */
	/**
	 * 
	 * Begin of 园区交流活动DB操作
	 */
	public void insertActivity(Activity obj) throws SQLException {

		String sql = "insert into Activity(" + "AID" + "," + "THEME" + "," + "SPONSOR" + "," + "LECTURER" + ","
				+ "LECTURERINTRO" + "," + "REMARKS" + ") values ( ?,?,?,?,?,? )";

		connectDB();

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, obj.getAid());
		pstmt.setString(2, obj.getTheme());
		pstmt.setString(3, obj.getSponsor());
		pstmt.setString(4, obj.getLecturer());
		pstmt.setString(5, obj.getLecturerintro());
		pstmt.setString(6, obj.getRemarks());

		System.out.println(sql);

		pstmt.executeUpdate();

		closeDB();
	}

	public void updateActivity(Activity obj) throws Exception {
		String sql = "update Activity set " + "THEME=? " + ", SPONSOR=? " + ", LECTURER=? " + ", LECTURERINTRO=? "
				+ ", REMARKS=? " + " WHERE AID=?";

		connectDB();
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(6, obj.getAid());
		pstmt.setString(1, obj.getTheme());
		pstmt.setString(2, obj.getSponsor());
		pstmt.setString(3, obj.getLecturer());
		pstmt.setString(4, obj.getLecturerintro());
		pstmt.setString(5, obj.getRemarks());
		pstmt.executeUpdate();
		// System.out.println("更新update"+obj.getCiid()+"---"+obj.getBusiness());

		closeDB();
	}

	private Activity fillActivity(ResultSet rs) {

		Activity obj = new Activity();

		try {
			obj.setAid(rs.getString("AID"));
			obj.setTheme(rs.getString("THEME"));
			obj.setSponsor(rs.getString("SPONSOR"));
			obj.setLecturer(rs.getString("LECTURER"));
			obj.setLecturerintro(rs.getString("LECTURERINTRO"));
			obj.setRemarks(rs.getString("REMARKS"));

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return obj;
	}

	public Activity readActivityByID(String aid) {
		Activity obj = new Activity();
		String sql = "select * FROM Activity  where aid=? ";

		try {
			connectDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				obj = this.fillActivity(rs);
			}
			// System.out.println("----------"+obj.getStatus()+"部门"+obj.getBusiness());
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
			return new Activity();
		} finally {
			closeDB();
		}
	}

	public List<Activity> readActivityList() throws Exception {
		List<Activity> returnList = new ArrayList<Activity>();
		try {

			connectDB();
			String sql = "select * FROM Activity   order by AID desc";
			this.pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			rs = pstmt.executeQuery();

			int n = 1;
			while (rs.next()) {
				Activity obj = this.fillActivity(rs);
				obj.setSeq(n + "");
				returnList.add(obj);
				n++;
			}

			return returnList;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}

	/**
	 * 
	 * End of 园区交流活动DB操作
	 */

	/**
	 * 
	 * Begin of 园区活动来宾DB操作
	 */
	public void insertActvisitor(Actvisitor obj) throws SQLException {

		String sql = "insert into Actvisitor(" + "AVID" + "," + "ACTID" + "," + "COMPID" + "," + "COMPANYNAME" + ","
				+ "CONTACTS" + "," + "TEL" + "," + "STATUS" + ") values ( ?,?,?,?,?,?,? )";

		// connectDB();

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, obj.getAvid());
		pstmt.setString(2, obj.getActid());
		pstmt.setString(3, obj.getCompid());
		pstmt.setString(4, obj.getCompanyname());
		pstmt.setString(5, obj.getContacts());
		pstmt.setString(6, obj.getTel());
		pstmt.setString(7, obj.getStatus());

		System.out.println(sql);

		pstmt.executeUpdate();

		// closeDB();
	}

	public void updateActvisitor(Actvisitor obj) throws Exception {
		String sql = "update Actvisitor set " + "COMPID=? " + ", COMPANYNAME=? " + ", CONTACTS=? " + ", TEL=? "
				+ ", STATUS=? " + " where AVID=? and ACTID=?";

		connectDB();
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(6, obj.getAvid());
		pstmt.setString(7, obj.getActid());
		pstmt.setString(1, obj.getCompid());
		pstmt.setString(2, obj.getCompanyname());
		pstmt.setString(3, obj.getContacts());
		pstmt.setString(4, obj.getTel());
		pstmt.setString(5, obj.getStatus());
		pstmt.executeUpdate();
		// System.out.println("更新update"+obj.getCiid()+"---"+obj.getBusiness());

		closeDB();
	}

	private Actvisitor fillActvisitor(ResultSet rs) {

		Actvisitor obj = new Actvisitor();

		try {
			obj.setAvid(rs.getString("AVID"));
			obj.setActid(rs.getString("ACTID"));
			obj.setCompid(rs.getString("COMPID"));
			obj.setCompanyname(rs.getString("COMPANYNAME"));
			obj.setContacts(rs.getString("CONTACTS"));
			obj.setTel(rs.getString("TEL"));
			obj.setStatus(rs.getString("STATUS"));

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return obj;
	}

	public Actvisitor readActvisitorByID(String avid) {
		Actvisitor obj = new Actvisitor();
		String sql = "select * FROM Actvisitor  where avid=? ";

		try {
			connectDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, avid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				obj = this.fillActvisitor(rs);
			}
			// System.out.println("----------"+obj.getStatus()+"部门"+obj.getBusiness());
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
			return new Actvisitor();
		} finally {
			closeDB();
		}
	}

	public List<Actvisitor> readActvisitorList(String actid) throws Exception {
		List<Actvisitor> returnList = new ArrayList<Actvisitor>();
		try {

			connectDB();
			String sql = "select * FROM Actvisitor where actid= ? order by AVID desc";
			this.pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, actid);
			System.out.println(sql);
			rs = pstmt.executeQuery();

			int n = 1;
			while (rs.next()) {
				Actvisitor obj = this.fillActvisitor(rs);
				obj.setSeq(n + "");
				returnList.add(obj);
				n++;
			}

			return returnList;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}

	/**
	 * 
	 * End of 园区活动来宾DB操作
	 */
	/**
	 * 
	 * Begin of 园区企业介绍DB操作
	 */
	public String insertCompanyIntro(CompanyIntro obj) throws SQLException {
		String projContent="";
		String sql ="select ProjContent from isi_company where id = ?";
		connectDB();	
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, obj.getCompid());
		rs = pstmt.executeQuery();
		while(rs.next()){
			projContent = rs.getString("ProjContent");
		}
		closeDB();

		
		String sql2 = "insert into CompanyIntro(" + "CIID" + "," + "COMPID"
				+ "," + "BUSINESS" + "," + "STATUS" 
				+ ") values ( ?,?,?,? )";
		
		connectDB();
		
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, obj.getCiid());
		pstmt.setString(2, obj.getCompid());
		pstmt.setString(3, projContent);
		pstmt.setString(4, obj.getStatus());
		
		
		System.out.println(sql);
		
		pstmt.executeUpdate();
		
		closeDB();
		
		return projContent;
}

	public void updateCompanyIntro(CompanyIntro obj) throws Exception {
		String sql = "update CompanyIntro set " + "BUSINESS=? " + ", STATUS=? " + " WHERE CIID=?";

		connectDB();
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, obj.getBusiness());
		pstmt.setString(2, obj.getStatus());
		pstmt.setString(3, obj.getCiid());
		pstmt.executeUpdate();
		System.out.println("更新update" + obj.getCiid() + "---" + obj.getBusiness());

		closeDB();
	}

	private CompanyIntro fillCompanyIntro(ResultSet rs) {

		CompanyIntro obj = new CompanyIntro();

		try {
			obj.setCiid(rs.getString("CIID"));
			obj.setCompid(rs.getString("COMPID"));
			obj.setBusiness(rs.getString("BUSINESS"));
			obj.setStatus(rs.getString("STATUS"));
			obj.setCompname(rs.getString("companyname"));

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return obj;
	}

	public CompanyIntro readCompanyIntroByID(String compid) {
		CompanyIntro obj = new CompanyIntro();
		String sql = "select a.*,b.companyname FROM CompanyIntro as a, isi_company as b where a.compid=? and a.compid = b.id";

		try {
			connectDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, compid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				obj = this.fillCompanyIntro(rs);
			}
			System.out.println("----------" + obj.getStatus() + "部门" + obj.getBusiness());
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
			return new CompanyIntro();
		} finally {
			closeDB();
		}
	}

	public List<CompanyIntro> readCompanyIntroList() throws Exception {
		List<CompanyIntro> returnList = new ArrayList<CompanyIntro>();
		try {

			connectDB();
			String sql = "select a.*,b.companyname FROM CompanyIntro as a ,isi_company as b where a.compid=b.id and a.status = 1 order by a.CIID desc";
			this.pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			rs = pstmt.executeQuery();

			int n = 1;
			while (rs.next()) {
				CompanyIntro obj = this.fillCompanyIntro(rs);
				obj.setSeq(n + "");
				returnList.add(obj);
				n++;
			}

			return returnList;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}

	/**
	 * 
	 * End of 园区企业介绍DB操作
	 */
	/**
	 * 
	 * Begin of 文件上传DB操作
	 */
public void deleteUploadedFile(String ufid) throws SQLException {
		
		String sql = "delete from UploadedFile where UFID= ? ";
		
		connectDB();
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ufid);
		System.out.println(sql);
		
		pstmt.executeUpdate();
		
		closeDB();
}

	public void insertUploadedFile(UploadedFile obj) throws SQLException {

		String sql = "insert into UploadedFile(" + "UFID" + "," + "TYPE" + "," + "FILENAME" + ") values ( ?,?,? )";

		connectDB();

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, obj.getUfid());
		pstmt.setString(2, obj.getType());
		pstmt.setString(3, obj.getFilename());

		System.out.println(sql);

		pstmt.executeUpdate();

		closeDB();
	}

	private UploadedFile fillUploadedFile(ResultSet rs) {

		UploadedFile obj = new UploadedFile();

		try {
			obj.setUfid(rs.getString("UFID"));
			obj.setType(rs.getString("TYPE"));
			String filename = rs.getString("FILENAME");
			obj.setFilename(filename);
			String realName = filename.substring(filename.indexOf("_")+1, filename.length());
			obj.setRealname(realName);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return obj;
	}

	public List<UploadedFile> readUploadedFileList(String type) throws Exception {
		List<UploadedFile> returnList = new ArrayList<UploadedFile>();
		try {

			connectDB();
			String sql = "select * FROM UploadedFile where type = ? order by UFID desc";
			this.pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			System.out.println(sql);
			rs = pstmt.executeQuery();

			int n = 1;
			while (rs.next()) {
				UploadedFile obj = this.fillUploadedFile(rs);
				obj.setSeq(n + "");
				returnList.add(obj);
				n++;
			}

			return returnList;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}

	/**
	 * 
	 * End of 文件上传DB操作
	 */
	/**
	 * 
	 * Begin of 共享资源DB操作
	 */
	public void insertSharedResources(SharedResources obj) throws SQLException {

		String sql = "insert into SharedResources(" + "SRID" + "," + "SRNAME" + "," + "REMARK" + ") values ( ?,?,?)";

		connectDB();

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, obj.getSrid());
		pstmt.setString(2, obj.getSrname());
		pstmt.setString(3, obj.getRemark());

		System.out.println(sql);

		pstmt.executeUpdate();

		closeDB();
	}
	public void updateSharedResources(SharedResources obj) throws Exception {
		String sql = "update SharedResources set "+
					 "SRNAME=? "+
					 ", REMARK=? "+
					 " WHERE SRID=?";
		
		connectDB();
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, obj.getSrname());
		pstmt.setString(2, obj.getRemark());
		pstmt.setString(3, obj.getSrid());
	
		pstmt.executeUpdate();
		//System.out.println("更新update"+obj.getCiid()+"---"+obj.getBusiness());
		
		closeDB();
}
	private SharedResources fillSharedResources(ResultSet rs) {

		SharedResources obj = new SharedResources();

		try {
			obj.setSrid(rs.getString("SRID"));
			obj.setSrname(rs.getString("SRNAME"));
			obj.setRemark(rs.getString("REMARK"));

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return obj;
	}

	public List<SharedResources> readSharedResourcesList() throws Exception {
		List<SharedResources> returnList = new ArrayList<SharedResources>();
		try {

			connectDB();
			String sql = "select * FROM SharedResources  order by SRID desc";
			this.pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			rs = pstmt.executeQuery();

			int n = 1;
			while (rs.next()) {
				SharedResources obj = this.fillSharedResources(rs);
				obj.setSeq(n + "");
				returnList.add(obj);
				n++;
			}

			return returnList;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}

	public SharedResources readSharedResourcesByID(String srid) {
		SharedResources obj = new SharedResources();
		String sql = "select * FROM SharedResources  where srid=? ";

		try {
			connectDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, srid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				obj = this.fillSharedResources(rs);
			}
			// System.out.println("----------"+obj.getStatus()+"部门"+obj.getBusiness());
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
			return new SharedResources();
		} finally {
			closeDB();
		}
	}
	/**
	 * 
	 * Begin of 租借设备DB操作
	 */

	
		public void insertEquipmentData(EquipmentData obj)
		throws SQLException {
			String sql = "insert into Equipment_Data(" + "EDID" + "," + "Name"
					+ "," + "Money" + "," + "Status" + "," + "Remarks" + ","
					+ "Categorize" + ") values ( " +"?,?,?,?,?,?"+ " )";
			
			connectDB();
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, obj.getEdid());
			pstmt.setString(2, obj.getName());
			pstmt.setString(3, obj.getMoney());
			pstmt.setString(4, obj.getStatus());
			pstmt.setString(5, obj.getRemarks());
			pstmt.setString(6, obj.getCategorize());
			pstmt.executeUpdate();
			closeDB();
		}
	
	public void updateEquipmentData(EquipmentData obj)
		throws Exception {
					String sql = "update Equipment_Data set "+
					 "NAME=? "+
					 ", MONEY=? "+
					 ", STATUS=? "+
					 ", REMARKS=? "+
					 ", Categorize=? "+
					 " WHERE EDID=?";
			
			connectDB();
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, obj.getName());
			pstmt.setString(2, obj.getMoney());
			pstmt.setString(3, obj.getStatus());
			pstmt.setString(4, obj.getRemarks());
			pstmt.setString(5, obj.getCategorize());
			pstmt.setString(6, obj.getEdid());
			
			pstmt.executeUpdate();
			System.out.println("更新update"+obj.getEdid()+"---"+obj.getName());
			closeDB();
	}
	
	public void insertEquipmentAccept(EquipmentAccept obj)
		throws SQLException {
	String sql = "insert into Equipment_Accept(" + "EAID" + ","
			+ "EDID" + "," + "CompanyID" + "," + "CreateDate" + ","
			+ "NeedDateStart" + "," + "NeedDateEnd" + "," + "Contacts"
			+ "," + "Tel" + "," + "Remarks" + "," + "AcceptStatus"
			+ ") values ( ?,?,?,?,?,?,?,?,?,? )";

		connectDB();
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, obj.getEaid());
		pstmt.setString(2, obj.getEdid());
		pstmt.setString(3, obj.getCompany_id());
		pstmt.setString(4, obj.getCreate_date());
		pstmt.setString(5, obj.getNeed_date_start());
		pstmt.setString(6, obj.getNeed_date_end());
		pstmt.setString(7, obj.getContacts());
		pstmt.setString(8, obj.getTel());
		pstmt.setString(9, obj.getRemarks());
		pstmt.setString(10, obj.getAccept_status());
		pstmt.executeUpdate();
		closeDB();
	}
	
	public void updateEquipmentAccept(EquipmentAccept obj)
		throws Exception {
						String sql = "update Equipment_Accept set "+
						 "NEEDDATESTART=? "+
						 ", NEEDDATEEND=? "+
						 ", CONTACTS=? "+
						 ", TEL=? "+
						 ", REMARKS=? "+
						 " WHERE EAID=?";
				
						connectDB();
						System.out.println(sql);
						pstmt = conn.prepareStatement(sql);

						pstmt.setString(1, obj.getNeed_date_start());
						pstmt.setString(2, obj.getNeed_date_end());
						pstmt.setString(3, obj.getContacts());
						pstmt.setString(4, obj.getTel());
						pstmt.setString(5, obj.getRemarks());
						pstmt.setString(6, obj.getEaid());

						pstmt.executeUpdate();
						closeDB();
	}
	
	public void updateEquipmentAcceptStatus(String eaId,
		String acceptStatus) throws Exception {
		String sql = "update Equipment_accept set AcceptStatus = ? WHERE EAID= ? ";
		
		
		connectDB();
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, acceptStatus);
		pstmt.setString(2, eaId);
		pstmt.executeUpdate();
		closeDB();
	}	
	
	private EquipmentData fillEquipmentData(ResultSet rs) {

		EquipmentData obj = new EquipmentData();

		try {
			obj.setEdid(rs.getString("EDID"));
			obj.setName(rs.getString("NAME"));
			obj.setMoney(rs.getString("MONEY"));
			obj.setRemarks(rs.getString("REMARKS"));
			obj.setStatus(rs.getString("STATUS"));
			obj.setCategorize(rs.getString("CATEGORIZE"));
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return obj;
	}
	private EquipmentAccept fillEquipmentAccept(ResultSet rs) {

		EquipmentAccept obj = new EquipmentAccept();

		try {
			obj.setEaid(rs.getString("EAID"));
			obj.setEdid(rs.getString("EDID"));
			obj.setCompany_id(rs.getString("CompanyID"));
			Date d = rs.getDate("CreateDate");
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String dddd = dateFormat.format(d);
			System.out.println("XXXX yyyuuu  mmm  dddd=" + dddd);

			Date t = rs.getTime("CreateDate");
			DateFormat dateFormat2 = new SimpleDateFormat("hh:mm");
			String tttt = dateFormat2.format(t);
			System.out.println("XXXX yyyuuu  mmm  tttt=" + tttt);

			obj.setCreate_date(dddd + " " + tttt);
			
			obj.setNeed_date_start(rs.getString("NeedDateStart"));
			obj.setNeed_date_end(rs.getString("NeedDateEnd"));
			obj.setContacts(rs.getString("Contacts"));
			obj.setTel(rs.getString("Tel"));
			obj.setRemarks(rs.getString("Remarks"));
			obj.setAccept_status(rs.getString("AcceptStatus"));
			obj.setEd_name(rs.getString("edName"));
			obj.setEd_categorize(rs.getString("edCategorize"));
			obj.setCompany_name(rs.getString("c_CompanyName"));
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return obj;
	}
	public EquipmentData readEquipmentDataByID(String edid) {
		EquipmentData obj = new EquipmentData();
		String sql = "select * FROM equipment_data where edID=?";
		try {
			connectDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, edid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				obj = fillEquipmentData(rs);
			}
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
			return new EquipmentData();
		} finally {
			closeDB();
		}
	}
	public EquipmentAccept readEquipmentAcceptByID(String eaid,
			String categorize, String company_id) {

		EquipmentAccept obj = new EquipmentAccept();

		String sql = "";
		sql += " select a.*,b.Name 'edName',b.Categorize 'edCategorize',c.CompanyName 'c_CompanyName' ";
		sql += " FROM equipment_accept a LEFT JOIN equipment_data b ON a.eDID = b.edID LEFT JOIN isi_company c ON a.CompanyID = c.ID ";
		sql += " where a.eaID= ?  and a.CompanyID= ? " +
				" and b.Categorize= ? ";
		sql += " order by a.eaID desc ";
		
		System.out.println(sql);

		try {
			connectDB();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eaid);
			pstmt.setString(2, company_id);
			pstmt.setString(3, categorize);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				obj = fillEquipmentAccept(rs);
			}
			return obj;
		} catch (Exception e) {
			e.printStackTrace();
			return new EquipmentAccept();
		} finally {
			closeDB();
		}
	}
	
	public ArrayList readEquipmentDataList(String status, String categorize)
	throws Exception {
		ArrayList returnList = new ArrayList();
		String strStatus =(null!=status?" status=? and ":"");
		String sql = "select * FROM equipment_data where "+strStatus+" Categorize = ? order by edID desc";
		
		try {
		
			connectDB();
			if(null!=status){
				
				System.out.println(sql);
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, status);
				pstmt.setString(2, categorize);
				
			}else{
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, categorize);
			}	
			System.out.println(sql);
		
			rs = pstmt.executeQuery();
		
			String strTempList = "";
		
			int n = 1;
			while (rs.next()) {
				EquipmentData obj = fillEquipmentData(rs);
				obj.setSeq(n + "");
				returnList.add(obj);
				n++;
			}
		
			return returnList;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

}
	public ArrayList readEquipmentAcceptList(String company_id) throws Exception {
		
		String str_where_company_id = " a.CompanyID= ? and ";
		if (company_id == null)
			str_where_company_id = "";


			ArrayList returnList = new ArrayList();
			String sql = "";
			sql += " select a.*,b.Name 'edName',b.Categorize 'edCategorize',c.CompanyName 'c_CompanyName' ";
			sql += " FROM equipment_accept a LEFT JOIN equipment_data b ON a.eDID = b.edID LEFT JOIN isi_company c ON a.CompanyID = c.ID ";
			sql += " where " + str_where_company_id + " b.Categorize=-1 ";
			sql += " order by a.eaID desc ";
			System.out.println(sql);
			
			try {

			connectDB();
			pstmt = conn.prepareStatement(sql);
			if (company_id != null){
				pstmt.setString(1, company_id);
				//pstmt.setString(2, categorize);
			}else{
			//	pstmt.setString(1, categorize);
			}
				
			rs = pstmt.executeQuery();

			String strTempList = "";

			int n = 1;
			while (rs.next()) {
				EquipmentAccept obj = fillEquipmentAccept(rs);

				obj.setSeq(n + "");
				returnList.add(obj);
				n++;
			}

			return returnList;
		} catch (Exception e) {
			throw e;
		} finally {
			closeDB();
		}

	}

/**
 * 
 * End of 租借设备DB操作
 */
}
