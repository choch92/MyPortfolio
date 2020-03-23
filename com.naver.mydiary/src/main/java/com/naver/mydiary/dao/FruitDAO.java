package com.naver.mydiary.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.mydiary.domain.Fruit;

@Repository
public class FruitDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// fruit 테이블에서 전체 데이터를 가져오는 메소드
	// 여러 개의 행이 나오는 경우는 List<resultType>
	// selectList를 호출하고 sql의 id 그리고 파라미터를 대입
	public List<Fruit> allFruit(){
		return sqlSession.selectList("fruit.allfruit");
	}
	
	// fruitid를 가지고 하나의 데이터를 가져오는 메소드
	// 0개나 1개의 행만 리턴하는 경우는 resultType
	// selectOne을 호출하고 sql의 id 그리고 파라미터를 대입
	public Fruit getFruit(int fruitid) {
		return sqlSession.selectOne("fruit.getfruit", fruitid);
	}
	
	// 가장 큰 상품아이디 가져오기
	public Integer maxNum()  {
		return sqlSession.selectOne("fruit.maxnum");
	}
	
	// 상품 추가 SQL문 실행
	public int insert(Fruit fruit) {
		return sqlSession.insert("fruit.insert", fruit);
	}
	
	// 상품 수정 SQL문 실행
	public int update(Fruit fruit) {
		System.out.println(fruit);
		return sqlSession.update("fruit.update", fruit);
	}
	
	// 상품 삭제 SQL문 실행
	public void delete(int fruitid) {
		sqlSession.delete("fruit.delete", fruitid);
	}

}
