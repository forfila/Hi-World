package com.hiworld.minihp.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hiworld.minihp.service.MiniHpVideoService;
import com.hiworld.minihp.vo.MiniHPVideoFolderVO;
import com.hiworld.minihp.vo.MiniHpVideoPagingVO;
import com.hiworld.minihp.vo.MiniHpVideoReplyVO;
import com.hiworld.minihp.vo.MiniHpVideoVO;

@Controller
public class MiniHpVideoContoller {
	
	@Autowired
	private MiniHpVideoService service;
	
	//-----------------------------------------폴더--------------------------------------------------------
	//사이드 부분
	@GetMapping("/MiniHpVideoSide.do")
	public String miniHpVideoSide(Model model, HttpSession session) {
		System.out.println("MiniHpVideoSide.do");
		int userSerial = Utils.getSessionUser(session);
		model.addAttribute("folderList",service.getAllFolder(userSerial));
		return "MiniHP/MiniHP_Menu_Video_Side";
	}
	//폴더 추가
	@PostMapping("/MiniHpVideoSide.do")
	@ResponseBody
	public void addFolder(@RequestBody MiniHPVideoFolderVO vo, HttpSession session) {
		System.out.println("addFolder");
		
		int userSerial = Utils.getSessionUser(session);
		vo.setUserSerial(userSerial);
		
		System.out.println(vo);
		int result = service.addFolder(vo);
		if(result>0) System.out.println("폴더 등록 성공!");
		else System.out.println("폴더 등록 실패!");
	}
	//폴더 삭제
	@DeleteMapping("/MiniHpVideoSide.do/{serial}")
	@ResponseBody
	public String deleteFolder(@PathVariable int serial) {
		System.out.println("deleteFolder");
		System.out.println(serial);
		int result = service.deleteFolder(serial);
		if(result>0) return ("폴더 삭제 성공!");
		else return ("폴더 삭제 실패, 빈 폴더만 삭제할 수 있습니다.");
	}
	//폴더 수정
	@PutMapping("/MiniHpVideoSide.do/{serial}/{folderName}/{scope}")
	@ResponseBody
	public void updateFolder(@PathVariable int serial,@PathVariable String folderName,@PathVariable int scope) {
		System.out.println("updateFolder");
		MiniHPVideoFolderVO vo = new MiniHPVideoFolderVO();
		vo.setSerial(serial);
		vo.setFolderName(folderName);
		vo.setScope(scope);
		System.out.println(vo);
		
		int result = service.updateFolder(vo);
		if(result>0) System.out.println("폴더 수정 성공!");
		else System.out.println("폴더 수정 실패!");
	}
	
	
	
	//-----------------------------------------게시글--------------------------------------------------------
	//메인 부분
	@GetMapping("/miniHpVideo.do")
	public String miniHpVideo(Model model, HttpSession session,@RequestParam(required=false) Integer folderSerial,@RequestParam(defaultValue="1") int curPage) {
		System.out.println("miniHpVideo.do");
		
		int userSerial = Utils.getSessionUser(session);
		if(folderSerial==null)
			folderSerial = service.getFirstFolderSerial(userSerial);
		
		//페이징처리-----------------------------------------------------------------------------------------------------
		int listCnt = service.countInsideFolder(folderSerial);//총 게시글 수
		MiniHpVideoPagingVO pagingVO = new MiniHpVideoPagingVO(listCnt, curPage);//총 게시글수, 현재 페이지로 pagingVO 생성
		
		model.addAttribute("list",service.getAll(folderSerial, curPage, pagingVO.getPageSize()));//현재 페이지만큼만 가져옴
		model.addAttribute("listCnt",listCnt);
		model.addAttribute("pagination",pagingVO);
		//--------------------------------------------------------------------------------------------------------------
		model.addAttribute("currentFolderName", service.getFolderName(folderSerial));
		model.addAttribute("currentFolderSerial", folderSerial);
		return "MiniHP/MiniHP_Menu_Video";
	}
	//게시글 작성 화면
	@GetMapping("/MiniHpVideoInsert.do/{folderSerial}")
	public String miniHpVideoInsertPage(Model model,@PathVariable int folderSerial) {
		System.out.println("Video insert 화면");
		model.addAttribute("folderSerial",folderSerial);
		return "MiniHP/MiniHP_Menu_Video_Insert";
	}
	//게시글 저장 처리
	@PostMapping("/MiniHpVideoInsert.do")
	@ResponseBody
	public int miniHpVideoInsert(MultipartFile file1, MiniHpVideoVO vo, HttpServletRequest request,HttpSession session) {
		if(!file1.isEmpty()) {
			//파일명 중복방지 처리
			String fileName = Utils.getUuidFileName(file1.getOriginalFilename());
			
			Utils.saveFile(file1, fileName, request);
			vo.setFile(fileName);
		}
		vo.setUserSerial(Utils.getSessionUser(session));
		System.out.println(vo);
		int result = service.insert(vo);
		if(result>0) System.out.println("동영상 insert 성공!");
		else System.out.println("동영상 insert 실패!");
		
		return vo.getFolderSerial();//수정한 폴더 반환
	}
	//폴더 이동 popup
	@GetMapping("/updateVideoFolder.do")
	public String updateVideoFolderPopup(int serial, Model model, HttpSession session) {
		System.out.println("폴더 이동");
		model.addAttribute("serial", serial);
		
		int userSerial = Utils.getSessionUser(session);
		model.addAttribute("folderList",service.getAllFolder(userSerial));
		return "MiniHP/MiniHP_updateVideoFolder";
	}
	//폴더 이동
	@PutMapping("/updateVideoFolder.do/{videoSerial}/{folderSerial}")
	@ResponseBody
	public void updateVideoFolder(@PathVariable int videoSerial,@PathVariable int folderSerial) {
		service.updateVideoFolder(videoSerial, folderSerial);
	}
	
