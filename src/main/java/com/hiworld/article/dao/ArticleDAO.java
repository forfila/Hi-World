package com.hiworld.article.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.hiworld.article.vo.ArticleVO;

public interface ArticleDAO {

	int countAllArticlePage();
	
	ArrayList<ArticleVO> getAllArticle(@Param("offset")int offset, @Param("size")int size);
	
	int countArticlePage(String list);
	
	ArrayList<ArticleVO> getSelectArticle(@Param("list")String list, @Param("offset")int offset, @Param("size")int size);
	
	int insert(ArticleVO vo);
	
	ArticleVO getOneArticle(String ArticleName);
	
	ArticleVO check(ArticleVO vo);
	
	int basket(ArticleVO vo);
	
	int basketCheck(ArticleVO vo);
	
	ArrayList<ArticleVO> getUserArticle(int UserSerial);
	
	int cash(ArticleVO vo);
	
	int delBasket(ArticleVO vo);
	
	int totalBay(int UserSerial);
	
	int delAllBasket(int UserSerial);
	
	int insertArticle(ArticleVO vo);
}
