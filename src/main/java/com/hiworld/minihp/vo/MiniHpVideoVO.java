package com.hiworld.minihp.vo;

import java.util.Date;

public class MiniHpVideoVO {
	private int videoSerial;
	private int userSerial;
	private String userName;
	private int folderSerial;
	private String folderName;
	private String title;
	private String content;
	private String file;
	private int replyCnt;
	private Date cDate;
	private Date uDate;
	
	public MiniHpVideoVO() {}

	public int getVideoSerial() {
		return videoSerial;
	}

	public void setVideoSerial(int videoSerial) {
		this.videoSerial = videoSerial;
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

	public int getFolderSerial() {
		return folderSerial;
	}

	public void setFolderSerial(int folderSerial) {
		this.folderSerial = folderSerial;
	}

	public String getFolderName() {
		return folderName;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
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

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public Date getuDate() {
		return uDate;
	}

	public void setuDate(Date uDate) {
		this.uDate = uDate;
	}

	@Override
	public String toString() {
		return "MiniHpVideoVO [videoSerial=" + videoSerial + ", userSerial=" + userSerial + ", userName=" + userName
				+ ", folderSerial=" + folderSerial + ", folderName=" + folderName + ", title=" + title + ", content="
				+ content + ", file=" + file + ", replyCnt=" + replyCnt + ", cDate=" + cDate + ", uDate=" + uDate + "]";
	}

}
