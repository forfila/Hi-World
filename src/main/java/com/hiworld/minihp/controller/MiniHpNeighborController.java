package com.hiworld.minihp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.client.vo.sessionVO;
import com.hiworld.minihp.service.MiniHpItemService;
import com.hiworld.minihp.service.MiniHpNeighborListService;
import com.hiworld.minihp.service.MiniHpNeighborService;
import com.hiworld.minihp.vo.MiniHpNeighborListVO;
import com.hiworld.minihp.vo.MiniHpNeighborVO;
import com.hiworld.minihp.vo.MiniHpNeighborViewVO;
import com.hiworld.minihp.vo.MiniHpSelectedItemVO;

@Controller
public class MiniHpNeighborController {
	
	@Autowired
	MiniHpItemService itemService;
	
	@Autowired
	MiniHpNeighborService neighborService;
	
	@Autowired
	MiniHpNeighborListService neighborListService;
	
	MiniHpNeighborVO neighborVO;
	
	MiniHpNeighborListVO neighborListVO;
	
	MiniHpNeighborViewVO neighborViewVO;
	
	MiniHpSelectedItemVO itemVO;
	
	
	// @@@@@@@@@@@@@@@@ 이웃 신청 @@@@@@@@@@@@@@@@
	
	/*이웃 신청 목록 확인*/
	@GetMapping("/miniHp_neighborRegisterList.do")
	public String neighborRegisterList(HttpSession session, Model model) {
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		int userSerial = vo.getUserSerial();
		List<MiniHpNeighborListVO> list = neighborListService.getRegisterList(userSerial);

		model.addAttribute("registerList", list);
		
		return "MiniHP/MiniHP_NeighborRegisterList";
	}
	
	/*이웃 신청 내용 확인*/
	@GetMapping("/miniHp_neighborRegisterCheck.do")
	public String neighborRegisterCheck(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		int senderSerial = Integer.parseInt(request.getParameter("senderSerial"));
		int receiverSerial = vo.getUserSerial();
		itemVO = itemService.getItemList(senderSerial);
		neighborListVO = neighborListService.getRegisterCheck(senderSerial, receiverSerial);
		
		model.addAttribute("senderItem", itemVO);
		model.addAttribute("neighborListVO", neighborListVO);
		
		return "MiniHP/MiniHP_NeighborRegisterCheck";
	}
	
	/*이웃명 수정 신청 내용 확인*/
	@GetMapping("/miniHp_neighborUpdateCheck.do")
	public String neighborUpdateCheck(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		int senderSerial = Integer.parseInt(request.getParameter("senderSerial"));
		int receiverSerial = vo.getUserSerial();
		itemVO = itemService.getItemList(senderSerial);
		neighborListVO = neighborListService.getRegisterCheck(senderSerial, receiverSerial);
		
		model.addAttribute("senderItem", itemVO);
		model.addAttribute("neighborListVO", neighborListVO);
		
		return "MiniHP/MiniHP_NeighborUpdateCheck";
	}
	
	/*이웃 신청 결과*/
	@ResponseBody
	@PostMapping("/miniHp_neighborRegisterCheck_ok.do")
	public String neighborRegisterCheck_ok(HttpServletRequest request, MiniHpNeighborVO neighborVO) {
		int type = Integer.parseInt(request.getParameter("type"));
		
		System.out.println(neighborVO.getNeighborValue1());
		System.out.println(neighborVO.getNeighborValue2());
		neighborService.registerCheck_ok(type, neighborVO);
		
		return "";
	}
	
	/*이웃 수정 신청 결과*/
	@ResponseBody
	@PostMapping("/miniHp_neighborUpdateCheck_ok.do")
	public String neighborUpdateCheck_ok(HttpServletRequest request, MiniHpNeighborVO neighborVO) {
		int type = Integer.parseInt(request.getParameter("type"));
		
		System.out.println(neighborVO.getNeighborValue1());
		System.out.println(neighborVO.getNeighborValue2());
		neighborService.updateCheck_ok(type, neighborVO);
		
		return "";
	}
	
	/*이웃 신청 버튼 누를시!!!*/
	@GetMapping("/miniHp_neighborRegister.do")
	public String neighborRegister(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		String senderName = vo.getUserName(); //보내는이 이름
		int receiverSerial = Integer.parseInt(request.getParameter("ownerSerial")); //받는이 시리얼
		System.out.println(receiverSerial);
		String receiverName = request.getParameter("ownerName"); //받는이 이름
		itemVO = itemService.getItemList(receiverSerial);
		
		model.addAttribute("senderName", senderName);
		model.addAttribute("receiverSerial", receiverSerial);
		model.addAttribute("receiverName", receiverName);
		model.addAttribute("recevierItem", itemVO);
		
		return "MiniHP/MiniHP_NeighborRegister";
	}
	
	/*이웃 신청 했을 때!!!*/
	@ResponseBody
	@PostMapping("/miniHp_neighborRegister_ok.do")
	public String neighborRegister_ok(HttpServletRequest request, MiniHpNeighborListVO neighborListVO) {
		/*System.out.println(neighborListVO.getUserMessage());*/
		neighborListService.insertNeighborList(neighborListVO); //신청 정보를 테이블에 저장
		
		return "";
	}
	
	/*이웃 끊기*/
	@GetMapping("/miniHp_deleteNeighbor.do")
	public String deleteNeighbor(HttpServletRequest request) {
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		int userSerial = vo.getUserSerial();
		int neighborSerial = Integer.parseInt(request.getParameter("neighborSerial"));
		
		neighborService.deleteNeighbor(userSerial, neighborSerial);
		
		return "MiniHP/MiniHP_Setting_NeighborList";
	}
	
	/*이웃명 수정*/
	@GetMapping("miniHp_updateNeighbor.do")
	public String updateNeighbor(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		int userSerial = vo.getUserSerial();
		int neighborSerial = Integer.parseInt(request.getParameter("neighborSerial"));

		itemVO = itemService.getItemList(neighborSerial);
		neighborViewVO = neighborService.getNeighborList(userSerial, neighborSerial); //이웃 정보 불러오기

		model.addAttribute("neighborInfo", neighborViewVO);
		model.addAttribute("neighborItem", itemVO);
		
		return "MiniHP/MiniHP_NeighborUpdate"; 
	}
	
	@ResponseBody
	@PostMapping("/miniHp_updateNeighbor_ok.do")
	public String updateNeighbor_ok(HttpServletRequest request, MiniHpNeighborListVO neighborListVO) {
		neighborListService.insertNeighborList(neighborListVO);
		
		return "";
	}
	
	@ResponseBody
	@GetMapping("miniHp_neighborListCheck.do")
	public int neighborListCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		sessionVO vo = (sessionVO) session.getAttribute("sessionVO");
		int userSerial = vo.getUserSerial();
		int neighborSerial = Integer.parseInt(request.getParameter("neighborSerial"));

		int result = neighborListService.neighborListCheck(userSerial, neighborSerial);
		System.out.println(result);
		
		return result;
	}
}
