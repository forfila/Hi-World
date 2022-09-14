package com.hiworld.minihp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.service.MiniHpItemService;
import com.hiworld.minihp.service.MiniHpNeighborService;
import com.hiworld.minihp.service.MiniHpSettingService;
import com.hiworld.minihp.vo.MiniHpIntroVO;
import com.hiworld.minihp.vo.MiniHpMusicVO;
import com.hiworld.minihp.vo.MiniHpNeighborViewVO;
import com.hiworld.minihp.vo.MiniHpSelectedItemVO;
import com.hiworld.minihp.vo.MiniHpUserItemVO;
import com.hiworld.minihp.vo.MiniHpUserMenuVO;

@Controller
public class MiniHpSettingController {
	
	@Autowired
	MiniHpSettingService settingService;
	
	@Autowired
	MiniHpNeighborService neighborService;
	
	@Autowired
	MiniHpItemService itemService;
	
	@Autowired
	MiniHpIntroDAO introDAO;
	
	MiniHpIntroVO introVO;
	
	MiniHpUserMenuVO menuVO;
	
	MiniHpMusicVO musicVO;
	
	sessionVO sessionVO;
	
	MiniHpSelectedItemVO itemVO;
	
	
	/*회원 정보 조회*/
	@RequestMapping("/miniHp_setBasicInformation_pw.do")
	public String setBasicInformation_pw(HttpServletRequest request) {
		System.out.println("미니홈피 기본정보 탭");
		return "MiniHP/MiniHP_Setting_BasicInfo_pwCheck";
	}
	
	@RequestMapping("/miniHp_setBasicInformation_pw_ok.do")
	public String setBasicInformation_pw_ok(HttpServletRequest request) {
		System.out.println("미니홈피 기본정보 비밀번호 확인");
		String id = request.getParameter("UserID");
		String pw = request.getParameter("UserPW");
		/*System.out.println(id);
		System.out.println(pw);*/
		int result = settingService.pwCheck(id,pw);
		System.out.println(result);
		if(result == 0) {
			return "MiniHP/MiniHP_Setting_BasicInfo_pwCheck";
		} else {
			return "MiniHP/MiniHP_Setting_BasicInfo";
		}
	}
	
	/*메뉴 설정 탭*/
	@RequestMapping("/miniHp_menuAvailable.do")
	public String setMenuAvailable(Model model, HttpSession session) {
		System.out.println("미니홈피 메뉴 설정");
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		MiniHpUserMenuVO miniHpUserMenuVO = settingService.getMenuAvailable(vo.getUserSerial());
		/*System.out.println(miniHpUserMenuVO);*/
		model.addAttribute("miniHpUserMenuVO", miniHpUserMenuVO);

		return "MiniHP/MiniHP_Setting_Menu_Available";
	}
	
	/*메뉴 설정 저장*/
	@RequestMapping("/miniHp_menuAvailable_ok.do")
	public String setMenuAvailable_ok(Model model, HttpSession session, MiniHpUserMenuVO userMenuVO) {
		System.out.println("미니홈피 메뉴 설정 확인 컨트롤러");
		
		settingService.updateMenuAvailable(userMenuVO);

		return setMenuAvailable(model, session);
	}
	
	/*일촌 관리 탭*/
	@RequestMapping("/miniHp_setNeighborList.do")
	public String setNeighborList(HttpSession session, Model model) {
		System.out.println("미니홈피 이웃 목록 컨트롤러");
		sessionVO = (sessionVO)session.getAttribute("sessionVO");
		int userSerial = sessionVO.getUserSerial();
		List<MiniHpNeighborViewVO> neighborList = neighborService.getNeighborList(userSerial); //이웃 목록 불러오기
		if(neighborList == null) {
			model.addAttribute("listLength", 0);
		} else {
			model.addAttribute("listLength", neighborList.size());
		}
		
		model.addAttribute("neighborList", neighborList);
		
		return "MiniHP/MiniHP_Setting_NeighborList";
	}
	
	@RequestMapping("/miniHp_storyRoomMinimi.do")
	public String setStoryRoomMinimi(HttpSession session, Model model) {
		System.out.println("미니홈피 스토리룸 미니미 컨트롤러");
		sessionVO = (sessionVO)session.getAttribute("sessionVO");
		int userSerial = sessionVO.getUserSerial();
		itemVO = itemService.getItemList(userSerial);
		List<MiniHpUserItemVO> minimiList = itemService.getMinimiList(userSerial);
		List<MiniHpUserItemVO> storyList = itemService.getStoryRoomList(userSerial);
		
		int minimiSize = minimiList.size();
		int storySize = storyList.size();
		
		model.addAttribute("itemList", itemVO);
		model.addAttribute("minimiList", minimiList);
		model.addAttribute("minimiSize", minimiSize);
		model.addAttribute("storyList", storyList);
		model.addAttribute("storySize", storySize);
		
		return "MiniHP/MiniHP_Setting_StoryRoom_Minimi";
	}
	
