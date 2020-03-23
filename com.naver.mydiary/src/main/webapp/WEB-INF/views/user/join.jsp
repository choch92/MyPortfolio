<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
table {
	width: 70%;
}

#td {
	vertical-align: middle;
}
</style>
<section class="content">
	<!-- action이 생략되면 이전 요청을 그대로 사용 : user/join -->
	<!-- 파일 업로드 할 때는 enctype을 설정 -->
	<form id="joinform" method="post" enctype="multipart/form-data" action="join">
		<p align="center">

		<table class="table table-hover" border="1" align="center" width="100%" height="80%">
			<tr>
				<td colspan="3" align="center">
					<h3>회원가입</h3>
				</td>
			</tr>

			<tr>
				<td id="td" bgcolor="#f5f5f5"><font size="2">
						&nbsp;&nbsp;image</font></td>
				<td>&nbsp;&nbsp;&nbsp;<img id="img" width="100" height="100" /><br/>
					&nbsp;&nbsp;&nbsp;<input type="file" id="image" name="image"
					accept=".jpg, .jpeg, .gif, .png" />
				</td>
			</tr>
			<tr>
				<td id="td" bgcolor="#f5f5f5" ><font size="2">
						&nbsp;&nbsp;email</font></td>
				<td>&nbsp;&nbsp;&nbsp;<input type="text" id="email" type="email"
					name="email" size="15" required="required" /> <input type="button"
					id="emailbtn" name="emailbtn" value="중복검사" class="btn btn-primary" />
					<div id="emaildisp"></div>
				</td>
			</tr>
			<tr>
				<td id="td" bgcolor="#f5f5f5"><font size="2">
						&nbsp;&nbsp;pw</font></td>
				<td>&nbsp;&nbsp;&nbsp;<input type="password" id="pw" name="pw"
					size="15" required="required" />
					<div id="pwdisp"></div>
				</td>
			</tr>
			<tr>
				<td id="td" bgcolor="#f5f5f5"><font size="2">
						&nbsp;&nbsp;pwcheck</font></td>
				<td>&nbsp;&nbsp;&nbsp;<input type="password" id="pw1" size="15"
					required="required" />
				</td>
			</tr>
			<tr>
				<td id="td" bgcolor="#f5f5f5"><font size="2">
						&nbsp;&nbsp;name</font></td>
				<td>&nbsp;&nbsp;&nbsp;<input type="text" id="name" name="name"
					size="15" required="required" />
				</td>
			</tr>
			<tr>
				<td id="td" bgcolor="#f5f5f5"><font size="2">
						&nbsp;&nbsp;alias</font></td>
				<td>&nbsp;&nbsp;&nbsp;<input type="text" id="nickname"
					name="nickname" size="15" required="required" />
					<div id="nicknamedisp"></div>
				</td>
			</tr>
			<tr>
				<td id="td" bgcolor="#f5f5f5"><font size="2">
						&nbsp;&nbsp;gender</font></td>
				<td>&nbsp;&nbsp;&nbsp;<input type="radio" name="gender"
					id="gender" checked="checked" value="man" />&nbsp;남자
					&nbsp;&nbsp;&nbsp;<input type="radio" name="gender" id="gender"
					value="woman" />&nbsp;여자
					<div id="genderdisp"></div>
				</td>
			</tr>
			<tr>
				<td id="td" bgcolor="#f5f5f5"><font size="2">
						&nbsp;&nbsp;phone</font></td>
				<td>&nbsp;&nbsp;&nbsp;<input type="text" id="phone"
					name="phone" size="15" placeholder=" - 를 제외하고 입력" />
					<div id="phonedisp"></div>
				</td>
			</tr>
			<tr>
				<td id="td" bgcolor="#f5f5f5"><font size="2">
						&nbsp;&nbsp;hobby</font></td>
				<td>&nbsp;&nbsp;&nbsp;<input type="checkbox" name="hobby"
					value="sports" size="35" />&nbsp;운동&nbsp; <input type="checkbox"
					name="hobby" value="game" size="35" />&nbsp;게임&nbsp; <input
					type="checkbox" name="hobby" value="reading" size="35" />&nbsp;독서&nbsp;
					<input type="checkbox" name="hobby" value="mountain" size="35" />&nbsp;등산&nbsp;
					<input type="checkbox" name="hobby" value="etc" size="35" />&nbsp;기타&nbsp;
				</td>
			</tr>

			<tr>
				<td id="td" bgcolor="#f5f5f5"><font size="2">
						&nbsp;&nbsp;birth</font></td>
				<td>&nbsp; <select name="year">
						<c:forEach var="year" begin="1920" end="2019">
							<option value="${year}">${year}</option>
						</c:forEach>
				</select>년 <select name="month">
						<c:forEach var="month" begin="1" end="12">
							<option value="${month}">${month}</option>
						</c:forEach>
				</select>월 <select name="day">
						<c:forEach var="day" begin="1" end="31">
							<option value="${day}">${day}</option>
						</c:forEach>
				</select>일
			</tr>

			<tr>
				<td id="td" colspan="3" align="center">
					<p></p> 
					<input type="submit" value="회원가입" class="btn btn-warning" />&nbsp;&nbsp;
					<input type="reset" value="작성취소" class="btn btn-success" />&nbsp;&nbsp;
					<input type="button" value="메인으로" class="btn btn-primary"
					id="mainbtn" />&nbsp;&nbsp;
				</td>
			</tr>

		</table>
	</form>
