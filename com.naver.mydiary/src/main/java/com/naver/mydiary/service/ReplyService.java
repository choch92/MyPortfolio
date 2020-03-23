package com.naver.mydiary.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.naver.mydiary.domain.Reply;

public interface ReplyService {

	// 댓글 삽입을 위한 메소드 선언
	public boolean insert(int boardnum, String replytext, HttpServletRequest request);
	
	// 댓글 목록 보기를 위한 메소드 선언
	public List<Reply> list(int boardnum);
	
	// 댓글 갯수
	public int count(int boardnum);
	
	// 댓글 수정
	public boolean update(int boardnum, int replynum, String replytext);
	
	// 댓글 삭제
	public boolean delete(int boardnum, int replynum);
}
