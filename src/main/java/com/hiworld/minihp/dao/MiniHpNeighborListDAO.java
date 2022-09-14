package com.hiworld.minihp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hiworld.minihp.vo.MiniHpNeighborListVO;

@Repository
public interface MiniHpNeighborListDAO {

	/*이웃 신청시 신청 정보 입력*/
	void insertNeighborList(MiniHpNeighborListVO neighborListVO);
	
	/*이웃 신청 목록 불러오기*/
	List<MiniHpNeighborListVO> getRegisterList(int userSerial);
	
	/*이웃 신청 정보 불러오기*/
	MiniHpNeighborListVO getData(@Param("senderSerial")int senderSerial, @Param("receiverSerial")int receiverSerial);
	
	/*이웃 신청 수락 or 거절 시 신청 정보 삭제*/
	void deleteNeighborList(@Param("senderSerial")int senderSerial, @Param("receiverSerial")int receiverSerial);
	
	/*이웃 신청 여부 확인*/
	int listCheck(@Param("userSerial")int userSerial, @Param("neighborSerial")int neighborSerial);
}
