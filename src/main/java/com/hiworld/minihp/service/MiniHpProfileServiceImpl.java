package com.hiworld.minihp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpProfileDAO;
import com.hiworld.minihp.vo.MiniHpProfileVO;

@Service("MiniHpProfileService")
public class MiniHpProfileServiceImpl implements MiniHpProfileService {
	
	@Autowired
	private MiniHpProfileDAO profileDAO;
	
	private MiniHpProfileVO profileVO;
	
	@Override
	public String checkProfile(String userId) {
		System.out.println("프로필 확인 서비스");
		String checkNumber = "0";
		profileVO = profileDAO.checkProfile(userId);
		
		if(profileVO != null) {
			checkNumber = "1";
		} else {
			checkNumber = "0";
		}
		return checkNumber;
	}
	
	@Override
	public String getProfile(String userId) {
		System.out.println("프로필 가져오기 서비스");
		System.out.println(userId);
		profileVO = profileDAO.getProfile(userId);
		String content = "";
		if(profileVO!=null)
			content = profileVO.getProfileContent();
		else
			content = "작성된 프로필이 없습니다";
		System.out.println(content);
		return content;
	}
	
	@Override
	public int insertProfile(MiniHpProfileVO profileVO) {
		System.out.println("프로필 작성 서비스");
		int checkNumber = profileDAO.insertProfile(profileVO);
		System.out.println(profileVO.getProfileContent());
		return checkNumber;
	}
	
	@Override
	public int updateProfile(MiniHpProfileVO profileVO) {
		System.out.println("프로필 수정 서비스");
		int checkNumber = profileDAO.updateProfile(profileVO);
		System.out.println(profileVO.getUserID());
		System.out.println(profileVO.getProfileContent());
		return checkNumber;
	}
}
