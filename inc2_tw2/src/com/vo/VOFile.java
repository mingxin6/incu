package com.vo;

public class VOFile {

	String uid = "";
	String linkedObjId = "";

	String originalFileName = "";
	String modifiedFileName = "";

	String type = "";

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getLinkedObjId() {
		return linkedObjId;
	}

	public void setLinkedObjId(String linkedObjId) {
		this.linkedObjId = linkedObjId;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getModifiedFileName() {
		return modifiedFileName;
	}

	public void setModifiedFileName(String modifiedFileName) {
		this.modifiedFileName = modifiedFileName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

}
