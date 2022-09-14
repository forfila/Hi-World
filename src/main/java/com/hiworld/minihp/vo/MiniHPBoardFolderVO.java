package com.hiworld.minihp.vo;

public class MiniHPBoardFolderVO {
	private int serial; //pk
	private int userSerial;
	private String folderName; //폴더명
	private int scope; //공개범위(전체,일촌,비공개)
	
	public MiniHPBoardFolderVO() {}

	public MiniHPBoardFolderVO(int serial, int userSerial, String folderName, int scope) {
		this.serial = serial;
		this.userSerial = userSerial;
		this.folderName = folderName;
		this.scope = scope;
	}

	public int getSerial() {
		return serial;
	}

	public void setSerial(int serial) {
		this.serial = serial;
	}

	public int getUserSerial() {
		return userSerial;
	}

	public void setUserSerial(int userSerial) {
		this.userSerial = userSerial;
	}

	public String getFolderName() {
		return folderName;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}

	public int getScope() {
		return scope;
	}

	public void setScope(int scope) {
		this.scope = scope;
	}

	@Override
	public String toString() {
		return "MiniHPBoardFolderVO [serial=" + serial + ", userSerial=" + userSerial + ", folderName=" + folderName
				+ ", scope=" + scope + "]";
	}
	
	
}
