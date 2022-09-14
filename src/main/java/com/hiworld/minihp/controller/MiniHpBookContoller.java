package com.hiworld.minihp.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hiworld.minihp.service.MiniHpBookService;
import com.hiworld.minihp.vo.MiniHpBookPagingVO;
import com.hiworld.minihp.vo.MiniHpBookReplyVO;
import com.hiworld.minihp.vo.MiniHpBookVO;

@Controller
public class MiniHpBookContoller {
	
	@Autowired
	private MiniHpBookService service;
	
	//방명록 탭
	@GetMapping("/miniHpBook.do")
	public String miniHpBook(Model model, HttpSession session,@RequestParam(defaultValue="1") int curPage) {
		System.out.println("방명록");
		
		int userSerial = Utils.getSessionUser(session);
		//현재 로그인된 유저 미니미
		model.addAttribute("writerMiniMe", service.getMiniMe(userSerial));
		
		//페이징처리-----------------------------------------------------------------------------------------------------
		int listCnt = service.countAll(userSerial);//총 게시글 수
		MiniHpBookPagingVO pagingVO = new MiniHpBookPagingVO(listCnt, curPage);//총 게시글수, 현재 페이지로 pagingVO 생성
		
		model.addAttribute("list",service.getAll(userSerial, curPage, pagingVO.getPageSize()));//현재 페이지만큼만 가져옴
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("pagination",pagingVO);
		//--------------------------------------------------------------------------------------------------------------
		return "MiniHP/MiniHP_Menu_Book";
	}
	
	//글 저장 처리
	@PostMapping("/miniHpBook.do")
	@ResponseBody
	public void miniHpVideoInsert(@RequestBody MiniHpBookVO vo,HttpSession session) {
		vo.setIsSecret(0);
		//주인 미니홈페이지에서
		//누구에게? -> 자기 자신
		int userSerial = Utils.getSessionUser(session);
		vo.setUserSerial(userSerial);
		
		//누가 -> 자기 자신
		vo.setWriteUserSerial(userSerial);
		
		System.out.println(vo);
		int result = service.insert(vo);
		if(result>0) System.out.println("방명록 insert 성공!");
		else System.out.println("방명록 insert 실패!");
	}

	//삭제
	@DeleteMapping("/miniHpBook.do/{serial}")
	@ResponseBody
	public void deleteBook(@PathVariable int serial) {
		System.out.println("deleteBook");
		int result = service.delete(serial);
		if(result>0) System.out.println("방명록 delete 성공!");
		else System.out.println("방명록 delete 실패!");
	}
	//수정
	@PutMapping("/miniHpBook.do/{serial}/{content}")
	@ResponseBody
	public void MiniHpBookUpdate(@PathVariable int serial,@PathVariable String content) {
		System.out.println("방명록 수정");
		
		int result = service.update(serial, content);
		if(result>0) System.out.println("방명록 수정 성공!");
		else System.out.println("방명록 수정 실패!");
	}
	
	//비밀로 하기
	@PostMapping("/miniHpBookSecret.do/{serial}/{isSecret}")
	@ResponseBody
	public void changeSecret(@PathVariable int serial,@PathVariable int isSecret) {
		System.out.println("비밀로 하기");
		int result = service.changeSecret(serial,isSecret);
		if(result>0) System.out.println("성공!");
		else System.out.println("실패!");
	}
	
	//댓글
	//selectAll
	@GetMapping("/MiniHpBookReply.do")
	public String selectAllReply(int bookSerial, Model model) {
		System.out.println("MiniHpBookReply.do");
		
		model.addAttribute("serial", bookSerial);
//		//댓글 총 개수
//		model.addAttribute("replyCnt", service.getReplyCnt(videoSerial));
		//댓글
		model.addAttribute("replyList", service.getAllReply(bookSerial));
		return "MiniHP/MiniHP_Menu_Book_Reply";
	}
	//insert
	@PostMapping("/MiniHpBookReply.do")
	@ResponseBody
	public void insertReply(@RequestBody MiniHpBookReplyVO vo, HttpSession session) {
		System.out.println("insert reply");
		
		int userSerial = Utils.getSessionUser(session);
		vo.setUserSerial(userSerial);
		
		System.out.println(vo);
		int result = service.insertReply(vo);
		if(result>0) System.out.println("댓글 등록 성공!");
		else System.out.println("댓글 등록 실패!");
	}
	//delete
	@DeleteMapping("/MiniHpBookReply.do/{serial}")
	@ResponseBody
	public String deleteReply(@PathVariable int serial) {
		System.out.println("deleteReply");
		
		int result = service.deleteReply(serial);
		if(result>0) return ("댓글 삭제 성공!");
		else return ("댓글 삭제 실패");
	}
	//update
	@PutMapping("/MiniHpBookReply.do/{serial}/{content}")
	@ResponseBody
	public void updateReply(@PathVariable int serial,@PathVariable String content) {
		System.out.println("updateReply");
		
		int result = service.updateReply(serial, content);
		if(result>0) System.out.println("댓글 수정 성공!");
		else System.out.println("댓글 수정 실패!");
	}
}
