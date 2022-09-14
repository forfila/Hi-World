package com.hiworld.minihp.service;

import com.hiworld.minihp.vo.MiniHpUserMenuVO;

public interface MiniHpSettingService {
	
	/*미니홈피 개인정보 비밀번호 확인*/
	int pwCheck(String id, String pw);

	void updateMenuAvailable(MiniHpUserMenuVO userMenuVO);

	MiniHpUserMenuVO getMenuAvailable(int userSerial);
	
}
