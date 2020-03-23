package com.naver.mydiary.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.mydiary.domain.Board;
import com.naver.mydiary.domain.Criteria;

@Repository
public class BoardDAO {
	
	@Autowired
	// xml을 이용한 MyBatis 사용
	private SqlSession sqlSession;
	// 인터페이스 이용한 MyBaits 사용할 때는 위의 구문 생략
	// 하이버네이트를 사용할 때는 변경
	// private SessionFactory sessionFactory
	
	// 가장 큰 글번호 찾아오는 SQL 실행
	public Integer maxNum() {
		return sqlSession.selectOne("board.maxnum");
	}
	
	// 글쓰기를 위한 SQL 실행
	public int write(Board board) {
		return sqlSession.insert("board.write", board);
	}
	
	// 목록보기를 위한 SQL 실행
	public List<Board> list(){
		return sqlSession.selectList("board.list");
	}
	
	// 상세보기를 위한 SQL 실행
	public Board detail(int boardnum) {
		return sqlSession.selectOne("board.detail", boardnum);
	}
	
	// 조회수를 위한 SQL 실행
	public int updateReadcnt(int boardnum) {
		return sqlSession.update("board.updateReadcnt", boardnum);
	}
	
	// 게시글 수정을 위한 메소드 구현
	public int update(Board vo) {
		System.out.println("DAO");
		return sqlSession.update("board.update", vo);
	}
	
	// 게시글 삭제를 위한 메소드 구현
	public void delete(int boardnum) {
		sqlSession.delete("board.delete", boardnum);
	}
	
	// 게시글 페이징 처리 메소드 구현
	public List<Board> listPaging(int page){
		// 파라미터 page의 값이 0 보다 작은 음수값이 돌어올 수 없게 조건문 설정
		if(page <= 0) {
			page = 1;
		}
		page = (page - 1) * 5;
		return sqlSession.selectList("board.listPaging", page);
	}
	
	// 게시글 페이징 처리를 도와주기 위한 메소드 구현
	public List<Board> listCriteria(Criteria criteria){
		return sqlSession.selectList("board.listCriteria", criteria);
	}
	
	// 게시글 페이징 처리 중 전체 게시글의 갯수를 구할 메소드 구현
	public int countBoardList(Criteria criteria) {
		return sqlSession.selectOne("board.countBoardList", criteria);
	}
}
