package com.hiworld.minihp.dao;

import org.springframework.stereotype.Repository;

import com.hiworld.minihp.vo.MiniHpUserMenuVO;

@Repository
public interface MiniHpSettingDAO {
	
	/*미니홈피 정보 수정 시 비밀번호 확인*/
	String getPw(String id);
	
	/*미니홈피 메뉴 설정 가져오기*/
	MiniHpUserMenuVO getMenuAvailable(int userSerial);
	
	/*미니홈피 메뉴 설정 수정*/
	void updateMenuAvailable(MiniHpUserMenuVO userMenuVO);


}
