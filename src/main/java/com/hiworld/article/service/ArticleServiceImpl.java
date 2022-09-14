package com.hiworld.article.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hiworld.article.dao.ArticleDAO;
import com.hiworld.article.vo.ArticleVO;

@Service("ArticleSerivce")
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDAO articleDAO;

	/*상품개수*/
	@Override
	public int countAllArticlePage() {
		return articleDAO.countAllArticlePage();
	}
	
	@Override
	public ArrayList<ArticleVO> getAllArticle(int page, int pageSize) {
		/* 상품목록 가져오기 */
		System.out.println("상품가져오기");
		/* 페이징 */
		int offset = 0+(page-1)*pageSize; //1페이지일경우 1~5 2페이지일경우 6~10 이런식으로 가져옴
		ArrayList<ArticleVO> list = articleDAO.getAllArticle(offset, pageSize);
		if(list==null || list.size()==0) {
			return null;
		}else {
			return list;
		}
	}

	/* 상품 선택 갯수 */
	@Override
	public int countArticlePage(String list) {
		return articleDAO.countArticlePage(list);
	}
	
	/* 상품 선택 가져오기 */
	@Override
	public ArrayList<ArticleVO> getSelectArticle(String list, int page, int pageSize) {
		/* 페이징 */
		int offset = 0+(page-1)*pageSize; //1페이지일경우 1~5 2페이지일경우 6~10 이런식으로 가져옴
		ArrayList<ArticleVO> alist = articleDAO.getSelectArticle(list, offset, pageSize);
		if(alist==null || alist.size()==0) {
			return null;
		}else {
			return alist;
		}
	}

	/* 상품 확인 */
	public ArticleVO getOneArticle(String ArticleName) {
		System.out.println("물품정보가져오기");
		return articleDAO.getOneArticle(ArticleName);
	}

	/* 회원한테 담기 */
	@Override
	public int insert(ArticleVO vo) {
		System.out.println("회원한테 담기");
		return articleDAO.insert(vo);
	}

	/* 회원한테 상품 있는지 체크 */
	@Override
	public int check(ArticleVO vo) {
		System.out.println("상품 있는지 확인");
		ArticleVO vo2 = articleDAO.check(vo);
		if (vo2 == null) {
			return 0;
		} else {
			return 1;
		}
	}

	/* 장바구니에 담기 */
	@Override
	public int basket(ArticleVO vo) {
		System.out.println("장바구니 담기");
		return articleDAO.basket(vo);
	}

	/* 장바구니 있는지 확인 */
	@Override
	public int basketCheck(ArticleVO vo) {
		System.out.println("장바구니 확인");
		int check = articleDAO.basketCheck(vo);
		if (check != 0) {
			return 1;
		} else {
			return 0;
		}
	}

	/* 장바구니 목록 가져오기 */
	@Override
	public ArrayList<ArticleVO> getUserArticle(int UserSerial) {
		System.out.println("장바구니 목록 가져오기");
		return articleDAO.getUserArticle(UserSerial);
	}

	/* 결제금액 차감 */
	@Override
	public int cash(ArticleVO vo) {
		System.out.println("결제금액 차감");
		return articleDAO.cash(vo);
	}

	/* 장바구니에 있는 목록 삭제 */
	@Override
	public int delBasket(ArticleVO vo) {
		System.out.println("장바구니 목록삭제");
		return articleDAO.delBasket(vo);
	}

	/* 결제 한번에 하기 */
	@Override
	public int totalBay(int UserSerial) {
		System.out.println("결제 한번에");
		return articleDAO.totalBay(UserSerial);
	}

	/* 장바구니 목록 한번에 삭제 */
	@Override
	public int delAllBasket(int UserSerial) {
		System.out.println("장바구니 목록전체삭제");
		return articleDAO.delAllBasket(UserSerial);
	}

	/* 상품 등록 */
	@Override
	public int insertArticle(ArticleVO vo) {
		return articleDAO.insertArticle(vo);
	}
}
