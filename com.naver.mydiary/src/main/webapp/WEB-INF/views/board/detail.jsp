<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!-- element.writedate에 moment를 쓰기 위해 스크립트 추가 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<br/><br/>
<style>
div{
margin:15px;
}
</style>

<section class="content">
	<div class="box" style="border:2px solid #FADCA5;">
		<div class="box-header">
			<h3 class="box-title" style="background:#FAFAD2; border-radius:10px; padding:3px"><em>상세보기</em></h3>
		</div>
		<div class="box-body">
			<div class="from-group">
				<label>글번호</label> 
				<input type="text" class="form-control" id="num" name="num"
						value="${vo.boardnum}" readonly="readonly" />
			</div>
		
			<div class="form-group">
				<label>제목</label> 
				<input type="text" class="form-control" id="title" name="title"
						value="${vo.boardtitle}" readonly="readonly" />
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea name="content" rows="5" readonly="readonly"
					class="form-control">${vo.boardcontent}</textarea>
			</div>
			<div class="form-group">
				<label>작성자</label> <input type="text" class="form-control"
					value="${vo.nickname}" readonly="readonly" />
			</div>
		</div>
		<div class="box-footer">
			<c:if test="${user.email == vo.email}">
				<button class="btn btn-warning" id="updatebtn" onclick="boardupdate()">수정</button>
				<button class="btn btn-danger" id="deletebtn" onclick="boarddelete()">삭제</button>
			</c:if>
			<button class="btn btn-primary" id="listbtn" onclick="location='/board/list'">목록</button>
			<button class="btn btn-success" id="listpagebtn" onclick="location='/board/listPaging'">페이징목록</button>
		</div>
	</div>
	<!-- 댓글 -->
	<div class="box" style="border:2px solid #FFB4B4; background:#F0FFF0" >
		<div class="box-header" >
			<div class="box-title" >
				<span><strong>Comments</strong></span> <span id="replyCnt"></span>
			</div>
	
			<div class="box-body">
				<table class="table">
					<tr>
						<td><textarea class="form-control" rows="3" id="replytext"
								name="replytext" placeholder="댓글을 입력하세요"></textarea><br/>
							<div align='right'>
								<button class="btn btn-success" id="replyInsert">등록</button>
							</div>
							<div id="reply"></div>
						</td>
						<td>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</section>



<script>
	// 페이지가 시작될 때 호출될 함수
	window.addEventListener('load', function(){
		//alert('페이지 시작');
		replyList();
		replyCount();
	});
</script>

<script>	
	//1.댓글 목록
	
	//댓글을 표시할 부분
	var reply = document.getElementById("reply");
	
	function replyList(){
		//글 번호 찾아오기
		var boardnum = document.getElementById("num").value;
		//ajax를 이용해서 댓글을 불러오기
		var request = new XMLHttpRequest();
		//요청 주소 생성
		request.open('GET','/reply/list/'+boardnum);
		//요청 보내기
		request.send('');
		
		//응답이 오는 것은 비동기적
		request.onreadystatechange = function() {
			//만약 정상응답이면
			if(request.readyState == 4){
				if(request.status >= 200 && request.status < 300){
					//결과를 저장
					var obj = request.responseText;
					//결과를 json 형태로 파싱
					var json = JSON.parse(obj);
					var output = "";
					json.forEach(function(element){

						output+="<input type='hidden' id='replynum' value='"+element.replynum+"'/> ";
						output+=element.replywriter+" ";
						output+=moment(element.replydate).format('YYYY/MM/DD HH:mm')+"</br>";
						output+="<input type='text' value='"+element.replytext+"' id='replytext"+element.replynum+"' readonly='readonly'/>";
						// output+="&nbsp;<input type='button' class='btn-warning' value='수정' name='reup' id='reup'/>"+" ";
						// output+="&nbsp;<input type='button' class='redel' value='삭제' name='redel"+element.replynum+"' id='"+element.replynum+"'/>"+"</br></br>";
						output+="</br></br>";
					});
					reply.innerHTML=output;
				}
			}
		};
	}
</script>

<script>
	//2.댓글 작성
	
	//댓글 작성 버튼 찾아오기
	var replyInsert = document.getElementById("replyInsert");

	//버튼 누르면
	replyInsert.addEventListener('click',function(){
		//글번호 가져오기
		var boardnum = document.getElementById("num").value;
		//댓글 내용 가져오기
		var replytext = document.getElementById("replytext").value;
		
		//댓글 내용이 없으면 알림
		if(replytext.trim().length<1){
			alert("댓글 내용을 먼저 작성해주세요");
			return;
		}
		
		//ajax 사용
		var request = new XMLHttpRequest();
		request.open('POST','/reply/insert?boardnum='+boardnum+'&replytext='+replytext);
		request.send('');
		
		request.onreadystatechange=function(){
			if(request.readyState == 4){
				if(request.status >= 200 && request.status < 300){
					var obj = request.responseText;
					var json = JSON.parse(obj);
					//성공하면
					if(json.result === "true"){
						//댓글 입력 란 리셋
						document.getElementById("replytext").value='';
						alert("댓글이 등록되었습니다");
						//댓글 다시 불러오기
						replyList();
						//댓글 개수도 다시 불러오기
						replyCount()
					}
					//실패하면 알림
					else{
						alert("댓글 작성에 실패하셨습니다. 다시 시도해주세요");
					}
				}
			}	
		};
	});
</script>

