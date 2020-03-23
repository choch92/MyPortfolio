package com.naver.mydiary.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.mydiary.dao.BoardDAO;
import com.naver.mydiary.domain.Board;
import com.naver.mydiary.domain.Criteria;
import com.naver.mydiary.domain.MyDiaryUser;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public boolean write(HttpServletRequest request) {
		boolean result = false;
		
		// 필요한 파라미터 읽기
		String boardtitle = request.getParameter("title");
		String boardcontent = request.getParameter("content");
		
		// 로그인 한 유저의 이메일 가져오기
		HttpSession session = request.getSession();
		MyDiaryUser user = (MyDiaryUser)session.getAttribute("user");
		String email = user.getEmail();
		
		// 접속한 클라이언트의 ip 가져오기
		String ip = request.getRemoteAddr();
		
		// 글번호 만들기 - 가장 큰 글번호 + 1
		int boardnum = 1;
		Integer num = boardDAO.maxNum();
		if(num != null) {
			boardnum = num + 1;
		}
		
		Calendar cal = new GregorianCalendar();
		Date boarddate = new Date(cal.getTimeInMillis());
		Date updatedate = new Date(cal.getTimeInMillis());
		
		// 게시글 삽입을 위한 DTO 만들기
		Board board = new Board();
		board.setBoardnum(boardnum);
		board.setBoardtitle(boardtitle);
		board.setBoardcontent(boardcontent);
		board.setBoarddate(boarddate);
		board.setBoarddip(ip);
		board.setUpdatedate(updatedate);
		board.setEmail(email);
		
		// DAO 메소드 호출
		int r = boardDAO.write(board);
		if(r>0) {
			result = true;
		}
		
		return result;
	}

	@Override
	public List<Board> list(HttpServletRequest request) {
		List<Board> list = boardDAO.list();
		
		// 오늘 날짜 생성
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String t = sdf.format(today);
		for(Board board : list) {
			// 오늘 날짜와 작성일이 같을 때는 시간을 출력
			if(t.equals(sdf.format(board.getUpdatedate()))) {
				SimpleDateFormat timesdf = new SimpleDateFormat("HH:mm");
				board.setDispdate(timesdf.format(board.getUpdatedate()));
			}else {
				board.setDispdate(sdf.format(board.getUpdatedate()));
			}
		}
		
		return list;
	}

	@Override
	public Board detail(int boardnum) {
		boardDAO.updateReadcnt(boardnum);
		return boardDAO.detail(boardnum);
	}

	// 게시글 수정 보기 처리를 위한 메소드 구현
	@Override
	public Board updateView(int boardnum) {
		return boardDAO.detail(boardnum);
	}

	// 게시글 수정 처리를 위한 메소드 구현
	@Override
	public boolean update(HttpServletRequest request) {
		boolean result = false;
		System.out.println("ServiceImpl");
		int boardnum = Integer.parseInt(request.getParameter("boardnum"));
		String boardtitle = request.getParameter("title");
		String boardcontent = request.getParameter("content");
		
		if(boardtitle.length() == 0) {
			boardtitle="무제";
		}
		if(boardcontent.length() == 0) {
			boardcontent="내용없음";
		}
		
		// 필요한 데이터를 생성
		String boardip = request.getRemoteAddr();
		Board vo = new Board();
		vo.setBoardnum(boardnum);
		vo.setBoardtitle(boardtitle);
		vo.setBoardcontent(boardcontent);
		vo.setBoarddip(boardip);
		
		// DAO 메소드 호출
		int r = boardDAO.update(vo);
		if(r>0) {
			result = true;
		}
		return result;
	}

	@Override
	public void delete(int boardnum) {
		boardDAO.delete(boardnum);		
	}

	// 게시글 페이징 처리를 도와주는 메소드 구현
	@Override
	public List<Board> listCriteria(Criteria criteria) {
		List<Board> list = boardDAO.listCriteria(criteria);
		return list;
	}

	// 게시글 페이징 목록의 전체 게시글 갯수를 구할 메소드 구현
	@Override
	public int countBoardList(Criteria criteria) {
		return boardDAO.countBoardList(criteria);
	}
}
