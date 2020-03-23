package com.naver.mydiary.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.naver.mydiary.domain.Fruit;

public interface FruitService {

	// 상품 목록 메소드 선언
	public List<Fruit> allFruit();
	// 상품 상세 보기 메소드 선언
	public Fruit getFruit(int fruitid);
	// 상품 추가를 위한 메소드 선언
	public boolean insert(MultipartHttpServletRequest request);
	// 상품 수정을 위한 메소드 선언
	public Fruit updateView(int fruitid);
	public boolean update(MultipartHttpServletRequest request);
	// 상품 삭제를 위한 메소드 선언
	public void delete(int fruitid);
}

