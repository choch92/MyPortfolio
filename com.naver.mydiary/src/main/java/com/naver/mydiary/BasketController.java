package com.naver.mydiary;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.mydiary.domain.Basket;
import com.naver.mydiary.domain.MyDiaryUser;
import com.naver.mydiary.service.BasketService;

@Controller
public class BasketController {

	@Autowired
	private BasketService basketService;
	
	// 장바구니 추가 사용자 요청 처리
	@RequestMapping(value = "/fruit/insertCart")
	// @RequestParam은 파라미터를 1:1로 받음, @ModelAttribute는 파라미터를 DTO같은 모델을 받는 타입
	// @ModelAttribute는 자동으로 Model에 저장, 메소드 실행 결과로 리턴된 객체를 View페이지에서 사용 가능
	public String insertCart(@ModelAttribute Basket basket, HttpSession session) {
		// 로그인 한 사용자 정보 가져오기
		MyDiaryUser user = (MyDiaryUser)session.getAttribute("user");
		// 로그인 한 사용자 정보 중에서 email 값 가져오기
		String email = user.getEmail();
		// 로그인 한 사용자의 email 값을 basket에 설정
		basket.setEmail(email);
		
		// 장바구니에 기존 상품이 있는지 검사
		int count = basketService.countCart(basket.getFruitid(), email);
		if(count == 0) {
			// 없으면 insertCart
			basketService.insertCart(basket);
		}else {
			// 있으면 updateCart
			basketService.updateCart(basket);
		}
		return "redirect:/fruit/basketlist";
	}
	
	// 장바구니 목록 사용자 요청 처리
	@RequestMapping(value = "/fruit/basketlist", method=RequestMethod.GET)
	public ModelAndView basketlist(HttpSession session, ModelAndView mav) {
		MyDiaryUser user = (MyDiaryUser)session.getAttribute("user");
		String email = user.getEmail();
		
		Map<String, Object> map = new HashMap<String, Object>();
		// 장바구니 정보
		List<Basket> list = basketService.listCart(email);
		// 장바구니 전체 금액 호출
		int sumMoney = basketService.sumMoney(email);
		// 장바구니 전체 금액에 따라 배송비 구분
		// 배송료 (10만원 이상 => 무료, 미만 => 2500원)
		int fee = sumMoney >= 100000 ? 0 : 2500;
		// 장바구니 정보를 map에 저장
		map.put("list", list);
		// 장바구니 상품의 유무
		map.put("count", list.size());
		// 장바구니 전체 금액
		map.put("sumMoney", sumMoney);
		// 배송 금액
		map.put("fee", fee);
		// 주문 상품 전체 금액
		map.put("allSum", sumMoney+fee);
		// view(jsp)의 이름 저장
		// mv.setViewName("뷰의 경로");
		mav.setViewName("fruit/basketlist");
		// 데이터 보낼 때 : addObject("변수이름", "데이터 값");
		mav.addObject("map", map);
		
		return mav;
	}
	
	// 장바구니 상품 삭제 사용자 요청 처리
	@RequestMapping(value = "/fruit/deleteCart")
	public String deleteCart(@RequestParam int cartid) {
		basketService.delete(cartid);
		return "redirect:/fruit/basketlist";
	}
}
