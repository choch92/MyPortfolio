package com.naver.mydiary;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naver.mydiary.domain.MyDiaryUser;
import com.naver.mydiary.domain.Schedule;
import com.naver.mydiary.service.ScheduleService;

@Controller
public class DiaryController {

   @Autowired
   private ScheduleService service;

   //달력으로 이동
   @RequestMapping(value = "/diary/calendar", method = RequestMethod.GET)
   public String calendar(Model model,HttpSession session) {
      MyDiaryUser user = (MyDiaryUser) session.getAttribute("user");
         if (user == null) {
            return "redirect:/user/login";
         }
      return "/diary/calendar";
   }

   // 일정 추가 페이지 이동
   @RequestMapping(value = "/diary/todoinsert", method = RequestMethod.GET)
   public String todoinsertGet(Model model,HttpSession session) {
      //로그인 안되어 있으면 로그인 페이지로 이동
      MyDiaryUser user=(MyDiaryUser) session.getAttribute("user");
      if(user==null) {
         return "redirect:/user/login";
      }
      
      return "/diary/todoinsert";
   }

   // 일정 추가하기
   @RequestMapping(value = "/diary/todoinsert", method = RequestMethod.POST)
   public String todoinsertPost(Model model, HttpServletRequest request) {
      // service 호출
      boolean result = service.scInsert(request);
      model.addAttribute("scInsert", result);

      if (result == false) {
         return "/diary/todoinsert";
      }

      return "/diary/calendar";
   }

   //일정 목록
   @RequestMapping(value = "/diary/todolist/{sDay}", method = RequestMethod.GET)
   public String todoList(@PathVariable String sDay, Schedule schedule, Model model, HttpSession session) {
      MyDiaryUser user = (MyDiaryUser) session.getAttribute("user");
      if (user == null) {
         return "redirect:/user/login";
      }
      List<Schedule> list = service.scList(sDay);
      model.addAttribute("list", list);
      return "/diary/todolist";
   }

   //일정 상세
   @RequestMapping(value = "/diary/tododetail/{num}", method = RequestMethod.GET)
   public String scDetail(@PathVariable int num, Model model, HttpServletRequest request) {
      HttpSession session=request.getSession();
      MyDiaryUser user = (MyDiaryUser) session.getAttribute("user");
         if (user == null) {
            return "redirect:/user/login";
         }
      model.addAttribute("vo", service.scDetail(num));
      return "/diary/tododetail";
   }
   
   //일정 수정으로 페이지 이동
   @RequestMapping(value="/diary/update/{num}",method=RequestMethod.GET)
   public String scUpdate(HttpSession session,@PathVariable int num,Model model) {
      MyDiaryUser user = (MyDiaryUser) session.getAttribute("user");
      if (user == null) {
         return "redirect:/user/login";
      }
      model.addAttribute("vo", service.scDetail(num));
      return "/diary/todoupdate";
   }
   
   //일정수정 하기
   @RequestMapping(value="/diary/todoupdate/{num}",method=RequestMethod.POST)
   public String scUpdate(Model model, @PathVariable int num, HttpServletRequest request) {
      HttpSession session=request.getSession();
      MyDiaryUser user = (MyDiaryUser) session.getAttribute("user");
      if (user == null) {
         return "redirect:/user/login";
      }
      
      //service 호출
      boolean result=service.scUpdate(num, request);
      
      System.err.println(result);
      
      if(result==false) {
         return "redirect:/diary/update/{num}";
      }
      
      return "redirect:/diary/tododetail/{num}";
   }
   
   //일정삭제
   @RequestMapping(value = "/diary/delete/{num}", method = RequestMethod.GET)
   public String scDelete(@PathVariable int num, HttpSession session, RedirectAttributes attr) {
      service.scDelete(num);
      attr.addFlashAttribute("msg", "게시글 삭제에 성공하셨습니다.");
      return "/diary/calendar";
   }
}