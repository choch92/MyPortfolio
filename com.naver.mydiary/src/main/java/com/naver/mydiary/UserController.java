package com.naver.mydiary;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.mydiary.domain.MyDiaryUser;
import com.naver.mydiary.service.MyDiaryUserService;

@Controller
public class UserController {
	
	@Autowired
	private MyDiaryUserService mydiaryuserService;
	
	// 회원가입 매핑 : GET
	@RequestMapping(value = "/user/join", method=RequestMethod.GET)
	public String join(Model model) {
		return "/user/join";
	}
	
	// 회원가입 매핑 : POST
	@RequestMapping(value = "/user/join", method=RequestMethod.POST)
	public String join(MultipartHttpServletRequest request, RedirectAttributes attr) {
		mydiaryuserService.join(request);
		// 데이터 저장 - 1회용
		attr.addFlashAttribute("msg", "회원가입 성공");
		return "redirect:/user/login";
	}
	
	// 회원수정 매핑 : GET
	@RequestMapping(value = "/user/update", method=RequestMethod.GET)
	public String update(Model model, HttpSession session) {
		// 로그인이 안되어 있으면 로그인 페이지 이동
		if(session.getAttribute("user") == null) {
			return "redirect:/user/login";
		}
		// 로그인 중이면 비밀번호를 확인하는 페이지 이동
		else {
			return "redirect:/user/pwcheck";
		}
	}
	
	// 회원수정 매핑 : 비밀번호 확인 페이지 매핑 : GET
	@RequestMapping(value = "/user/pwcheck", method=RequestMethod.GET)
	public String pwcheck(Model model) {
		return "/user/pwcheck";
	}
	
	// 회원수정 매핑 : 비밀번호 확인 페이지 매핑 : POST
	@RequestMapping(value = "/user/pwcheck", method=RequestMethod.POST)
	public String pwcheck(MyDiaryUser user, HttpSession session, RedirectAttributes attr) {
		// user에 저장되어 있는 데이터들을 불러와서 loginUser에 넣기
		MyDiaryUser loginUser = (MyDiaryUser)session.getAttribute("user");
		// loginUser의 데이터에서 email을 가져오기
		user.setEmail(loginUser.getEmail());
		// ServiceImpl에 데이터에 이메일이 있으면 비밀번호를 비교하여 boolean값으로 리턴한 것을 userXO에 넣기
		boolean userXO = mydiaryuserService.login(user);
		if(userXO == false) {
			attr.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			return "redirect:/user/pwcheck";
		}
		return "redirect:/user/updateform";
	}
	
	// 회원수정 매핑 : updateform : GET
	@RequestMapping(value = "/user/updateform", method=RequestMethod.GET)
	public String updateform() {
		return "/user/updateform";
	}
	
	// 회원수정 매핑 : updateform : POST
	@RequestMapping(value = "/user/updateform", method=RequestMethod.POST)
	public String updateform(Model model, MultipartHttpServletRequest request, RedirectAttributes attr) {
		int result = mydiaryuserService.update(request);
		if(result > 0) {
			request.getSession().removeAttribute("user");
			attr.addFlashAttribute("msg", "회원 정보 수정 완료, 변경된 정보로 로그인 하세요");
			return "redirect:/user/login";
		}else {
			return "redirect:/user/updateform";
		}
	}
	
	// 회원 삭제 : GET
	@RequestMapping(value = "/user/delete", method=RequestMethod.GET)
	public String delete(Model model, HttpSession session) {
		if(session.getAttribute("user") == null) {
			return "redirect:/user/login";
		}else {
			return "/user/delete";
		}
	}
	
	// 회원 삭제 : POST
	@RequestMapping(value = "/user/delete", method=RequestMethod.POST)
	public String delete(HttpServletRequest request, RedirectAttributes attr) {
		int result = mydiaryuserService.delete(request);
		if (result >= 0) {
			request.getSession().removeAttribute("user");
			attr.addFlashAttribute("msg", "회원 탈퇴가 성공적으로 수행되었습니다.");
			return "redirect:/";
		}else {
			attr.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			return "redirect:/user/delete";
		}
	}
	
	// 로그인 매핑 : GET
	@RequestMapping(value = "/user/login", method=RequestMethod.GET)
	public String login(Model model) {
		return "/user/login";
	}
	
	// 로그인 매핑 : POST
	@RequestMapping(value = "/user/login", method=RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, RedirectAttributes attr) {
		boolean result = mydiaryuserService.login(request);
		if(result == true) {
			return "redirect:/";
		}
		else {
			attr.addFlashAttribute("msg", "없는 아이디이거나 틀린 비밀번호 입니다.");
			return "redirect:/user/login";
		}
	}
	
	// 로그아웃 매핑 : GET
	@RequestMapping(value = "/user/logout", method=RequestMethod.GET)
	public String logout(HttpSession session, RedirectAttributes attr) {
		session.removeAttribute("user");
		attr.addFlashAttribute("msg", "로그아웃 하셨습니다.");
		return "redirect:/user/login";
	}
	
	// 기타 기능
	@RequestMapping(value = "/user/loginetc", method=RequestMethod.GET)
	public String loginetc(Model model) {
		return "/user/loginetc";
	}
}
