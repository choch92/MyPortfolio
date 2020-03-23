package com.naver.mydiary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.naver.mydiary.domain.Reply;
import com.naver.mydiary.domain.Schedule;
import com.naver.mydiary.service.MyDiaryUserService;
import com.naver.mydiary.service.ReplyService;
import com.naver.mydiary.service.ScheduleService;

@RestController
public class JSONController {

	@Autowired
	private MyDiaryUserService mydiaryuserService;

	// email 중복검사 매핑
	@RequestMapping(value = "/user/emailcheck", method = RequestMethod.GET)
	public Map<String, Object> emailCheck(HttpServletRequest request) {
		boolean result = mydiaryuserService.emailCheck(request);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result + "");
		return map;
	}

	// nickname 중복검사 매핑
	@RequestMapping(value = "/user/nicknamecheck", method = RequestMethod.GET)
	public Map<String, Object> nicknameCheck(HttpServletRequest request) {
		boolean result = mydiaryuserService.nicknameCheck(request);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result + "");
		return map;
	}

	// address 주소 리턴 매핑
	@RequestMapping(value = "address", method = RequestMethod.GET)
	public Map<String, Object> address(HttpServletRequest request) {
		return mydiaryuserService.address(request);
	}

	@Autowired
	private ScheduleService service;

	@RequestMapping(value = "/diary/calendar/{sDay}", method = RequestMethod.GET)
	public String calendar(@PathVariable String sDay, Model model, HttpSession session) {
		List<Schedule> list = service.scList(sDay);
		model.addAttribute("list", list);
		return "/diary/calendar";
	}

	// 달력에 할 일 뜨게 만들기
	@RequestMapping(value = "/diary/calendar/{startDate}", method = RequestMethod.POST)
	public List<Schedule> showList(@PathVariable String startDate, Model model, HttpServletRequest request) {
		List<Schedule> list = new ArrayList<>();
		list = service.scPersonal(startDate, request);
		return list;
	}
	
	@Autowired
	private ReplyService replyService;
	
	// 댓글 삽입
	@RequestMapping(value = "/reply/insert", method=RequestMethod.POST)
	public Map<String, Object> replyInsert(@RequestParam("boardnum") int boardnum, @RequestParam("replytext") String replytext, HttpServletRequest request){
		System.err.println(boardnum);
		System.err.println(replytext);
		System.err.println("sksksksk");
		Map<String, Object> map = new HashMap<>();
		boolean result = replyService.insert(boardnum, replytext, request);
		map.put("result", result+"");
		return map;
	}
	
	// 댓글 목록
	@RequestMapping(value = "/reply/list/{boardnum}", method=RequestMethod.GET)
	// 경로에 파라미터를 포함시켜서 전송하는 경우 PathVaribale을 이용하여 파라미터를 받음
	public List<Reply> replylist(@PathVariable("boardnum") int boardnum, Model model){
		List<Reply> list = new ArrayList<>();
		list = replyService.list(boardnum);
		model.addAttribute("replyList", list);
		return list;
	}
	
	// 댓글 갯수
	@RequestMapping(value = "/reply/count/{boardnum}", method=RequestMethod.GET)
	public int replyCount(@PathVariable("boardnum") int boardnum, Model model) {
		int result = replyService.count(boardnum);
		return result;
	}
	
	// 댓글 수정
	@RequestMapping(value = "/reply/update/{boardnum}/{replynum}/{replytext}", method=RequestMethod.POST)
	public Map<String, Object> replyUpdate(@PathVariable("boardnum") int boardnum, @PathVariable("replynum") int replynum, @PathVariable("replytext") String replytext){
		Map<String, Object> map = new HashMap<>();
		boolean result = replyService.update(boardnum, replynum, replytext);
		map.put("result", result+"");
		return map;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "/reply/delete/{boardnum}/{replynum}", method=RequestMethod.GET)
	public Map<String, Object> replyDelete(@PathVariable("boardnum") int boardnum, @PathVariable("replynum") int replynum){
		Map<String, Object> map = new HashMap<>();
		boolean result = replyService.delete(boardnum, replynum);
		map.put("result", result+"");
		return map;
	}
}
