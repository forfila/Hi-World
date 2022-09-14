package com.hiworld.client.vo;

import java.sql.Date;

public class BoardReplyVO {
	private int replySerial;
	private int userSerial;
	private String userName;
	private String userID;
	private String replyContent;
	private Date cDate;
	
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getReplySerial() {
		return replySerial;
	}
	public void setReplySerial(int replySerial) {
		this.replySerial = replySerial;
	}
	public int getUserSerial() {
		return userSerial;
	}
	public void setUserSerial(int userSerial) {
		this.userSerial = userSerial;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	
}
