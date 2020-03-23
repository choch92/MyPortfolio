package com.naver.mydiary.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.naver.mydiary.domain.Board;
import com.naver.mydiary.domain.Criteria;

public interface BoardService {

	// 게시글 작성을 처리하기 위한 메소드
	public boolean write(HttpServletRequest request);
	
	// 게시글 작성된 목록을 보기위한 메소드
	public List<Board> list(HttpServletRequest request);
	
	// 글번호(boardnum)을 가지고 하나의 게시글을 가져오는 메소드
	public Board detail(int boardnum);
	
	// 게시글 수정 보기 처리를 위한 메소드 선언
	public Board updateView(int boardnum);
	
	// 게시글 수정 처리를 위한 메소드 선언
	public boolean update(HttpServletRequest request);
	
	// 게시글 삭제 처리를 위한 메소드 선언
	public void delete(int boardnum);
	
	// 게시글 페이징 목록 도와주는 메소드 선언
	public List<Board> listCriteria(Criteria criteria);
	
	// 게시글 페이징 목록의 전체 게시글 갯수를 구할 메소드 선언
	public int countBoardList(Criteria criteria);
}
