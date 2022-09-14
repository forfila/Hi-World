package com.hiworld.client.service;

import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hiworld.client.dao.ClientDAO;
import com.hiworld.client.vo.BoardReplyVO;
import com.hiworld.client.vo.BoardVO;
import com.hiworld.client.vo.ClientVO;
import com.hiworld.client.vo.sessionVO;

/* ClientService에서 호출된것들이 여기서 관리 dao 호출 */
@Service("ClientService")
public class ClientServiceImpl implements ClientService {
	
	/* 자동적으로 dao의 값을 가지게 됨 */
	@Autowired
	private ClientDAO dao;
	
	

	/* 회원 정보 수정*/
	@Override
	public String updateClient(ClientVO clientVO) {
		int checkNumber = dao.updateClient(clientVO);
		String checkJoin = "";
		
		/* 회원수정 잘 되었는지 체크 */
		if(checkNumber==0) {
			checkJoin = "fail";
		}else if(checkNumber==-1) {
			checkJoin = "error";
		}else {
			checkJoin = "success";
		}
		
		return checkJoin;
		
	}
/* 회원 정보 수정 시작====================================*/
	
	/*비밀번호 수정 */
	@Override
	public int updatepw(ClientVO clientVO) {
		int checkNumber = dao.updatepw(clientVO);
		return checkNumber;
		
	}
	/* 비밀번호 조회*/
	@Override
	public ClientVO selectpw(int clientVO) {
		// TODO Auto-generated method stub
		ClientVO vo = dao.selectpw(clientVO);
		return vo;
	}
	
	/*연락처 수정 */
	@Override
	public int updateTel(ClientVO clientVO) {
		int checkNumber = dao.updateTel(clientVO);
		return checkNumber;
		
	}
	/* 연락처 조회*/
	@Override
	public ClientVO selectTel(int clientVO) {
		// TODO Auto-generated method stub
		ClientVO vo = dao.selectTel(clientVO);
		return vo;
	}
	
	
	/*주소 수정 */
	@Override
	public int updateAddress(ClientVO clientVO) {
		int checkNumber = dao.updateAddress(clientVO);
		return checkNumber;
		
	}
	/* 주소 조회*/
	@Override
	public ClientVO selectAddress(int clientVO) {
		// TODO Auto-generated method stub
		ClientVO vo = dao.selectAddress(clientVO);
		return vo;
	}
	
	/* 회원가입 수정 끝-------------------------------------------------*/
    /*회원 아이디 비번 조회	*/
	/* 회원 아이디 조회*/
	@Override
	public ClientVO selectFindId(String name, String tel) {
		// TODO Auto-generated method stub
		ClientVO id = dao.selectFindId(name, tel); 
		return id;
	}
	/* 회원 비번 임시 번호 수정후 임시 번호 리턴*/
	@Override
	public ClientVO selectFindPw(String id, String tel) {
		// TODO Auto-generated method stub
		System.out.println("비밀번호 임시 번호 왔지?");
		ClientVO userInfo = dao.selectuserInfo(id, tel);
		/* 널이 아닐경우 임시 비밀번호를 넣어 준다*/
		if(userInfo != null) {
			/* 문자도 도 넣기 위해 UUID를 이용 했음*/
			String pw = UUID.randomUUID().toString().replace("-", "");//-를 제거 하기 휘한것
			pw = pw.substring(0, 10);//많은 문자들이 저장 되어서 10번째까지 잘르기 위함
			System.out.println(pw);
			userInfo.setUserPW(pw);
		}
		System.out.println(userInfo.getUserSerial());
		System.out.println(userInfo.getUserPW());
		dao.updateFindPw(userInfo.getUserSerial(),userInfo.getUserPW());
		System.out.println("띠발");
		userInfo = dao.selectpw(userInfo.getUserSerial());
		return userInfo;
	}
	
	
	
	
	/* 회원 정보 삭제 */
	@Override
	public String deleteClinet(ClientVO clientVO) {
		int checkNumber = dao.deleteClient(clientVO);
		String checkJoin = "";
		
		/* 회원삭제 잘 되었는지 체크 */
		if(checkNumber==0) {
			checkJoin = "fail";
		}else if(checkNumber==-1) {
			checkJoin = "error";
		}else {
			checkJoin = "success";
		}
		
		return checkJoin;
	}
	
	
	/*############################################################################################# 기능구현 성공 한 곳 */
	/* 전체 회원 카운트 */
	@Override
	public int allClientCount() {
		return dao.allClientCount();
	}
	/* 회원 회원 가입 */
	@Override
	public String insertClient(ClientVO clientVO) {
		System.out.println("회원가입");
		int checkNumber = dao.insertClient(clientVO);
		String checkJoin = "";
		
		/* 회원가입 잘 되었는지 체크 */
		if(checkNumber==0) {
			/* fail이랑 error는 실패했을때 갈 페이지 명 적기 */
			checkJoin = "fail";
		}else if(checkNumber==-1) {
			checkJoin = "error";
		}else {
			/* 성공했을떄 이동할 페이지 */
			checkJoin = "Login/userinsertOK";
		}
		
		return checkJoin;
	}
	
