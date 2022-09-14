package com.hiworld.minihp.vo;

import java.util.Date;

public class MiniHpPictureReplyVO {
	private int replySerial;
	private int userSerial;
	private String userName;
	private int pictureSerial;
	private String replyContent;
	private Date cDate;
	
	public MiniHpPictureReplyVO() {}

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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getPictureSerial() {
		return pictureSerial;
	}

	public void setPictureSerial(int pictureSerial) {
		this.pictureSerial = pictureSerial;
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

	@Override
	public String toString() {
		return "MiniHpPictureReplyVO [replySerial=" + replySerial + ", userSerial=" + userSerial + ", userName="
				+ userName + ", pictureSerial=" + pictureSerial + ", replyContent=" + replyContent + ", cDate=" + cDate
				+ "]";
	}
	
}
