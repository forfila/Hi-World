package com.hiworld.minihp.service;

import java.util.List;

import com.hiworld.minihp.vo.MiniHpNeighborListVO;

public interface MiniHpNeighborListService {
	
	/*이웃 신청 정보 테이블에 저장*/
	void insertNeighborList(MiniHpNeighborListVO neighborListVO);
	
	/*이웃 신청 목록 불러오기*/
	List<MiniHpNeighborListVO> getRegisterList(int userSerial);
	
	/*이웃 신청 정보 불러오기*/
	MiniHpNeighborListVO getRegisterCheck(int senderSerial, int receiverSerial);
	
	/*이웃 신청 여부 확인*/
	int neighborListCheck(int userSerial, int neighborSerial);

}
