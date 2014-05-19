package com.model;

public class TagRec {
	public String myTagRecUid = "";
	public String recordUid = "";
	public String tagNames = "";
	public String userUid = "";

	public String getMyTagRecUid() {
		return myTagRecUid;
	}

	public void setMyTagRecUid(String myTagRecUid) {
		this.myTagRecUid = myTagRecUid;
	}

	public String getRecordUid() {
		return recordUid;
	}

	public void setRecordUid(String recordUid) {
		this.recordUid = recordUid;
	}

	public String getTagNames() {
		return tagNames;
	}

	public void setTagNames(String tagNames) {
		this.tagNames = tagNames;
	}

	public String getUserUid() {
		return userUid;
	}

	public void setUserUid(String userUid) {
		this.userUid = userUid;
	}

	@Override
	public String toString() {
		return "TagRec [myTagRecUid=" + myTagRecUid + ", recordUid=" + recordUid + ", tagNames=" + tagNames
				+ ", userUid=" + userUid + "]";
	}

}
