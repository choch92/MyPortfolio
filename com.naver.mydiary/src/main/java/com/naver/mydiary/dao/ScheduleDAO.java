package com.naver.mydiary.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.mydiary.domain.Schedule;

@Repository
public class ScheduleDAO {
	@Autowired
	private SqlSession sqlSession;

	// 일정추가
	public int scInsert(Schedule schedule) {
		return sqlSession.insert("schedule.insert", schedule);
	}

	// 글번호 찾아오기
	public Integer maxnum() {
		return sqlSession.selectOne("schedule.maxnum");
	}

	// 일정 목록
	public List<Schedule> scList(String sDay) {
		return sqlSession.selectList("schedule.list", sDay);
	}

	// 일정 자세히 SQL문 실행
	public Schedule scDetail(int num) {
		// System.out.println("dao");
		return sqlSession.selectOne("schedule.detail", num);
	}

	// 일정 수정
	public int scUpdate(Schedule schedule) {
		return sqlSession.update("schedule.update", schedule);
	}

	// 일정 삭제
	public void scDelete(int num) {
		sqlSession.delete("schedule.delete", num);
	}
	
	public List<Schedule> scPersonal(Schedule schedule){
		return sqlSession.selectList("schedule.personal", schedule);
	}
}
