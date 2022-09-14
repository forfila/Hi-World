package com.hiworld.article.service;

import java.util.ArrayList;

import com.hiworld.article.vo.ArticleVO;

public interface ArticleService {
	
	/* 기본 정보 가져오기 */
	int countAllArticlePage();
	
	ArrayList<ArticleVO> getAllArticle(int page, int pageSize);
	
	int countArticlePage(String list);
	
	ArrayList<ArticleVO> getSelectArticle(String list, int page, int pageSize);
	
	ArticleVO getOneArticle(String ArticleName);
	
	int check(ArticleVO vo);
	
	int insert(ArticleVO vo);
	
	int basket(ArticleVO vo);
	
	int basketCheck(ArticleVO vo);
	
	ArrayList<ArticleVO> getUserArticle(int UserSerial);
	
	int cash(ArticleVO vo);
	
	int delBasket(ArticleVO vo);
	
	int totalBay(int UserSerial);
	
	int delAllBasket(int UserSerial);
	
	int insertArticle(ArticleVO vo);
	
	
}
