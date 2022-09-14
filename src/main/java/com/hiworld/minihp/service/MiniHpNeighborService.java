package com.hiworld.minihp.service;

import java.util.List;

import com.hiworld.minihp.vo.MiniHpNeighborVO;
import com.hiworld.minihp.vo.MiniHpNeighborViewVO;

public interface MiniHpNeighborService {
	
	/*이웃 신청 결과*/
	void registerCheck_ok(int type, MiniHpNeighborVO neighborVO);
	
	/*이웃 목록 불러오기*/
	List<MiniHpNeighborViewVO> getNeighborList(int userSerial);
	
	/*이웃 정보 불러오기*/
	MiniHpNeighborViewVO getNeighborList(int userSerial, int neighborSerial);

	/*이웃 끊기*/
	void deleteNeighbor(int userSerial, int neighborSerial);
	
	/*이웃 수정 신청 결과*/
	void updateCheck_ok(int type, MiniHpNeighborVO neighborVO);

	}
