<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<section class="content">
	<!-- 회원가입 -->
	<form id="updateform" enctype="multipart/form-data" method="post">
		<p align="center">
		<table border="1" width="50%" height="80%" align='center'>
			<tr>
				<td colspan="3" align="center">
					<font size="5"><em>회원정보수정</em></font>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;image</font></td>
				<td>
					<p>&nbsp;&nbsp;&nbsp;${user.image}</p>
					&nbsp;&nbsp;&nbsp;&nbsp;<img id="img" width="100" height="100" border="1"/>
					&nbsp;&nbsp;&nbsp;<input type='file' id="image" name="image" accept=".jpg,.jpeg,.gif,.png"/>
					<br/>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;email</font></td>
				<td>&nbsp;&nbsp;&nbsp;
					<input type="email" name="email" readonly="readonly" value="${user.email}" 
					id="email" size="25"maxlength=50 required="required"/>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;pw</font></td>
				<td>&nbsp;&nbsp;&nbsp; 
				<input type="password" name="pw" id="pw" size="25" required="required" />
				<div id="pwdisp"></div>
				</td>
			</tr>
			<tr>
				<td bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;pwcheck</font></td>
				<td>&nbsp;&nbsp;&nbsp;
				<input type="password" id="pw1"	size="25" required="required"/>
				</td>
			</tr>
			<tr>
				<td width="17%" bgcolor="#f5f5f5"><font size="2">&nbsp;&nbsp;nickname</font></td>
				<td>&nbsp;&nbsp;&nbsp;
				<input type="text" name="nickname" id="nickname" value="${user.nickname}" 
				size="25" pattern="([a-z, A-Z, 가-힣]){2,}" required="required"
				title="닉네임은 문자 2자 이상입니다." />
				<div id="nicknamedisp"></div>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="3">
					<p></p>
					<input type="submit" value="정보수정" class="btn btn-warning"/>	
					<input type="button" value="메인으로" class="btn btn-success"
					onclick="javascript:window.location='/'">
					<p></p>
					<div class="alert alert-warning alert-dismissable fade show">
            			<button type="button" class="close" data-dismiss="alert">&times;</button>
            			<strong>Warning!&nbsp;&nbsp;</strong>Click this button to edit your membership.
            		</div>
				</td>
			</tr>
		</table>
	</form>
	<br /> <br />

</section>

<script>

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

var nicknamecheck = false;
var nicknamedisp = document.getElementById("nicknamedisp");

// nickname 중복 검사
nickname.addEventListener("focusout", function(e){
	if(nickname.value.trim().length < 1){
		return;
	}
	// jquery의 ajax
	$.ajax({
		url:"nicknamecheck?nickname=" + nickname.value,
		data:"json",
		success:function(data){
			if(data.result == "true"){
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

document.getElementById("updateform").addEventListener("submit",function(e){
	if(nicknamecheck == false){
		document.getElementById("nicknamedisp").innerHTML = "닉네임중복검사를 수행하세요!!";
		document.getElementById("nicknamedisp").style.color='red';
		document.getElementById("nickname").focus();
		e.preventDefault();
	}
	var pw = document.getElementById("pw").value;
	var pwconfirm = document.getElementById("pw1").value;
	if(pw != pwconfirm){
		document.getElementById("pwdisp").innerHTML = "2개의 비밀번호가 다릅니다!!";
		document.getElementById("pwdisp").style.color='red';
		document.getElementById("pw").focus();
		e.preventDefault();
	}
	var pattern1 = /[0-9]/;
	var	pattern2 = /[a-zA-Z]/;
	var	pattern3 = /[!@#$%^&*()]/;
	if(!pattern1.test(pw) || !pattern2.test(pw) || !pattern3.test(pw) || pw.length < 8) {
		document.getElementById("pwdisp").innerHTML = "비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.";
		document.getElementById("pw").focus();
		e.preventDefault();
	}
})
</script>


<%@ include file="../include/footer.jsp"%>