</section>

<script>
	// 메인으로 버튼을 눌렀을 때 메인으로 이동하도록 설정
	document.getElementById("mainbtn").addEventListener("click", function(e){
		// 시작 페이지로 이동
		location.href="/";
	});
	// 이미지 파일의 선택이 변경되면 호출
	document.getElementById("image").addEventListener("change", function(e){
		// 선택한 파일이 있다면
		// 이벤트 처리할 때는 this가 이벤트가 발생한 객체입니다.
		// 자바스크립트에서는 null이 아니면 true로 간주합니다.
		if(this.files && this.files[0]){
			// 파일의 내용 읽기
			var reader = new FileReader();
			// 파일을 읽는 동작은 비동기적으로 동작
			reader.readAsDataURL(this.files[0]);
			// 파일을 읽는 동작이 끝나면 img 태그에 출력하도록 설정
			reader.addEventListener("load", function(e){
				var event = e || window.event;
				document.getElementById("img").src = event.target.result;
			});
		}
	});
</script>

<script>
// email, nickname 중복검사 변수
var emailcheck = false;
var nicknamecheck = false;

// email, nickanme 중복검사 위해서 필요한 DOM 객체를  찾아오기
var emailbtn = document.getElementById("emailbtn");
var nickname = document.getElementById("nickname");

var emaildisp = document.getElementById("emaildisp");
var nicknamedisp = document.getElementById("nicknamedisp");

// email 중복검사
emailbtn.addEventListener("click", function(e){
	// 이메일에 입력한 내용이 없으면 중복 검사를 수행하지 않음
	if(email.value.trim().length < 1){
		return;
	}
	// 순수 자바스크립트로 ajax 구현
	// ajax 요청 객체 생성
	var request = new XMLHttpRequest();
	// 요청 주소 생성
	request.open("GET", "emailcheck?email=" + email.value);
	// 요청
	request.send("");
	// ajax 콜백 함수 등록
	request.onreadystatechange = function(){
		// 정상 응답이 오면
		if(request.readyState == 4){
			if(request.status >= 200 && request.status < 300){
				// 읽어온 데이터를 변수에 저장
				var obj = request.responseText;
				// json 문자열을 파싱
				var json = JSON.parse(obj);
				if(json.result === "true"){
					emailcheck = true;
					emaildisp.innerHTML = "&nbsp&nbsp사용 가능한 이메일";
					emaildisp.style.color = "BLUE";
				}else{
					emailcheck = false;
					emaildisp.innerHTML = "&nbsp&nbsp이미 존재하는 이메일";
						emaildisp.style.color = "RED";								
				}
			}
		}
	}
});

