package com.hiworld.client.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.minihp.dao.MiniHpIntroDAO;
import com.hiworld.minihp.vo.MiniHpIntroVO;

@Service("NeighborService")
public class NeighborServiceImpl implements NeighborService{
	
	@Autowired
	private MiniHpIntroDAO dao;
	
	/* 자기 제외 정보 전부 가져오기 */
	@Override
	public ArrayList<MiniHpIntroVO> getAllNeighbor() {
		return dao.getAllNeighbor();
	}
}
