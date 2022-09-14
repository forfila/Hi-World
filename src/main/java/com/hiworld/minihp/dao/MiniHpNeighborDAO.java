package com.hiworld.minihp.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hiworld.minihp.vo.MiniHpNeighborVO;

@Repository
public interface MiniHpNeighborDAO {
	
	/*이웃 중복체크*/
	MiniHpNeighborVO checkNeighbor(@Param("senderSerial")int senderSerial, @Param("receiverSerial")int receiverSerial);
	
	/*이웃 수락시 이웃 정보 입력*/
	void insertNeighbor(MiniHpNeighborVO neighborVO);
	
	/*이웃명 수정시 이웃 정보 수정*/
	void updateNeighbor(@Param("serial1")int serial1, @Param("value1")String value1, @Param("serial2")int serial2, @Param("value2")String value2);
	
	/*이웃 목록 불러오기*/
	List<MiniHpNeighborVO> getNeighborList(int userSerial);
	
	/*이웃 정보 불러오기*/
	MiniHpNeighborVO getNeighborListInfo(@Param("userSerial")int userSerial, @Param("neighborSerial")int neighborSerial);

	/*이웃 끊기*/
	void deleteNeighbor(@Param("userSerial")int userSerial, @Param("neighborSerial")int neighborSerial);
}
