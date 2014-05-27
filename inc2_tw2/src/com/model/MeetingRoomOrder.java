package com.model;

public class MeetingRoomOrder extends A {

	private String id = "";
	private String meetingRoomNo = "";
	private String start = "";
	private String end = "";
	private String title = "";
	private String url = "";
	private String eventText = "";
	private String compName = "";
	private String person = "";
	private String phone = "";
	private String myStatus = "";

	public String getEventText() {
		return eventText;
	}

	public void setEventText(String eventText) {
		this.eventText = eventText;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getPerson() {
		return person;
	}

	public void setPerson(String person) {
		this.person = person;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMeetingRoomNo() {
		return meetingRoomNo;
	}

	public void setMeetingRoomNo(String meetingRoomNo) {
		this.meetingRoomNo = meetingRoomNo;
	}

	public String getMyStatus() {
		return myStatus;
	}

	public void setMyStatus(String myStatus) {
		this.myStatus = myStatus;
	}

}