	@ResponseBody
	@PostMapping("/miniHp_saveStoryRoomMinimi.do")
	public String saveStoryRoomMinimi(HttpServletRequest request, HttpSession session) {
		System.out.println("미니홈피 스토리룸 미니미 저장 컨트롤러");
		sessionVO = (sessionVO)session.getAttribute("sessionVO");
		int userSerial = sessionVO.getUserSerial();
		String storyRoom = request.getParameter("storyRoom");
		String minimi = request.getParameter("minimi");
		String[] minimiXY = request.getParameter("xy").split(",");
		String minimiX = minimiXY[0];
		String minimiY = minimiXY[1];
		/*System.out.println(storyRoom);
		System.out.println(minimi);
		System.out.println(minimiX + ", " + minimiY);*/
		itemService.updateStoryRoom(userSerial, storyRoom);
		itemService.updateMinimi(userSerial, minimi, minimiX, minimiY);
		
		return "";
	}
	
	@RequestMapping("miniHp_mousePointer.do")
	public String setMousePointer(HttpSession session, Model model) {
		System.out.println("미니홈피 마우스 커서 컨트롤러");
		sessionVO = (sessionVO)session.getAttribute("sessionVO");
		int userSerial = sessionVO.getUserSerial();
		itemVO = itemService.getItemList(userSerial);
		List<MiniHpUserItemVO> mouseList = itemService.getMouseList(userSerial);
		
		int mouseSize = mouseList.size();
		
		model.addAttribute("itemList", itemVO);
		model.addAttribute("mouseList", mouseList);
		model.addAttribute("mouseSize", mouseSize);
		System.out.println(mouseSize);
		
		return "MiniHP/MiniHP_Setting_MousePointer";
	}
	
	@ResponseBody
	@PostMapping("miniHp_saveMousePointer.do")
	public String saveMousePointer(HttpServletRequest request, HttpSession session) {
		System.out.println("미니홈피 마우스 커서 저장 컨트롤러");
		sessionVO = (sessionVO)session.getAttribute("sessionVO");
		int userSerial = sessionVO.getUserSerial();
		String mousePointer = request.getParameter("mousePointer");
		if(mousePointer.equals("기본")) {
			mousePointer = "";
		}
		itemService.updateMousePointer(userSerial, mousePointer);
		
		return "";
	}
	
	@RequestMapping("miniHp_playList.do")
	public String setplayList(HttpSession session, Model model) {
		System.out.println("미니홈피 배경음악 컨트롤러");
		sessionVO = (sessionVO)session.getAttribute("sessionVO");
		int userSerial = sessionVO.getUserSerial();
		
		List<MiniHpMusicVO> notUsingSongList = itemService.getNotUsingSongList(userSerial);
		List<MiniHpMusicVO> playList = itemService.getPlayList(userSerial);
		
		model.addAttribute("notUsingSongList",notUsingSongList);
		model.addAttribute("playList", playList);
				
		return "MiniHP/MiniHP_Setting_PlayList";
	}
	

	/*미니홈피 스킨 화면 불러오는 컨트롤러*/
	@GetMapping("miniHp_skin.do")
	public String getSkinPage(HttpSession session, Model model) {
		System.out.println("미니홈피 배경화면 컨트롤러");
		int userSerial = Utils.getSessionUser(session);
		model.addAttribute("list",itemService.getAllSkin(userSerial));
		model.addAttribute("usingSkin",itemService.getUsingSkin(userSerial));
		
		return "MiniHP/MiniHP_Setting_Skin";
	}
	/*미니홈피 스킨 화면 바꾸는 컨트롤러*/
	@PostMapping("miniHp_skin.do")
	@ResponseBody
	public void changeSkin(HttpSession session,String src) {
		System.out.println("미니홈피 배경화면 컨트롤러");
		int userSerial = Utils.getSessionUser(session);
		itemService.updateSkin(userSerial, src);
	}
    
	@ResponseBody
	@PostMapping("miniHp_savePlayList.do")
	public String savePlayList(HttpServletRequest request, HttpSession session) {
		System.out.println("미니홈피 배경음악 저장 컨트롤러");
		sessionVO = (sessionVO)session.getAttribute("sessionVO");
		int userSerial = sessionVO.getUserSerial();
		String play = request.getParameter("playList");
		String nonPlay = request.getParameter("nonPlayList");
		String[] playList = play.split("&&");
		String[] nonPlayList = nonPlay.split("&&");
		
		itemService.setPlayList(userSerial, playList, nonPlayList);
		
		return "";

	}
}

