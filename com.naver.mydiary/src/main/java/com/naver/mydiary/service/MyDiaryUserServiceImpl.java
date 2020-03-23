package com.naver.mydiary.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.naver.mydiary.dao.MyDiaryUserDAO;
import com.naver.mydiary.domain.MyDiaryUser;

@Service
public class MyDiaryUserServiceImpl implements MyDiaryUserService {

	@Autowired
	private MyDiaryUserDAO mydiaryuserDAO;
	
	// email 중복검사 메소드 구현
	@Override
	public boolean emailCheck(HttpServletRequest request) {
		boolean result = false;
		
		String email = request.getParameter("email");
		String r = mydiaryuserDAO.emailCheck(email);
		if(r == null) {
			result = true;
		}
		return result;
	}

	// nickname 중복검사 메소드 구현
	@Override
	public boolean nicknameCheck(HttpServletRequest request) {
		boolean result = false;
		
		String nickname = request.getParameter("nickname");
		String r = mydiaryuserDAO.nicknameCheck(nickname);
		if(r == null) {
			result = true;
		}
		return result;
	}

	// 회원가입 메소드 구현
	@Override
	public void join(MultipartHttpServletRequest request) {

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nickname = request.getParameter("nickname");	
		String phone = request.getParameter("phone");

		// gender
		String gender = request.getParameter("gender");
		if("man".equals(gender)) {
			gender = "남자";
		}else {
			gender = "여자";
		}
		
		// hobby
		// 체크박스의 값 가져와서 하나의 문자열 만들기
		String [] hobbies = request.getParameterValues("hobby");
		// 각각의 문자열에 ,를 추가
		String hobby = "";
		for(String temp : hobbies) {
			hobby = hobby + temp + ",";
		}
		// 마지막 , 는 제거
		hobby = hobby.substring(0, hobby.length()-1);
		
		// 파일 이름 만들기와 업로드, file 파라미터 값 가져오기
		MultipartFile f = request.getFile("image");
		String originName = f.getOriginalFilename();
		// 파일 명 만들기
		String filename = email + originName;
		// 파일 경로
		String path = request.getServletContext().getRealPath("/userimage");
		if(originName.length() > 0) {
			File file = new File(path + "/" + filename);
			try {
				f.transferTo(file);
			}catch(Exception e) {
				System.err.println(e.getMessage());
			}
		}else {
			filename = "default.png";
		}
		
		// year, month, day
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String day = request.getParameter("day");
		
		Calendar cal = new GregorianCalendar(Integer.parseInt(year), Integer.parseInt(month)-1, Integer.parseInt(day)+1);
		Date birthday = new Date(cal.getTimeInMillis());

		MyDiaryUser user = new MyDiaryUser();
		user.setEmail(email);
		// 암호화해서 저장하기
		user.setPw(BCrypt.hashpw(pw, BCrypt.gensalt(10)));
		user.setName(name);
		user.setNickname(nickname);
		user.setGender(gender);
		user.setImage(filename);
		user.setPhone(phone);
		user.setHobby(hobby);
		user.setBirthday(birthday);
		// 결과 리턴
		mydiaryuserDAO.join(user);
		
	}

	// 로그인 메소드 구현
	@Override
	public boolean login(HttpServletRequest request) {
		boolean result = false;
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		MyDiaryUser user = mydiaryuserDAO.login(email);
		
		request.getSession().removeAttribute("user");
		
		// email에 해당하는 데이터가 존재한다면
		if(user != null) {
			// 비밀번호 비교
			if(BCrypt.checkpw(pw, user.getPw())) {
				// session의 user에 사용자 정보 저장
				user.setPw(null);
				request.getSession().setAttribute("user", user);
				// 로그인 성공
				result = true;
			}
		}
		
		return result;
	}
	
	@Override
	public boolean login(MyDiaryUser user) {
		boolean result = false;
		// 파라미터 읽기
		String email = user.getEmail();
		String pw = user.getPw();
		
		// email을 가지고 데이터 가져오기
		MyDiaryUser user1 = mydiaryuserDAO.login(email);
		
		// email에 해당하는 데이터가 존재한다면
		if(user1 != null) {
			// 비밀번호 비교
			if(BCrypt.checkpw(pw, user1.getPw())) {
				// 로그인 성공
				result = true;
			}
		}
		return result;

	}

	// 위도 경도 메소드 구현
	@Override
	public Map<String, Object> address(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 파라미터 읽어오기
		String longitude = request.getParameter("longitude");
		String latitude = request.getParameter("latitude");
		// 다운로드 받을 URL 생성
		String addr = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x="
				+ longitude + "&y=" + latitude + "&input_coord=WGS84";
		// 위의 주소에서 문자열을 다운로드 받기
		try {
			// URL을 생성하고 연결 객체를 생성
			URL url = new URL(addr);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			// 옵션 설정
			con.setUseCaches(false);
			con.setConnectTimeout(100000);
			// 헤더 설정
			con.addRequestProperty("Authorization", "KakaoAK abfe30c50bf8646b3518958413f646c1");
			// 문자열 다운로드
			StringBuilder sb = new StringBuilder();
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			while(true) {
				String line = br.readLine();
				if(line == null) {
					break;
				}
				sb.append(line + "\n");
			}
			br.close();
			con.disconnect();
			
			String json = sb.toString();
			// json 파싱
			// 대괄호 벗기기 위해 사용
			JSONObject obj = new JSONObject(json);
			// 중괄호 벗기기 위해 사용
			JSONArray ar = obj.getJSONArray("documents");
			// 첫번째 데이터만 가져오기
			JSONObject item = ar.getJSONObject(0);
			
			// road_address 키의 값을 가져오기
			JSONObject road = item.getJSONObject("address");
			String roadaddress = road.getString("address_name");
			
			// Map에 저장
			map.put("address", roadaddress);

		}catch(Exception e) {
			System.err.println(e.getMessage());
		}
		
		return map;
	}

	// 회원 정보 수정 메소드 구현
	@Override
	public int update(MultipartHttpServletRequest request) {
		int result = 0;
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		
		MultipartFile f = request.getFile("image");
		String originName = f.getOriginalFilename();
		String filename = email + originName;
		String path = request.getServletContext().getRealPath("/userimage");
		if(originName.length() > 0) {
			File file = new File(path + "/" + filename);
			try {
				f.transferTo(file);
			}catch(Exception e) {
				System.err.println(e.getMessage());
			}
		}
		
		// DAO 메소드 호출
		MyDiaryUser user = new MyDiaryUser();
		user.setEmail(email);
		user.setPw(BCrypt.hashpw(pw, BCrypt.gensalt(10)));
		user.setNickname(nickname);
		user.setImage(filename);
		
		result = mydiaryuserDAO.update(user);
		
		return result;
	}

	// 회원 정보 삭제 메소드 구현
	@Override
	public int delete(HttpServletRequest request) {
		int result = -1;
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		HttpSession session = request.getSession();
		MyDiaryUser user = (MyDiaryUser)session.getAttribute("user");
		MyDiaryUser loginUser = mydiaryuserDAO.login(user.getEmail());
		
		if(loginUser != null) {
			if(BCrypt.checkpw(pw, loginUser.getPw())) {
				loginUser.setPw(null);
			}
			else {
				loginUser = null;
			}
		}
		if(loginUser != null) {
			result = mydiaryuserDAO.delete(user.getEmail());
		}
		
		return result;
	}
}
