package com.naver.mydiary.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.mydiary.dao.ScheduleDAO;
import com.naver.mydiary.domain.MyDiaryUser;
import com.naver.mydiary.domain.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDAO dao;

	// 일정 추가
	@Override
	public boolean scInsert(HttpServletRequest request) {
		boolean result = false;

		// 파라미터 받기
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String loc = request.getParameter("loc");
		String detail = request.getParameter("detail");
		String category = request.getParameter("category");

		// 현재 로그인 중인 이메일 가져오기
		MyDiaryUser u = (MyDiaryUser) request.getSession().getAttribute("user");
		String email = u.getEmail();

		// schedule 테이블에서 가장 큰 글번호 찾아오기
		int num = 1;
		Integer n = dao.maxnum();
		if (n != null) {
			num = n + 1;
		}

		// Schedule 클래스에 저장
		Schedule schedule = new Schedule();
		schedule.setNum(num);
		schedule.setStartDate(startDate);
		schedule.setEndDate(endDate);
		schedule.setLoc(loc);
		schedule.setDetail(detail);
		schedule.setCategory(category);
		schedule.setEmail(email);

		// dao 호출
		int r = dao.scInsert(schedule);

		if (r >= 0) {
			result = true;
		}

		return result;
	}

	@Override
	public List<Schedule> scList(String sDay) {
		return dao.scList(sDay);
	}

	@Override
	public Schedule scDetail(int num) {
		return dao.scDetail(num);
	}

	// 일정 수정
	@Override
	public boolean scUpdate(int num, HttpServletRequest request) {
		boolean result = false;

		// 파라미터 받기
		String category = request.getParameter("category");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String loc = request.getParameter("loc");
		String detail = request.getParameter("detail");

		// Schedule에 담기
		Schedule schedule = new Schedule();
		schedule.setNum(num);
		schedule.setCategory(category);
		schedule.setStartDate(startDate);
		schedule.setEndDate(endDate);
		schedule.setLoc(loc);
		schedule.setDetail(detail);

		// dao 호출
		int r = dao.scUpdate(schedule);

		if (r >= 0) {
			result = true;
		}

		return result;
	}

	@Override
	public void scDelete(int num) {
		dao.scDelete(num);
	}

	@Override
	public List<Schedule> scPersonal(String startDate, HttpServletRequest request) {
		List<Schedule> list = new ArrayList<>();
		HttpSession session = request.getSession();
		MyDiaryUser user = (MyDiaryUser)session.getAttribute("user");
		String email = user.getEmail();
		
		startDate = '%' + startDate + '%';
		
		Schedule schedule = new Schedule();
		schedule.setEmail(email);
		schedule.setStartDate(startDate);
		
		list = dao.scPersonal(schedule);
		
		return list;
	}

}
