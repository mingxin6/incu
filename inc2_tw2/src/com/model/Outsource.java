package com.model;

/**
 * 委外項目
 */
public class Outsource extends A {
	String uid = "";
	String proj = "";// 委外項目
	String contractName = "";// 合約名稱
	String contractStartDate = "";// 合約開始日期
	String contractEndDate = "";// 合約結束日期
	String outSourceCompany = "";// 委外廠商
	String amount = "";// 金額
	String email = "";
	String phone = "";
	String remark = "";
	

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getProj() {
		return proj;
	}

	public void setProj(String proj) {
		this.proj = proj;
	}

	public String getContractName() {
		return contractName;
	}

	public void setContractName(String contractName) {
		this.contractName = contractName;
	}

	public String getOutSourceCompany() {
		return outSourceCompany;
	}

	public void setOutSourceCompany(String outSourceCompany) {
		this.outSourceCompany = outSourceCompany;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	

	public String getContractStartDate() {
		return contractStartDate;
	}

	public void setContractStartDate(String contractStartDate) {
		this.contractStartDate = contractStartDate;
	}

	public String getContractEndDate() {
		return contractEndDate;
	}

	public void setContractEndDate(String contractEndDate) {
		this.contractEndDate = contractEndDate;
	}

}
