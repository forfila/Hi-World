package com.hiworld.client.service;

import java.util.ArrayList;

import com.hiworld.client.vo.BoardReplyVO;
import com.hiworld.client.vo.BoardVO;
import com.hiworld.client.vo.ClientVO;
import com.hiworld.client.vo.sessionVO;

/* 이 서비스를 호출하면 serviceimpl이 작동함 */
/* controller -> service -> serviceimpl -> dao -> mybatis */
public interface ClientService {

	
	
	/* 회원 정보 수정 */
	String updateClient(ClientVO clientVO);
	
	/* 회원 정보 삭제 */
	String deleteClinet(ClientVO clientVO);
	
	/* 회원 정보 수정시작-------------------- */

	/* 비밀번호 수정*/
	int updatepw(ClientVO clientVO);
	/* 비밀번호 조회*/
	ClientVO selectpw(int clientVO);
	
	/* 연락처 수정*/
	int updateTel(ClientVO clientVO);
	/* 연락처 조회*/
	ClientVO selectTel(int clientVO);
	/* 주소 수정*/
	int updateAddress(ClientVO clientVO);
	/* 주소 조회*/
	ClientVO selectAddress(int clientVO);
	/*-------------------회원수정 끝----------------- */
	/* 이름과 연락처로 조회*/
	ClientVO selectFindId(String name, String tel);
	/* */
	ClientVO selectFindPw(String id, String tel);
	
//	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 기능 구현 완료
	/* 전체 회원 카운트 */
	int allClientCount();
	
	/* 회원 정보 입력 */
	String insertClient(ClientVO clientVO);
	
	/* 회원가입시 미니홈피 기본값 등록 */
	String insertMiniHP(ClientVO clientVO);
	
	/* 네이버 회원 정보 확인 */
	sessionVO NaverCheckClient(String UserID);
	
	/* 회원 정보 확인 */
	sessionVO checkClient(ClientVO clientVO);
	
	/* 회원 한명 보기 */
	/* ()안에 넣은 VO값을 가지고 mapper에서 get해서 사용가능 */
	ClientVO getOneClient(String UserID);
	
	/* 아이디 중복 체크 */
	int idCheck(String userId);
	
	/* 밤톨 충전 */
	int userCash(ClientVO clientVO);
	
	/*내정보보기 비밀번호 중복체크*/
	String pwCheck(String clientVO);
	
	/* 회원 전체 카운트 */
	int countBoardPage();
	
	/* 회원 전체 보기 */
	ArrayList<ClientVO> getAllClientData();
	ArrayList<ClientVO> getAllClient(int page, int pageSize);
	
	/* 로그인시 밴 확인 */
	int checkBan(ClientVO vo);
	
//	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ADMIN @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	/* 밴한 회원 카운트 */
	int countBoardBanPage();
	
	/* 밴한 회원 전체 보기 */
	ArrayList<ClientVO> getAllBanClientData();
	ArrayList<ClientVO> getAllBanClient(int page, int pageSize);
	
	/* 밴 */
	int banClient(int UserSerial);
	
	/* 밴 풀기 */
	int unBanClient(int UserSerial);
	
	/* 게시판 등록 */
	int BoardSubmit(BoardVO boardVO);
	
	/* 게시판 갯수 가져오기 */
	int countNoticePage();
	
	/* 게시판 목록 가져오기 */
	ArrayList<BoardVO> getBoardList(int page, int pageSize);
	
	/* 게시판 세부 정보 */
	BoardVO getBoardOne(BoardVO boardVO);
	
	/* 게시판 댓글 가져오기 */
	ArrayList<BoardReplyVO> getBoardReply(BoardVO boardVO);
	
	/* 조회 1 올리기 */
	void lookUp(BoardVO boardVO);
	
	/* 게시판 삭제 */
	void BoardDelete(BoardVO boardVO);
	
	/* 관리자 댓글 등록 */
	void adminReplyInsert(BoardVO boardVO);
	
	/* 댓글 등록 */
	void insertReply(BoardVO boardVO);
	
	/* 댓글 시리얼번호 */
	String getBoardReplySerial(BoardVO boardVO);
	
	/* 댓글 삭제 */
	void ReplyDelete(BoardReplyVO boardReplyVO);
	
	/* 공지사항 갯수 가져오기 */
	int countQuestionPage();
	
	/* 공지사항 목록 가져오기 */
	ArrayList<BoardVO> getQuestionList(int page, int pageSize);

	/* 공지사항 전부 목록 가져오기 */
	ArrayList<BoardVO> getAllQuestionList();
	
	/* 관리자가 댓글 달았는지 확인 */
	int adminReplyCheck(BoardVO boardVO);
}
