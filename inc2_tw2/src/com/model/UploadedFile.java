package com.model;

public class UploadedFile {
	private String  seq="";
	private String  ufid="";
	private String  type="";
	private String  filename="";
	private String  realname="";
	
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getUfid() {
		return ufid;
	}
	public void setUfid(String ufid) {
		this.ufid = ufid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
		
}