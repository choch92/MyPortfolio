package com.naver.mydiary.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.mydiary.dao.ReplyDAO;
import com.naver.mydiary.domain.MyDiaryUser;
import com.naver.mydiary.domain.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDAO replyDAO;
	
	// 댓글 삽입을 하기 위한 메소드 구현
	@Override
	public boolean insert(int boardnum, String replytext, HttpServletRequest request) {
		boolean result = false;
		
		// 댓글을 작성하는 순간의 ip 가져오기
		String ip = request.getRemoteAddr();
		
		HttpSession session = request.getSession();
		MyDiaryUser user = (MyDiaryUser)session.getAttribute("user");
		String replywriter = user.getNickname();
		
		Calendar cal = new GregorianCalendar();
		Date replydate = new Date(cal.getTimeInMillis());
		Date updatedate = new Date(cal.getTimeInMillis());
		
		Reply reply = new Reply();
		reply.setBoardnum(boardnum);
		reply.setReplytext(replytext);
		reply.setReplywriter(replywriter);
		reply.setReplydate(replydate);
		reply.setUpdatedate(updatedate);
		reply.setIp(ip);
		
		int r = replyDAO.insert(reply);
		if(r>0) {
			result = true;
		}
		
		return result;
	}

	// 댓글 목록 보기를 위한 메소드 구현
	@Override
	public List<Reply> list(int boardnum) {
		List<Reply> list = new ArrayList<>();
		list = replyDAO.list(boardnum);
		return list;
	}

	// 댓글 갯수를 가져오기 위한 메소드 구현
	@Override
	public int count(int boardnum) {
		int result = 0;
		result = replyDAO.count(boardnum);
		return result;
	}

	@Override
	public boolean update(int boardnum, int replynum, String replytext) {
		boolean result = false;
		
		Reply reply = new Reply();
		reply.setBoardnum(boardnum);
		reply.setReplynum(replynum);
		reply.setReplytext(replytext);
		
		int r = replyDAO.update(reply);
		if(r>0) {
			result=true;
		}
		
		return result;
	}

	@Override
	public boolean delete(int boardnum, int replynum) {
		boolean result = false;
		
		int r = replyDAO.delete(boardnum, replynum);
		if(r > 0) {
			result=true;
		}
		
		return result;
	}

}
