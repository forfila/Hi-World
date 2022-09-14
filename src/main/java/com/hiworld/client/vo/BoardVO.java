package com.hiworld.client.vo;

import java.sql.Date;

public class BoardVO {
	private int boardSerial;
	private int replySerial;
	private int userSerial;
	private int adminReply;
	private String userName;
	private String userID;
	private String title;
	private String content;
	private String replyContent;
	private Date cDate;
	private int lookUp;
	private int banUser;
	
	
	
	public int getBanUser() {
		return banUser;
	}
	public void setBanUser(int banUser) {
		this.banUser = banUser;
	}
	public int getAdminReply() {
		return adminReply;
	}
	public void setAdminReply(int adminReply) {
		this.adminReply = adminReply;
	}
	public int getReplySerial() {
		return replySerial;
	}
	public void setReplySerial(int replySerial) {
		this.replySerial = replySerial;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
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
	public int getBoardSerial() {
		return boardSerial;
	}
	public void setBoardSerial(int boardSerial) {
		this.boardSerial = boardSerial;
	}
	public int getUserSerial() {
		return userSerial;
	}
	public void setUserSerial(int userSerial) {
		this.userSerial = userSerial;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	public int getLookUp() {
		return lookUp;
	}
	public void setLookUp(int lookUp) {
		this.lookUp = lookUp;
	}
	
	
}
