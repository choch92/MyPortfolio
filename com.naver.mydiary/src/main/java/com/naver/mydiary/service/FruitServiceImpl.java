package com.naver.mydiary.service;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.naver.mydiary.dao.FruitDAO;
import com.naver.mydiary.domain.Fruit;

@Service
public class FruitServiceImpl implements FruitService {
	@Autowired
	private FruitDAO fruitDAO;

	// 상품 목록 전체 출력을 위한 메소드 구현
	@Override
	public List<Fruit> allFruit() {
		return fruitDAO.allFruit();
	}

	// 상품 목록 상세보기를 위한 메소드 구현
	@Override
	public Fruit getFruit(int fruitid) {
		return fruitDAO.getFruit(fruitid);
	}
	
	// 상품 추가 메소드 구현
	@Override
	public boolean insert(MultipartHttpServletRequest request) {
		boolean result = false;
		
		// 상품 아이디 만들기
		int fruitid = 1;
		Integer id = fruitDAO.maxNum();
		if(id != null) {
			fruitid = id + 1;
		}
		
		// 필요한 파라미터 읽기
		String fruitname = request.getParameter("fruitname");
		String price = request.getParameter("price");
		String description = request.getParameter("description");
		
		// 파일 이름 만들기와 업로드
		// file 파라미터의 값 가져오기
		MultipartFile f = request.getFile("pictureurl");
		// 원래 이름 가져오기
		String originName = f.getOriginalFilename();
		// 유일 무이한 파일이름 만들기
		String filename = fruitname + originName;
		// 저장할 디렉토리 이름만들기
		// 프로젝트 내의 경로
		// 실행하기 전의 프로젝트 내의 webapp(WebContext)안에 디렉토리를 생성
		String path = request.getServletContext().getRealPath("/img");
		// 업로드하는 파일이 있으면
		if(originName.length() > 0) {
			// 파일 업로드
			File file = new File(path + "/" + filename);
			try {
				f.transferTo(file);
			}catch(Exception e) {
				System.err.println(e.getMessage());
				e.printStackTrace();
			}
		}else {
			filename = "default.png";
		}
		
		// 상품 삽입을 위한 DTO 만들기
		Fruit fruit = new Fruit();
		fruit.setFruitid(fruitid);
		fruit.setFruitname(fruitname);
		fruit.setPrice(Integer.parseInt(price));
		fruit.setDescription(description);
		fruit.setPictureurl(filename);

		int r = fruitDAO.insert(fruit);
		if(r > 0) {
			result = true;
		}
		System.err.println(r);
		return result;
	}

	// 상품 수정 보기 메소드 구현
	@Override
	public Fruit updateView(int fruitid) {
		return fruitDAO.getFruit(fruitid);
	}
	
	// 상품 수정 메소드 구현
	@Override
	public boolean update(MultipartHttpServletRequest request) {
		boolean result = false;
		
		// System.out.println(request.toString());
		
		int fruitid = Integer.parseInt(request.getParameter("fruitid"));
		String fruitname = request.getParameter("fruitname");
		int price = Integer.parseInt(request.getParameter("price"));
		String description = request.getParameter("description");
		
		MultipartFile f = request.getFile("pictureurl");
		String originName = f.getOriginalFilename();
		String filename = fruitname + originName;
		String path = request.getServletContext().getRealPath("/img");
		if(originName.length() > 0) {
			File file = new File(path +"/" + filename);
			try {
				f.transferTo(file);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}

		// DAO 메소드 호출
		Fruit fruit = new Fruit();
		fruit.setFruitid(fruitid);
		fruit.setFruitname(fruitname);
		fruit.setPrice(price);
		fruit.setDescription(description);
		fruit.setPictureurl(filename);
		
		int r = fruitDAO.update(fruit);
		if(r > 0) {
			result = true;
		}
		
		return result;
	}

	// 상품 삭제 메소드 구현
	@Override
	public void delete(int fruitid) {
		fruitDAO.delete(fruitid);		
	}
}

