package com.hiworld.minihp.service;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpVisitorVO;

@Service
public class MiniHpIntroServiceImpl implements MiniHpIntroService {

	@Autowired
	private MiniHpIntroDAO introDAO;
	
	/*소개글 가져오기*/
	@Override
	public String getIntroInfo(int userSerial) {
		/*System.out.println("미니홈피 인트로 가져오기 서비스");*/
		String info = "";
		
		if(introDAO.getInfo(userSerial) == null) {
			info = "소개글이 없습니다";
		} else {
			info = introDAO.getInfo(userSerial);
		}
		
		/*System.out.println(info);*/
		
		return info;
	}

	/*소개글 수정*/
	@Override
	public void updateIntroInfo(MiniHpIntroVO introVO) {
		System.out.println("미니홈피 인트로 수정 서비스");
		introDAO.updateInfo(introVO);
	}
	
	/*제목 가져오기*/
	@Override
	public String getIntroTitle(int userSerial) {
		/*System.out.println("미니홈피 타이틀 가져오기 서비스");*/
		String title = introDAO.getTitle(userSerial);
		
		/*System.out.println(title);*/
		
		return title;
	}
	
	/*제목 수정*/
	@Override
	public void updateIntroTitle(MiniHpIntroVO introVO) {
		System.out.println("미니홈피 타이틀 수정 서비스");
		introDAO.updateTitle(introVO);
	}
	
	/*프로필 사진 가져오기*/
	@Override
	public ResponseEntity<byte[]> getIntroPicture(int userSerial) {
		/*System.out.println("미니홈피 프로필 사진 가져오기 서비스");*/
		Map<String, Object> map = introDAO.getPicture(userSerial);
		byte[] hpPicture = (byte[])map.get("hpPicture");
		String fileName = introDAO.getFileName(userSerial);
		/*System.out.println(hpPicture);*/
		System.out.println(fileName);
		System.out.println(fileName.lastIndexOf("."));
		
		HttpHeaders headers = new HttpHeaders();
		if(fileName.substring(fileName.lastIndexOf(".")).equals("png")) {
			headers.setContentType(MediaType.IMAGE_PNG);
		} else if(fileName.substring(fileName.lastIndexOf(".")).equals("gif")) {
			headers.setContentType(MediaType.IMAGE_GIF);
		} else {
			headers.setContentType(MediaType.IMAGE_JPEG);
		}
		
		/*System.out.println(new ResponseEntity<byte[]>(hpPicture, headers, HttpStatus.OK));*/
		return new ResponseEntity<byte[]>(hpPicture, headers, HttpStatus.OK);
	}
	
	/*프로필 사진 수정*/
	@Override
	public void updateIntroPicture(MiniHpIntroVO introVO) {
		System.out.println("미니홈피 프로필 사진 수정 서비스");
		try {
			if(!introVO.getHpPicture_imgFile().getOriginalFilename().equals("")) {
				introVO.setHpPicture(introVO.getHpPicture_imgFile().getBytes());
				System.out.println(introVO.getHpPicture());
			}
		} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
		}
		introDAO.updatePicture(introVO);
	}
	
	/*방문자 체크*/
	@Override
	public void todayCheck(MiniHpVisitorVO visitorVO) {
		/*System.out.println("방문자 체크 서비스");*/
		MiniHpVisitorVO vo = new MiniHpVisitorVO();	
		vo = introDAO.checkVisitor(visitorVO);

		if(vo == null) {
			introDAO.insertVisitor(visitorVO);
			introDAO.updateToday(visitorVO.getOwnerSerial());
			introDAO.updateTotal(visitorVO.getOwnerSerial());
		}
	}
	
}
