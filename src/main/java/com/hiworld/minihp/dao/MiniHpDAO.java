package com.hiworld.minihp.dao;

import com.hiworld.minihp.vo.MiniHpOwnerVO;

public interface MiniHpDAO {
	
	/*미니홈피 주인 정보 가져오기*/
	MiniHpOwnerVO getData(int ownerSerial);
}
