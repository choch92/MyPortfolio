package com.naver.mydiary.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.mydiary.domain.Basket;

@Repository
public class BasketDAO {

	@Autowired
	private SqlSession sqlSession;
	
	// 장바구니 추가
	public void insertCart(Basket basket) {
		sqlSession.insert("basket.insertCart", basket);
	}
	
	// 장바구니 동일한 상품 레코드 확인
	public int countCart(int fruitid, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fruitid", fruitid);
		map.put("email", email);
		return sqlSession.selectOne("basket.countCart", map);
	}
	
	// 장바구니 상품수량 변경
	public void updateCart(Basket basket) {
		sqlSession.update("basket.updateCart", basket);
	}
	
	// 장바구니 목록
	public List<Basket> listCart(String email){
		return sqlSession.selectList("basket.listCart", email);
	}
	
	// 장바구니 금액 합계
	public int sumMoney(String email) {
		sqlSession.selectOne("basket.sumMoney", email);
		return sqlSession.selectOne("basket.sumMoney", email);
	}
	
	// 장바구니 삭제
	public void deleteCart(int cartid) {
		sqlSession.delete("basket.deleteCart", cartid);
	}
	
}
