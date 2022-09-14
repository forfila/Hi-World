package com.hiworld.minihp.dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpVisitorVO;

@Repository
public interface MiniHpIntroDAO {
	
	/*미니홈피 소개글 가져오기*/
	String getInfo(int userSerial);
	
	/*미니홈피 소개글 수정*/
	void updateInfo(MiniHpIntroVO introVO);
	
	/*미니홈피 타이틀 가져오기*/
	String getTitle(int userSerial);
	
	/*미니홈피 타이틀 수정*/
	void updateTitle(MiniHpIntroVO introVO);
	
	/*미니홈피 프로필 사진 가져오기*/
	Map<String, Object> getPicture(int userSerial);
	
	/*미니홈피 프로필 사진 이름 가져오기*/
	String getFileName(int userSerial);
	
	/*미니홈피 프로필 사진 수정*/
	void updatePicture(MiniHpIntroVO introVO);
	
	/*미니홈피 세팅 정보 가져오기*/
	MiniHpIntroVO getData(int userSerial);
	
	/*미니홈피 일일 중복 방문자 체크*/
	MiniHpVisitorVO checkVisitor(MiniHpVisitorVO visitorVO);
	
	/*미니홈피 일일 방문자 기록*/
	void insertVisitor(MiniHpVisitorVO visitorVO);
	
	/*미니홈피 오늘 방문자 수 가져오기*/
	int getToday(String UserID);
	
	/*미니홈피 오늘 방문자수 카운트*/
	void updateToday(int userSerial);
	
	/*미니홈피 전체 방문자 수 가져오기*/
	int getTotal(String UserID);
	
	/*미니홈피 누적 방문자수 카운트*/
	void updateTotal(int userSerial);
	
	/*전체 정보 가져오기*/
	ArrayList<MiniHpIntroVO> getAllNeighbor();

	
}