	//사진 삭제
	@DeleteMapping("/miniHpVideo.do")
	@ResponseBody
	public void deleteVideo(int videoSerial, String fileName,HttpServletRequest request) {
		System.out.println("deleteVideo");
		int result = service.delete(videoSerial);
		if(result>0 && !fileName.equals(""))
			Utils.deleteFile(fileName, request);
	}
	//게시글 수정 화면
	@GetMapping("/MiniHpVideoUpdate.do")
	public String MiniHpVideoUpdatePage(int serial, Model model) {
		System.out.println("MiniHpVideoUpdate.do");
		
		model.addAttribute("video",service.get(serial));
		return "MiniHP/MiniHP_Menu_Video_update";
	}
	//게시글 수정
	@PostMapping("/MiniHpVideoUpdate.do")
	@ResponseBody
	public void MiniHpVideoUpdate(MultipartFile file1, MiniHpVideoVO vo, HttpServletRequest request, Model model) {
		System.out.println("MiniHpVideoUpdate.do");
		System.out.println(vo);
		
		if(file1==null) {//첨부파일 기존 파일 그대로
			service.update(vo);
		} else {
			if(file1.isEmpty()) {//첨부파일이 없을경우: 원래 없음 or 기존 첨부파일 삭제됨
				String fileName = vo.getFile();
				vo.setFile(null);//db에는 null로
				int result1 = service.update(vo);
				if(result1>0)
					Utils.deleteFile(fileName, request);//파일 삭제
			} else {//첨부파일 있을경우
				if("".equals(vo.getFile())) {//기존에 없음 -> 새로 추가
					String fileName = Utils.getUuidFileName(file1.getOriginalFilename());
					Utils.saveFile(file1, fileName, request);
					vo.setFile(fileName);
					service.update(vo);
				} else {//기존 파일 바뀜
					String oriFileName = vo.getFile();
					//1. 새로운 파일 저장
					String fileName = Utils.getUuidFileName(file1.getOriginalFilename());
					Utils.saveFile(file1, fileName, request);
					//2. db에 있는 파일명 수정
					vo.setFile(fileName);
					//3. update
					int result2 = service.update(vo);
					//4. 기존 파일 삭제
					if(result2>0)
						Utils.deleteFile(oriFileName, request);
				}
			}
		}
	}
	
	//댓글
	//selectAll
	@GetMapping("/MiniHpVideoReply.do")
	public String selectAllReply(int videoSerial, Model model) {
		System.out.println("MiniHpVideoReply.do");
		
		model.addAttribute("serial", videoSerial);
		//댓글 총 개수
		model.addAttribute("replyCnt", service.getReplyCnt(videoSerial));
		//댓글
		model.addAttribute("replyList", service.getAllReply(videoSerial));
		return "MiniHP/reply";//이 reply페이지는 사진첩,동영상,방명록 공유함
	}
	//insert
	@PostMapping("/MiniHpVideoReply.do")
	@ResponseBody
	public void insertReply(@RequestBody MiniHpVideoReplyVO vo, HttpSession session) {
		System.out.println("insert reply");
		
		int userSerial = Utils.getSessionUser(session);
		vo.setUserSerial(userSerial);
		
		System.out.println(vo);
		int result = service.insertReply(vo);
		if(result>0) System.out.println("댓글 등록 성공!");
		else System.out.println("댓글 등록 실패!");
	}
	//delete
	@DeleteMapping("/MiniHpVideoReply.do/{serial}")
	@ResponseBody
	public String deleteReply(@PathVariable int serial) {
		System.out.println("deleteReply");
		
		int result = service.deleteReply(serial);
		if(result>0) return ("댓글 삭제 성공!");
		else return ("댓글 삭제 실패");
	}
	//update
	@PutMapping("/MiniHpVideoReply.do/{serial}/{content}")
	@ResponseBody
	public void updateReply(@PathVariable int serial,@PathVariable String content) {
		System.out.println("updateReply");
		
		int result = service.updateReply(serial, content);
		if(result>0) System.out.println("댓글 수정 성공!");
		else System.out.println("댓글 수정 실패!");
	}
}
