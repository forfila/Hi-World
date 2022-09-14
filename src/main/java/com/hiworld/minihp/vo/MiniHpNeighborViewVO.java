package com.hiworld.minihp.vo;

public class MiniHpNeighborViewVO {
	
	private int userSerial;
	private String userName;
	private String userValue;
	private int neighborSerial;
	private String neighborName;
	private String neighborValue;
	
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
	public String getUserValue() {
		return userValue;
	}
	public void setUserValue(String userValue) {
		this.userValue = userValue;
	}
	public int getNeighborSerial() {
		return neighborSerial;
	}
	public void setNeighborSerial(int neighborSerial) {
		this.neighborSerial = neighborSerial;
	}
	public String getNeighborName() {
		return neighborName;
	}
	public void setNeighborName(String neighborName) {
		this.neighborName = neighborName;
	}
	public String getNeighborValue() {
		return neighborValue;
	}
	public void setNeighborValue(String neighborValue) {
		this.neighborValue = neighborValue;
	}
	@Override
	public String toString() {
		return "MiniHpNeighborViewVO [userSerial=" + userSerial + ", userName=" + userName + ", userValue=" + userValue
				+ ", neighborSerial=" + neighborSerial + ", neighborName=" + neighborName + ", neighborValue="
				+ neighborValue + "]";
	}
	
}