<script>
	// 3. 댓글 개수
	function replyCount(){
		var boardnum = document.getElementById("num").value;
		var request = new XMLHttpRequest();
		request.open('GET','/reply/count/'+boardnum);
		request.send('');
		
		request.onreadystatechange=function(){
			if(request.readyState==4){
				if(request.status>=200 && request.status<300){
					var obj=request.responseText;
					document.getElementById("replyCnt").innerHTML="<span style='background:#FFB4B4; border-radius:30px'>&nbsp;&nbsp;"+obj+"&nbsp;&nbsp;</span>";
				}else{
					alert("댓글 개수를 세는데 실패했습니다");
				}
			}
		}
	}
</script>

<script>
	// 4. 댓글 삭제
	// 댓글 삭제 버튼 누르면 글번호 와 댓글번호를 가져와서 DB에서 지우기
	$(document).on('click', '.redel', function(e){
		var boardnum = ${vo.boardnum};
		var replynum = e.target.id;
		
		console.log(boardnum);
		console.log(replynum);
		
		var request = new XMLHttpRequest();
		request.open('GET','/reply/delete/'+boardnum+"/"+replynum);
		request.send('');
		
		request.onreadystatechange=function(){
			if(request.readyState==4){
				if(request.status>=200 && request.status<300){
					var obj=request.responseText;
					var json=JSON.parse(obj);
					
					if(json.result==="true"){
						alert("댓글이 삭제되었습니다");
						replyList();
						replyCount();	
					}else{
						alert("댓글 삭제에 실패했습니다. 다시 시도해주세요");
					}
				}
			}
		}
	});
</script>

<script>
	<c:if test = "${user.email == vo.email}">
	//삭제 버튼을 눌렀을 때 처리
	var boarddelete = function (){
		var result = confirm("삭제하시겠습니까?");
		if (result){
			javascript:window.location='/board/delete/${vo.boardnum}';
		}
	}
	//수정 버튼을 눌렀을 때 처리
	var boardupdate = function(){
		var result = confirm("수정하시겠습니까?");
		if(result){
			javascript:window.location='/board/update/${vo.boardnum}';
		}
	}
	</c:if>
</script>

<%@ include file="../include/footer.jsp"%>



<!-- 
<script>
	// 5. 댓글 수정
	$(document).on('click', '.reup', function(e){
		// 댓글 번호 가져오기
		var replynum = e.target.id;
		console.log(replynum);
		// 댓글 보이는 부분에 포커스
		$("#replytext"+replynum).focus();
		// 댓글 보이는 부분 readonly 해제
		$("#replytext"+replynum).attr('readonly', false);
		// 수정완료 버튼과 취소버튼 보이게
		$("#reupendbtn").attr("style", "visibility:visible;");
		$("#cancel").attr("style", "visibility:visible;");
		// 수정버튼과 삭제버튼 안보이게
		$("input[name='reup"+replynum+"']").attr('style','display:none;');
		$("input[name='redel"+replynum+"']").attr('style','display:none;');
		
		// 댓글 입력란
		var replytext = document.getElementById("replytext"+replynum);
		
		// 수정 완료 버튼
		var reupendbtn = document.getElementById("reupendbtn");
		// 수정 완료 버튼 누르면 발생하는 이벤트
		reupendbtn.addEventListener('click', function(){
			// 댓글을 안적었으면 유효성 검사
			if(replytext.value.trim().length < 1){
				alert("댓글을 입력해주세요");
				return;
			}
			// 댓글 내용이 있으면 replytext 객체에 내용 대입
			replytext = replytext.value();
			// 글번호
			var boardnum = ${vo.boardnum};
			
			// ajax 실행
			var request = new XMLHttpRequest();
			request.open('POST', '/reply/update/'+boardnum+"/"+replynum+"/"+replytext);
			request.send('');
			request.onreadystatechange=function(){
				// 정상 응답이면
				if(request.readyState==4){
					// 결과 저장
					var obj = request.responseText;
					// json형태로 파싱
					var json = JSON.parse(obj);
					if(json.result === "true"){
						alert("댓글 수정에 성공하셨습니다.");
						// 댓글 다시 불러오기
						replyList();
						// 댓글 개수 다시 카운팅
						replyCount();
						// 댓글 보이는 부분 readonly 씌우기
						$("#replytext"+replynum).attr('readonly', true);
						// 수정완료 버튼과 취소버튼 안보이게
						$("#reupendbtn").attr("style", "display:none;");
						$("#cancle").attr("style", "display:none;");
						// 수정버튼과 삭제버튼 안보이게
						$("input[name='reup"+replynum+"']").attr('style','visibility:visible;');
						$("input[name='redel"+replynum+"']").attr('style','visibility:visible;');
					}
				}else{
					alert("댓글 수정에 실패하셨습니다.");
				}
			}			
		});
		
		// 취소 버튼
		var cancel = document.getElementById("cancle");
		//취소 버튼 누르면 발생하는 이벤트
		cancel.addEventListener('click',function(){
			alert("댓글 수정을 취소하셨습니다");
			//댓글 보이는 부분 readonly 씌우기
			$("#replytext"+replynum).attr('readonly',true);
			//수정완료 버튼과 취소버튼 안보이게
			$("#reupendbtn").attr("style", "display:none;");
			$("#cancel").attr("style", "display:none;");
			//수정버튼과 삭제버튼 안보이게
			$("input[name='reup"+replynum+"']").attr('style','visibility:visible;');
			$("input[name='redel"+replynum+"']").attr('style','visibility:visible;');
		});
	});
</script>
-->