	/*아이디 중복 체크*/
	@Override
	public int idCheck(String userId) {
		// TODO Auto-generated method stub
		System.out.println("아이디중복 체크");
		int result = dao.idCheck(userId);
		System.out.println(result);
		return result;
	}
	
	/* 회원 가입시 미니홈피 기본값 생성 */
	@Override
	public String insertMiniHP(ClientVO clientVO) {
		System.out.println("미니홈피 등록");
		int checkNumber = dao.insertMiniHP(clientVO);
		
		if(checkNumber==0) {
			return "실패";
		}else {
			return "성공";
		}
	}
	
	/* 네이버 회원 체크 */
	@Override
	public sessionVO NaverCheckClient(String UserID) {
		System.out.println("회원 체크");
		sessionVO vo = dao.NaverCheckClient(UserID);
		if(vo==null) {
			return null;
		}else {			
			return vo;
		}
	}
	
	
	/* 회원 로그인 확인 */
	@Override
	public sessionVO checkClient(ClientVO clientVO) {
		System.out.println("회원 로그인 확인");
		sessionVO vo = dao.checkClient(clientVO);
		System.out.println(vo);
		if(vo==null) {
			return null;
		}else {
			return vo;			
		}
	}
	
	/* 회원 한명 조회 */
	@Override
	public ClientVO getOneClient(String UserID) {
		System.out.println("한명 조회");
		/* 한명 정보가 담긴 VO가 넘어감 */
		return dao.getOneClient(UserID);
	}
	
	
	/* 밤톨 충전 */
	@Override
	public int userCash(ClientVO clientVO) {
		System.out.println("밤톨충전");	
		return dao.userCash(clientVO);
	}
	
	/* 내정보보기 PW 중복체크*/
	@Override
	public String pwCheck(String UserID) {
		System.out.println("PW중복체크");
		String pw =  dao.pwCheck(UserID);
		System.out.println(pw);
		return pw;
		
	}
	
	/* 회원 전체 카운트 */
	@Override
	public int countBoardPage() {
		return dao.countBoardPage();
	}
	
	/* 회원 전체 조회 */
	@Override
	public ArrayList<ClientVO> getAllClientData() {
		return dao.getAllClientData();
	}
	
	@Override
	/* sql문 실패시 자동으로 롤백 됨 */
	@Transactional
	public ArrayList<ClientVO> getAllClient(int page, int pageSize) {
		
		/* 페이징 */
		int offset = 0+(page-1)*pageSize; //1페이지일경우 1~5 2페이지일경우 6~10 이런식으로 가져옴
		ArrayList<ClientVO> list = dao.getAllClient(offset, pageSize);
		if(list==null || list.size()==0) {
			return null;
		}else {
			return list;
		}
		
	}
	
	/* 로그인시 밴 체크 */
	@Override
	public int checkBan(ClientVO clientVO) {
		return dao.checkBan(clientVO);
	}
	
	
//	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ADMIN @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/* 밴한 회원 카운트 */
	@Override
	public int countBoardBanPage() {
		return dao.countBoardBanPage();
	}
	
