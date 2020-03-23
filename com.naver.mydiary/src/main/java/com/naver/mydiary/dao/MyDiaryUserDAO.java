package com.naver.mydiary.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.mydiary.domain.MyDiaryUser;

@Repository
public class MyDiaryUserDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// email 중복검사
	public String emailCheck(String email) {
		return sqlSession.selectOne("mydiaryuser.emailcheck", email);
	}
	
	// nickname 중복검사
	public String nicknameCheck(String nickname) {
		return sqlSession.selectOne("mydiaryuser.nicknamecheck", nickname);
	}
	
	// 회원가입 요청
	public int join(MyDiaryUser mydiaryUser) {
		return sqlSession.insert("mydiaryuser.join", mydiaryUser);
	}
	
	// 로그인 요청
	public MyDiaryUser login(String email) {
		return sqlSession.selectOne("mydiaryuser.login", email);
	}
	
	// 로그인 수정 요청
	public int update(MyDiaryUser mydiaryUser) {
		return sqlSession.update("mydiaryuser.update", mydiaryUser);
	}
	
	// 로그인 삭제 요청
	public int delete(String email) {
		return sqlSession.delete("mydiaryuser.delete", email);
	}
}
