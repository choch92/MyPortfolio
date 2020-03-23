package com.naver.mydiary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.mydiary.dao.BasketDAO;
import com.naver.mydiary.domain.Basket;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	private BasketDAO basketDAO;
	
	// 장바구니 추가 메소드 구현
	@Override
	public void insertCart(Basket basket) {
		basketDAO.insertCart(basket);
	}

	// 장바구니 상품 확인 메소드 구현
	@Override
	public int countCart(int fruitid, String email) {
		return basketDAO.countCart(fruitid, email);
	}

	// 장바구니 상품 수량 변경 메소드 구현
	@Override
	public void updateCart(Basket basket) {
		basketDAO.updateCart(basket);
	}

	// 장바구니 목록 메소드 구현
	@Override
	public List<Basket> listCart(String email) {
		return basketDAO.listCart(email);
	}

	// 장바구니 금액 합계 메소드 구현
	@Override
	public int sumMoney(String email) {
		return basketDAO.sumMoney(email);
	}

	// 장바구니 삭제 메소드 구현
	@Override
	public void delete(int cartid) {
		basketDAO.deleteCart(cartid);
	}
}
