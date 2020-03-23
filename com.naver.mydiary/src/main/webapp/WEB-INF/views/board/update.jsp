<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<br/><br/>
<style>
div{
margin:15px;
}
</style>

<section class="content">
	<div class="box" style="border:2px solid #FADCA5;">
		<div class="box-header">
			<h3 class="box-title" style="background:#FAFAD2; border-radius:10px; padding:3px"><em>게시글 수정</em></h3>
		</div>
		<form role="form" id="updateForm" action="/board/update" method="post">
			<!-- 글번호를 넘겨주기 위해서 숨김 객체로 생성 -->
			<input type="hidden" name="boardnum" value="${vo.boardnum}"/>
			<div class="box-body">
				<div class="form-group">
					<label>제목</label> <input type="text" name="title"
						class="form-control" value="${vo.boardtitle}"/>
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea name="content" rows="5" class="form-control">${vo.boardcontent}</textarea>
				</div>
				<div class="form-group">
					<label>작성자</label> <input type="text" class="form-control"
						value="${vo.nickname}" readonly="readonly" />
				</div>
			</div>
			<div class="box-footer">
				<button class="btn btn-success" id="updatebtn">수정완료</button>
				<button class="btn btn-warning" id="mainbtn">메인으로</button>
				<button class="btn btn-primary" id="listbtn">목록보기</button>
			</div>
		</form>
	</div>
</section>

<script>
	//메인 버튼을 눌렀을 때 처리
	document.getElementById("mainbtn").addEventListener("click", function() {
		location.href = "/";
	});
	//목록 버튼을 눌렀을 때 처리
	document.getElementById("listbtn").addEventListener("click", function() {
		location.href = "/board/list";
	});
	//수정 완료 버튼을 눌렀을 때 처리
	document.getElementById("updatebtn").addEventListener("click", function() {
		document.getElementById("updateForm").submit();
	});
</script>

<%@ include file="../include/footer.jsp"%>