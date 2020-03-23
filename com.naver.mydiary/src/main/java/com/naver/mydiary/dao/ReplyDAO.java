package com.naver.mydiary.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.mydiary.domain.Reply;

@Repository
public class ReplyDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 댓글 쓰기를 하기 위한 SQL문 실행 메소드
	public int insert(Reply reply) {
		return sqlSession.insert("reply.insert", reply);
	}
	
	// 댓글 목록을 가져오기 위한 SQL문
	public List<Reply> list(int boardnum){
		return sqlSession.selectList("reply.list", boardnum);
	}
	
	// 댓글 갯수
	public int count(int boardnum) {
		return sqlSession.selectOne("reply.count", boardnum);
	}
	
	// 댓글 수정
	public int update(Reply reply) {
		return sqlSession.update("reply.update", reply);
	}
	
	// 댓글 삭제
	public int delete(int boardnum, int replynum) {
		return sqlSession.delete("reply.delete", boardnum);
	}
}