	/* 밴한 회원 전체 조회 */
	@Override
	public ArrayList<ClientVO> getAllBanClientData() {
		return dao.getAllBanClientData();
	}
	@Override
	public ArrayList<ClientVO> getAllBanClient(int page, int pageSize) {
		
		/* 페이징 */
		int offset = 0+(page-1)*pageSize; //1페이지일경우 1~5 2페이지일경우 6~10 이런식으로 가져옴
		ArrayList<ClientVO> list = dao.getAllBanClient(offset, pageSize);
		if(list==null || list.size()==0) {
			return null;
		}else {
			return list;
		}
		
	}
	
	/* 밴 */
	@Override
	public int banClient(int UserSerial) {
		return dao.banClient(UserSerial);
	}
	
	/* 밴 풀기 */
	@Override
	public int unBanClient(int UserSerial) {
		return dao.unBanClient(UserSerial);
	}
	
	/* 게시판 등록 */
	@Override
	public int BoardSubmit(BoardVO boardVO) {
		return dao.BoardSubmit(boardVO);
	}
	
	/* 게시판 갯수 가져오기 */
	@Override
	public int countNoticePage() {
		return dao.countNoticePage();
	}
	
	/* 게시판 목록 가져오기 */
	@Override
	public ArrayList<BoardVO> getBoardList(int page, int pageSize) {
		/* 페이징 */
		int offset = 0+(page-1)*pageSize; //1페이지일경우 1~5 2페이지일경우 6~10 이런식으로 가져옴
		ArrayList<BoardVO> list = dao.getBoardList(offset, pageSize);
		if(list==null || list.size()==0) {
			return null;
		}else {
			return list;
		}
	}
	
	/* 게시판 세부정보 */
	@Override
	public BoardVO getBoardOne(BoardVO boardVO) {
		return dao.getBoardOne(boardVO);
	}
	
	/* 게시판 댓글 */
	@Override
	public ArrayList<BoardReplyVO> getBoardReply(BoardVO boardVO) {
		return dao.getBoardReply(boardVO);
	}
	
	/* 댓글 시리얼 번호 */
	@Override
	public String getBoardReplySerial(BoardVO boardVO) {
		return dao.getBoardReplySerial(boardVO);
	}
	
	/* 조회 1 올리기 */
	@Override
	public void lookUp(BoardVO boardVO) {
		dao.lookUp(boardVO);
	}
	
	/* 게시글 삭제 */
	@Override
	public void BoardDelete(BoardVO boardVO) {
		dao.BoardDelete(boardVO);
	}
	
	/* 관리자 댓글 등록 */
	@Override
	public void adminReplyInsert(BoardVO boardVO) {
		dao.adminReplyInsert(boardVO);
	}
	
	/* 댓글 등록 */
	@Override
	public void insertReply(BoardVO boardVO) {
		dao.insertReply(boardVO);
	}
	
	/* 댓글 삭제 */
	@Override
	public void ReplyDelete(BoardReplyVO boardReplyVO) {
		dao.ReplyDelete(boardReplyVO);
	}
	
	/* 공지사항 갯수 가져오기 */
	@Override
	public int countQuestionPage() {
		return dao.countQuestionPage();
	}
	
	/* 공지사항 목록 가져오기 */
	@Override
	public ArrayList<BoardVO> getQuestionList(int page, int pageSize) {
		/* 페이징 */
		int offset = 0+(page-1)*pageSize; //1페이지일경우 1~5 2페이지일경우 6~10 이런식으로 가져옴
		ArrayList<BoardVO> list = dao.getQuestionList(offset, pageSize);
		if(list==null || list.size()==0) {
			return null;
		}else {
			return list;
		}
	}
	
	/* 공지사항 전부 목록 가져오기 */
	@Override
	public ArrayList<BoardVO> getAllQuestionList() {
		return dao.getAllQuestionList();
	}
	
	/* 관리자가 댓글 달았는지 확인 */
	@Override
	public int adminReplyCheck(BoardVO boardVO) {
		return dao.adminReplyCheck(boardVO);
	}
	
}
