package com.naver.mydiary;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.naver.mydiary.domain.Board;
import com.naver.mydiary.domain.Criteria;
import com.naver.mydiary.domain.PageMaker;
import com.naver.mydiary.service.BoardService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	// 게시판 기능 주소 이동
	@RequestMapping(value="/board/boardetc", method=RequestMethod.GET)
	public String boardetc(Model model) {
		return "board/boardetc";
	}
	
	// board/write GET 요청
	@RequestMapping(value="/board/write", method=RequestMethod.GET)
	public String write(Model model) {
		return "board/write";
	}
	
	// board/write POST 요청
	@RequestMapping(value="/board/write", method=RequestMethod.POST)
	public String write(HttpServletRequest request, RedirectAttributes attr) {
		boolean r = boardService.write(request);
		if(r == true) {
			return "redirect:list";
		}else {
			attr.addFlashAttribute("msg", "게시글 작성에 실패했습니다.");
			return "redirect:write";
		}
	}
	// board/list GET 요청
	@RequestMapping(value="/board/list", method=RequestMethod.GET)
	public String list(Model model, HttpServletRequest request) {
		// 서비스의 메소드 호출
		List<Board> list = boardService.list(request);
		// 데이터를 저장
		model.addAttribute("list", list);
		return "board/list";
	}
	
	// 게시글 상세보기 처리 요청의 메소드를 추가
	@RequestMapping(value="/board/detail/{boardnum}", method=RequestMethod.GET)
	public String detail(@PathVariable int boardnum, Model model) {
		// 데이터 저장
		model.addAttribute("vo", boardService.detail(boardnum));
		return "board/detail";
	}
	
	// 게시글 수정 보기 처리 요청의 메소드를 추가
	@RequestMapping(value="/board/update/{boardnum}", method=RequestMethod.GET)
	public String update(@PathVariable int boardnum, Model model) {
		model.addAttribute("vo", boardService.updateView(boardnum));
		return "board/update";
	}
	
	// 게시글 수정 처리 요청의 메소드를 추가(POST)
	@RequestMapping(value="/board/update", method=RequestMethod.POST)
	public String update(HttpServletRequest request, RedirectAttributes attr) {
		boolean r = boardService.update(request);
		System.out.println("Controller");
		if(r==true) {
			attr.addFlashAttribute("msg", "게시글 수정에 성공하였습니다.");
			return "redirect:list";
		}else {
			attr.addFlashAttribute("msg", "게시글 수정에 실패하였습니다.");
			return "redirect:update";
		}
	}
	
	// 게시글 삭제 처리 요청의 메소드 추가
	@RequestMapping(value="/board/delete/{boardnum}", method=RequestMethod.GET)
	public String delete(@PathVariable int boardnum, RedirectAttributes attr) {
		boardService.delete(boardnum);
		attr.addFlashAttribute("msg", "게시글 삭제에 성공하셨습니다.");
		return "redirect:/board/list";
	}
	
	// 게시글 페이징 처리 요청(GET)의 메소드 추가
	@RequestMapping(value="/board/listPaging", method=RequestMethod.GET)
	public String listPaging(Model model, Criteria criteria, HttpServletRequest request) {
		List<Board> list = boardService.list(request);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(boardService.countBoardList(criteria));
		
		model.addAttribute("list", list);
		model.addAttribute("list", boardService.listCriteria(criteria));
		model.addAttribute("pageMaker", pageMaker);
		return "/board/listPaging";
	}
}
