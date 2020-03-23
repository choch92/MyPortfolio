package com.naver.mydiary;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.naver.mydiary.domain.Fruit;
import com.naver.mydiary.service.FruitService;

@Controller
public class FruitController {
	@Autowired
	private FruitService fruitService;
	
	// 과일 상품 기능 페이지 이동
	@RequestMapping(value = "/fruit/fruitetc", method=RequestMethod.GET)
	public String fruitetc() {
		return "/fruit/fruitetc";
	}
	
	
	// 상품 목록 전체 출력을 위한 사용자 요청 처리
	@RequestMapping(value = "/fruit/item", method=RequestMethod.GET)
	public String fruit(Model model) {
		// 서비스 메소드 호출
		List<Fruit> list = fruitService.allFruit();
		model.addAttribute("list", list);
		return "/fruit/item";
	}
	
    // 상품 상세보기를 위한 사용자 요청 처리
	// detail/fruitid 요청을 처리하는 메소드
	@RequestMapping(value = "/fruit/detail/{fruitid}", method=RequestMethod.GET)
	public String detail(@PathVariable("fruitid") int fruitid, Model model) {
		// 서비스 메소드 호출
		Fruit fruit = fruitService.getFruit(fruitid);
		// 데이터 저장
		model.addAttribute("fruit", fruit);
		return "/fruit/detail";
	}
	
	// 상품 추가를 위한 사용자 요청 처리 : GET
	@RequestMapping(value = "/fruit/insert", method=RequestMethod.GET)
	public String insert(Model model) {
		return "/fruit/insert";
	}
	// 상품 추가를 위한 사용자 요청 처리 : POST
	@RequestMapping(value = "/fruit/insert", method=RequestMethod.POST)
	public String insert(MultipartHttpServletRequest request, Model model) {
		System.out.println("dasfasdf");
		boolean r = fruitService.insert(request);
		System.out.println(r);
		if(r == true) {
			return "redirect:item";
		}else {
			return "/fruit/insert";
		}
	}
	
	// 상품 수정을 위한 사용자 요청 처리 : GET
	@RequestMapping(value = "/fruit/update/{fruitid}", method=RequestMethod.GET)
	public String update(@PathVariable("fruitid") int fruitid, Model model) {
		model.addAttribute("fruit", fruitService.updateView(fruitid));
		return "/fruit/update";
	}
	// 상품 수정을 위한 사용자 요청 처리 : POST
	@RequestMapping(value = "/fruit/update", method=RequestMethod.POST)
	public String update(MultipartHttpServletRequest request, Model model) {
			
		boolean r = fruitService.update(request);
		System.out.println(r);
		if(r == true) {
			return "redirect:item";
		}else {
			return "redirect:update";
		}
	}
	
	// 상품 삭제를 위한 사용자 요청 처리
	@RequestMapping(value = "/fruit/delete/{fruitid}", method=RequestMethod.GET)
	public String delete(@PathVariable("fruitid") int fruitid) {
		fruitService.delete(fruitid);
		return "redirect:/fruit/item";
	}
}
