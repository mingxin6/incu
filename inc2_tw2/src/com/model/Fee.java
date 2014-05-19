package com.model;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.vo.VOFile;

public class Fee {

	String uid = "";
	String yearMonth = "";
	String cid = "";
	String compName = "";
	String registerId = "";
	String rent = "";
	String parkingFee = "";
	String managementFee = "";
	String utilityFee = "";
	String consumableFee = "";
	String copyFee = "";
	String sitingFee = "";
	String equipmentRental = "";
	String preTaxTotal = "";
	String tax = "";
	String total = "";

	String yellowcircle = "";

	private List<MultipartFile> files;
	private ArrayList<VOFile> fileInfo;
	
	
	boolean status = true;

	static NumberFormat formatter = new DecimalFormat("#,###,###");

	
	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}

	public ArrayList<VOFile> getFileInfo() {
		return fileInfo;
	}

	public void setFileInfo(ArrayList<VOFile> fileInfo) {
		this.fileInfo = fileInfo;
	}

	public String getYellowcircle() {
		return yellowcircle;
	}

	public void setYellowcircle(String yellowcircle) {
		this.yellowcircle = yellowcircle;
	}

	public boolean getStatus() {
		// if (rent == null || rent.equals(""))
		// return false;
		// if (managementFee == null || managementFee.equals(""))
		// return false;
		// if (utilityFee == null || utilityFee.equals(""))
		// return false;
		// if (consumableFee == null || consumableFee.equals(""))
		// return false;

		if (yellowcircle == null || yellowcircle.equals("")) {
			return false;
		}

		return true;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getYearMonth() {
		return yearMonth;
	}

	public void setYearMonth(String yearMonth) {
		this.yearMonth = yearMonth;
	}

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getRegisterId() {
		return registerId;
	}

	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}

	String convert(String s) {
		try {
			return formatter.format(Integer.parseInt(s));
		} catch (Exception e) {
			return s;
		}
	}

	public String getRent() {
		return convert(rent);
	}

	public void setRent(String rent) {
		this.rent = rent;
	}

	public String getParkingFee() {
		return parkingFee;
	}

	public void setParkingFee(String parkingFee) {
		this.parkingFee = parkingFee;
	}

	public String getManagementFee() {
		return convert(managementFee);
	}

	public void setManagementFee(String managementFee) {
		this.managementFee = managementFee;
	}

	public String getUtilityFee() {
		return convert(utilityFee);
	}

	public void setUtilityFee(String utilityFee) {
		this.utilityFee = utilityFee;
	}

	public String getConsumableFee() {
		return convert(consumableFee);
	}

	public void setConsumableFee(String consumableFee) {
		this.consumableFee = consumableFee;
	}

	public String getCopyFee() {
		return copyFee;
	}

	public void setCopyFee(String copyFee) {
		this.copyFee = copyFee;
	}

	public String getSitingFee() {
		return sitingFee;
	}

	public void setSitingFee(String sitingFee) {
		this.sitingFee = sitingFee;
	}

	public String getEquipmentRental() {
		return equipmentRental;
	}

	public void setEquipmentRental(String equipmentRental) {
		this.equipmentRental = equipmentRental;
	}

	public String getPreTaxTotal() {
		return preTaxTotal;
	}

	public void setPreTaxTotal(String preTaxTotal) {
		this.preTaxTotal = preTaxTotal;
	}

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public String getTotal() {
		return convert(total);
	}

	public void setTotal(String total) {
		this.total = total;
	}

}
