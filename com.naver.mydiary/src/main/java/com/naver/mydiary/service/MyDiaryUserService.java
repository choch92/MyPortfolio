package com.naver.mydiary.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.naver.mydiary.domain.MyDiaryUser;

public interface MyDiaryUserService {
	
	// email 중복검사 메소드
	public boolean emailCheck(HttpServletRequest request);
	
	// nickname 중복검사 메소드
	public boolean nicknameCheck(HttpServletRequest request);
	
	// 회원가입을 처리를 위한 메소드(파일업로드 때문에 MultipartHttpServletRequest)
	public void join(MultipartHttpServletRequest request);
	
	// 로그인
	public boolean login(HttpServletRequest request);
	
	// pwcheck POST에 이메일과 비밀번호를 boolean으로 리턴해주는 메소드 선언
	public boolean login(MyDiaryUser user);
	
	// 회원정보 수정 메소드
	public int update(MultipartHttpServletRequest request);
	
	// 회원정보 삭제 메소드
	public int delete(HttpServletRequest request);
	
	// 위치와 경도를 받아서 주소를 리턴해주는 메소드
	public Map<String, Object> address(HttpServletRequest request);
}
