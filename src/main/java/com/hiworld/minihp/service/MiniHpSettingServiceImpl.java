package com.hiworld.minihp.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpSettingDAO;
import com.hiworld.minihp.vo.MiniHpUserMenuVO;

@Service
public class MiniHpSettingServiceImpl implements MiniHpSettingService {
	
	@Autowired
	private MiniHpSettingDAO settingDAO;
	
	@Override
	public int pwCheck(String id, String pw) {
		System.out.println("미니홈피 기본 정보 비밀번호 체크 서비스");
		int checknumber = 0;
		String dbpw = settingDAO.getPw(id);
		
		if(pw.equals(dbpw)) {
			checknumber = 1;
		}
		return checknumber;
	}
	
	@Override
	public MiniHpUserMenuVO getMenuAvailable(int userSerial) {
		return settingDAO.getMenuAvailable(userSerial);
	}
	
	@Override
	public void updateMenuAvailable(MiniHpUserMenuVO userMenuVO) {
		settingDAO.updateMenuAvailable(userMenuVO);
	}
	
}
