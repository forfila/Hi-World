package com.hiworld.minihp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.service.MiniHpItemService;
import com.hiworld.minihp.service.MiniHpNeighborService;
import com.hiworld.minihp.service.MiniHpRightService;
import com.hiworld.minihp.service.MiniHpSettingService;
import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpMusicVO;
import com.hiworld.minihp.vo.MiniHpNeiWordVO;
import com.hiworld.minihp.vo.MiniHpNeighborViewVO;
import com.hiworld.minihp.vo.MiniHpSelectedItemVO;
import com.hiworld.minihp.vo.MiniHpUserMenuVO;

@Controller
public class MiniHpController {
	
	@Autowired
	MiniHpRightService rightService;
	
	@Autowired
	MiniHpItemService itemService;
	
	@Autowired
	MiniHpSettingService settingService;
	
	@Autowired
	MiniHpNeighborService neighborService;
	
	@Autowired
	MiniHpIntroDAO introDAO;
	
	MiniHpIntroVO introVO;
	
	MiniHpSelectedItemVO itemVO;
	
	MiniHpUserMenuVO menuVO;
	
	MiniHpNeighborViewVO neighborViewVO;
	
	
	
	
	//@@@@@@@@@@@@@@@@ 홈페이지 VIEW @@@@@@@@@@@@@@@@@@
	
	//미니홈피 메인
	@RequestMapping("/MiniHP_Home.do")
	public String miniHp_Home(HttpSession session, Model model) {
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		int UserSerial = vo.getUserSerial();

		introVO = introDAO.getData(UserSerial); //미니홈피 기본 정보 가져오기
		itemVO = itemService.getItemList(UserSerial);
		List<MiniHpMusicVO> playList = itemService.getPlayList(UserSerial);
		int playListSize = playList.size();

		
		model.addAttribute("introVO", introVO);
		model.addAttribute("itemList", itemVO);
		//재생목록 전달
		model.addAttribute("playList", playList);
		model.addAttribute("playListSize", playListSize);
		//사용중인 배경화면 전달
		model.addAttribute("skin", itemService.getUsingSkin(UserSerial));

		return "MiniHP/MiniHP_Home";
	}
	
	//미니홈피 제목
	@RequestMapping("/MiniHP_TopTitle.do")
	public String miniHp_TopTitle() {
		return "MiniHP/MiniHP_TopTitle";
	}
	
	@RequestMapping("/MiniHP_Left.do")
	public String miniHp_Left(HttpSession session, Model model) {
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		int UserSerial = vo.getUserSerial();
		/*System.out.println(UserID);*/
		introVO = introDAO.getData(UserSerial); //미니홈피 기본 정보 가져오기
		itemVO = itemService.getItemList(UserSerial);
		List<MiniHpNeighborViewVO> neighborList = neighborService.getNeighborList(UserSerial); //이웃 목록 불러오기
		
		if(neighborList == null) {
			model.addAttribute("listLength", 0);
		} else {
			model.addAttribute("listLength", neighborList.size());
		}
		
		model.addAttribute("introVO", introVO);
		model.addAttribute("neighborList", neighborList);
		return "MiniHP/MiniHP_Left";
	}
	
	@ResponseBody
	@GetMapping("/MiniHpDefaultSide.do")
	public String miniHpDefaultSide() {
		return "MiniHP_Left.do";
	}
	
	//랜덤 미니홈피 가기 처리
	@ResponseBody
	@GetMapping("/random.do")
	public int random(HttpSession session) {
		int userSerial = Utils.getSessionUser(session);
		return rightService.random(userSerial);
	}
	
	@RequestMapping("/MiniHP_Right.do")
	public String miniHp_Right(Model model, HttpSession session) {
		//최근 게시물 표시
		int userSerial = Utils.getSessionUser(session);
		MiniHpSelectedItemVO itemList = itemService.getItemList(userSerial);
		
		model.addAttribute("latestPosts", rightService.getLatestPosts(userSerial));
		model.addAttribute("itemList", itemList);
		
		//최근 게시물
		model.addAttribute("today",rightService.countToday(userSerial));
		//감춘 종목 숨기기
		menuVO = settingService.getMenuAvailable(userSerial);
		model.addAttribute("miniHpUserMenuVO", menuVO);
		
		return "MiniHP/MiniHP_Right";
	}
	//이웃평
	//selectAll
	@GetMapping("/MiniHP_NeiWord.do")
	public String selectAllNeiWord(HttpSession session, Model model) {
		System.out.println("MiniHP_NeiWord.do");
		
		int userSerial = Utils.getSessionUser(session);
		
		model.addAttribute("list", rightService.getAll(userSerial));
		return "MiniHP/MiniHP_NeiWord";
	}
	//insert
	@PostMapping("/MiniHP_NeiWord.do")
	@ResponseBody
	public void insertNeiWord(String content,HttpSession session) {
		System.out.println("MiniHP_NeiWord.do");
		MiniHpNeiWordVO vo = new MiniHpNeiWordVO();
		vo.setContent(content);
		int userSerial = Utils.getSessionUser(session);
		vo.setUserSerial(userSerial);
		vo.setWriteUserSerial(userSerial);
		
		int result = rightService.insert(vo);
		if(result>0) System.out.println("insert 성공!");
		else System.out.println("insert 실패!");
	}
	//삭제
	@DeleteMapping("/MiniHP_NeiWord.do/{serial}")
	@ResponseBody
	public void deleteNeiWord(@PathVariable int serial) {
		System.out.println("delete");
		int result = rightService.delete(serial);
		if(result>0) System.out.println("delete 성공!");
		else System.out.println("delete 실패!");
	}
	//수정
	@PutMapping("/MiniHP_NeiWord.do/{serial}/{content}")
	@ResponseBody
	public void updateNeiWord(@PathVariable int serial,@PathVariable String content) {
		System.out.println("수정");
		
		int result = rightService.update(serial, content);
		if(result>0) System.out.println("수정 성공!");
		else System.out.println("수정 실패!");
	}
	
	//프로필 탭
	@GetMapping("/miniHpProfile.do")
	public String miniHpProfile(Model model) {
		System.out.println("프로필 화면");

		return "MiniHP/MiniHP_Menu_Profile";
	}
	
	//관리 탭
	@GetMapping("/miniHpSetting.do")
	public String miniHpSetting(Model model) {
		System.out.println("관리");

		return "MiniHP/MiniHP_Setting_BasicInfo_pwCheck";
	}
	
	@RequestMapping("/miniHp_menuList.do")
	public String miniHpSettingMenu() {
			
		return "MiniHP/MiniHP_Menu_Setting";
	}
	
	@GetMapping("/MiniHpSettingSide.do")
	public String miniHpSettingSide() {
		return "MiniHP/MiniHP_Menu_Setting";
	}
	
	@RequestMapping("/miniHp_rightMenu.do")
	public String rightMenu(HttpServletRequest request, Model model) {
		/*System.out.println("메뉴불러오기");*/
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		int userSerial = vo.getUserSerial();
		menuVO = settingService.getMenuAvailable(userSerial);
		
		model.addAttribute("miniHpUserMenuVO", menuVO);

		return "MiniHP/MiniHP_Right_Menu";
	}
}
