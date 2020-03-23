package com.naver.mydiary.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import com.naver.mydiary.domain.Schedule;

public interface ScheduleService {

	// 일정추가
	public boolean scInsert(HttpServletRequest request);

	public List<Schedule> scList(String sDay);

	public Schedule scDetail(int num);

	// 일정 수정
	public boolean scUpdate(int num, HttpServletRequest request);

	// 일정 삭제
	public void scDelete(int num);
	
	public List<Schedule> scPersonal(String startDate, HttpServletRequest request);
}
