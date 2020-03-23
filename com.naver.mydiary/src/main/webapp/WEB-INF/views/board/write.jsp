<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<br/><br/>
<style>
div{
margin:15px;
}
</style>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default" style="border:2px solid #FADCA5;">
			<div class="panel-heading" style="background:#FAFAD2; border-radius:10px; padding:3px"><em><strong>게시글 작성</strong></em></div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" method="post">
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'>
					</div>
					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='content'></textarea>
					</div>
					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='writer'
							value="${user.nickname}" readonly="readonly">
					</div>
					&nbsp;<button type="submit" class="btn btn-primary">작성완료</button>
					&nbsp;<button type="reset" class="btn btn-default">다시작성</button>
					&nbsp;<input type="button" value="메인으로" class="btn btn-success"
						onclick="javascript:window.location='/'">
				</form>
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel -->
</div>


<script>
var diaryupdate = function(){
	var result = confirm("수정하시겠습니까?");
	if(result){
		javascript:window.location='/diary/update/${num}';
	}
}

var diarydelete = function (){
	var result = confirm("삭제하시겠습니까?");
	if (result){
		javascript:window.location='/diary/delete/${num}';
	}
}
</script>


<%@ include file="../include/footer.jsp"%>