// nickname 중복검사
nickname.addEventListener("focusout", function(e){
	if(nickname.value.trim().length < 1){
		return;
	}
	// jquery의 ajax
	$.ajax({
		url:"nicknamecheck?nickname=" + nickname.value,
		data:"json",
		success:function(data){
			if(data.result === "true"){
				nicknamecheck = true;
				nicknamedisp.innerHTML = "&nbsp&nbsp사용 가능한 닉네임";
				nicknamedisp.style.color = "BLUE";
			}else{
				nicknamecheck = false;
				nicknamedisp.innerHTML = "&nbsp&nbsp사용 불가능한 닉네임";
				nicknamedisp.style.color = "RED";
			}
		}
	});
});

var phone = document.getElementById("phone");
var phonedisp = document.getElementById("phonedisp");

var pw = document.getElementById("pw");
var pw1 = document.getElementById("pw1");
var pwdisp = document.getElementById("pwdisp");

// 비밀번호 입력 도중에 비밀번호의 강도 표시하기
pw.addEventListener("keyup", function(e){
	// 키보드에 입력된 값 가져오기
	var pwvalue = pw.value;
	// 정규식 만들기
	// 숫자
	var p1 = /[0-9]/;	
	// 영어 소문자
	var p2 = /[a-z]/;	
	// 영어 대문자
	var p3 = /[A-Z]/;
	// 특수기호
	var p4 = /[!@#$%^&*()]/;
	if(p1.test(pwvalue) && p2.test(pwvalue) && p3.test(pwvalue) && p4.test(pwvalue)){
		pwdisp.innerHTML = "&nbsp&nbsp강함";
		pwdisp.style.color = "GREEN";
	}else{
		pwdisp.innerHTML = "&nbsp&nbsp약함";
		pwdisp.style.color = "ORANGE";
	}
});

// 폼의 데이터를 전송할 때 이벤트 처리
document.getElementById("joinform").addEventListener("submit", function(e){
	// 이메일 중복 검사를 통과하지 않음
	if(emailcheck == false){
		emaildisp.innerHTML = "&nbsp&nbsp이메일 중복 검사를 수행하세요"
		emaildisp.style.color = "RED";
		email.focus();
		// 기본 정의된 이벤트 코드를 수행하지 않음
		e.preventDefault();
		return;
	}
	// 닉네임 중복검사를 통과하지 않으면 전송하지 않음
	if(nicknamecheck == false){
		nicknamedisp.innerHTML = "&nbsp&nbsp닉네임 중복 검사를 수행하세요"
		nicknamedisp.style.color = "RED";
		nickname.focus();
		// 기본 정의된 이벤트 코드를 수행하지 않음
		e.preventDefault();
		return;
	}
	// 비밀번호 자리 검사
	if(pw.value.trim().length < 8){
		pwdisp.innerHTML = "&nbsp&nbsp비밀번호는 8자 이상이어야 합니다.";
		pwdisp.style.color = "RED";
		pw.focus();
		e.preventDefault();
		return;
	}
	// 비밀번호 숫자, 영문 대소문자, 특수문자 1개 이상씩 포함되지 않으면 전송하지 않음
	var pwvalue = pw.value;
	var p1 = /[0-9]/;	
	var p2 = /[a-z]/;	
	var p3 = /[A-Z]/;
	var p4 = /[!@#$%^&*()]/;
	if(!p1.test(pwvalue) || !p2.test(pwvalue) || !p3.test(pwvalue) || !p4.test(pwvalue)){
		pwdisp.innerHTML = "&nbsp&nbsp비밀번호는 숫자, 영문 대소문자 특수조합으로 만들어져야 합니다.";
		pwdisp.style.color = "RED";
		pw.focus();
		e.preventDefault();
		return;
	}		
	if(pw.value != pw1.value){
		pwdisp.innerHTML = "&nbsp&nbsp비밀번호와 비밀번호 확인이 같아야 합니다.";
		pwdisp.style.color = "RED";
		pw.focus();
		e.preventDefault();
		return;
	}
	var flag = false;
	for(var i =0; i<phone.value.trim().length; i=i+1){
		var ch = phone.value.charAt(i);
		if(ch < '0' || ch > '9'){
			flag = true;
			break;
		}
	}
	if(flag == true){
		phonedisp.innerHTML = "&nbsp&nbsp전화번호는 숫자만 가능합니다.";
		phonedisp.style.color = "RED";
		phone.focus();
		e.preventDefault();
		return;
	}
});
</script>

<%@ include file="../include/footer.jsp"%>