package com.naver.mydiary.service;

import java.util.List;

import com.naver.mydiary.domain.Basket;

public interface BasketService {

	// 장바구니 추가 메소드 선언
	public void insertCart(Basket basket);
	
	// 장바구니 상품 확인 메소드 선언
	public int countCart(int fruitid, String email);
	
	// 장바구니 상품 수량 변경 메소드 선언
	public void updateCart(Basket basket);
	
	// 장바구니 목록 메소드 선언
	public List<Basket> listCart(String email);
	
	// 장바구니 금액 합계 메소드 선언
	public int sumMoney(String email);
	
	// 장바구니 삭제 메소드 선언
	public void delete(int cartid);

}
