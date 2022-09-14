package com.hiworld.minihp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.minihp.service.MiniHpProfileService;
import com.hiworld.minihp.vo.MiniHpProfileVO;

@Controller
public class MiniHpProfileController {
	

	@Autowired
	private MiniHpProfileService service;
	
	@ResponseBody
	@GetMapping("/miniHp_check_profile.do")
	public String miniHpCheckProfile(HttpServletRequest request) {
		System.out.println("프로필 확인 컨트롤러");
		String id = request.getParameter("UserID");
		System.out.println(id);
		String result = service.checkProfile(id);
		System.out.println("프로필 확인 서비스 갔다옴");
		System.out.println(result);
		
		return result;
	}
	
	@ResponseBody
	@GetMapping(value = "/miniHp_get_profile.do", produces ="application/text;charset=utf8")
	public String miniHpGetProfile(HttpServletRequest request) {
		System.out.println("프로필 가져오기 컨트롤러");
		String id = request.getParameter("UserID");
		String result = service.getProfile(id);
		
		return result;
	}
	
	@ResponseBody
	@GetMapping("/miniHp_insert_profile.do")
	public String miniHpInsertProfile(MiniHpProfileVO profileVO) {
		System.out.println("프로필 작성 컨트롤러");
		int result = service.insertProfile(profileVO);
		
		System.out.println("프로필 작성 서비스 갔다옴");
		String check = "";
		
		if(result == 0) {
			check = "fail";
		} else if(result == -1) {
			check = "error";
		} else {
			check = "success";
		}
		
		return check;
	}
	
	@ResponseBody
	@GetMapping("/miniHp_update_profile.do")
	public String miniHpUpdateProfile(MiniHpProfileVO profileVO) {
		System.out.println("프로필 수정 컨트롤러");
		int result = service.updateProfile(profileVO);
		System.out.println(result);
		
		System.out.println("프로필 수정 서비스 갔다옴");
		String check = "";
		
		if(result == 0) {
			check = "fail";
		} else if(result == -1) {
			check = "error";
		} else {
			check = "success";
		}
		
		return check;
	}
}
