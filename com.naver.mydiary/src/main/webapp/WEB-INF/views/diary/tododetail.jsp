<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="row">
	<div class="container">
		<br />
		<h3 class="mb-5">
			<em>일정 상세보기</em>
		</h3>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<form id="tododetail" accept-charset="UTF-8" method="post" role="form" action="tododetail">
				<table width="50%" height="80%">
					<tr>
						<td>
							<div class="form-group">
								<i class="fas fa-user"></i>&nbsp;<label>작성자</label> 
								<input class="form-control" name='writer' value="${user.nickname}" readonly="readonly">
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group">
								<i class="fas fa-calendar-check"></i>&nbsp;<label>카테고리</label><br/>
								<c:if test="${vo.category=='date'}">
									<input type="radio" name="category" id="category" value="date" size="35" checked="checked"/>&nbsp;데이트&nbsp;
                        			<input type="radio" name="category" id="category" value="anniversary" size="35"onClick="return(false);"/>&nbsp;기념일&nbsp;
                        			<input type="radio" name="category" id="category" value="friend" size="35"onClick="return(false);"/>&nbsp;친구&nbsp;
                        			<input type="radio" name="category" id="category" value="company" size="35"onClick="return(false);"/>&nbsp;직장&nbsp;
                        			<input type="radio" name="category" id="category" value="hobby" size="35"onClick="return(false);"/>&nbsp;취미&nbsp;
                        			<input type="radio" name="category" id="category" value="etc" size="35"onClick="return(false);"/>&nbsp;기타&nbsp;
								</c:if>
								<c:if test="${vo.category=='anniversary'}">
									<input type="radio" name="category" id="category" value="date" size="35"onClick="return(false);"/>&nbsp;데이트&nbsp;
                        			<input type="radio" name="category" id="category" value="anniversary" size="35"checked="checked"/>&nbsp;기념일&nbsp;
                        			<input type="radio" name="category" id="category" value="friend" size="35"onClick="return(false);"/>&nbsp;친구&nbsp;
                        			<input type="radio" name="category" id="category" value="company" size="35"onClick="return(false);"/>&nbsp;직장&nbsp;
                        			<input type="radio" name="category" id="category" value="hobby" size="35"onClick="return(false);"/>&nbsp;취미&nbsp;
                        			<input type="radio" name="category" id="category" value="etc" size="35"onClick="return(false);"/>&nbsp;기타&nbsp;
								</c:if>
								<c:if test="${vo.category=='friend'}">
									<input type="radio" name="category" id="category" value="date" size="35"onClick="return(false);"/>&nbsp;데이트&nbsp;
                        			<input type="radio" name="category" id="category" value="anniversary" size="35"onClick="return(false);"/>&nbsp;기념일&nbsp;
                        			<input type="radio" name="category" id="category" value="friend" size="35"checked="checked"/>&nbsp;친구&nbsp;
                        			<input type="radio" name="category" id="category" value="company" size="35"onClick="return(false);"/>&nbsp;직장&nbsp;
                        			<input type="radio" name="category" id="category" value="hobby" size="35"onClick="return(false);"/>&nbsp;취미&nbsp;
                        			<input type="radio" name="category" id="category" value="etc" size="35"onClick="return(false);"/>&nbsp;기타&nbsp;
								</c:if>
								<c:if test="${vo.category=='company'}">
									<input type="radio" name="category" id="category" value="date" size="35"onClick="return(false);"/>&nbsp;데이트&nbsp;
                        			<input type="radio" name="category" id="category" value="anniversary" size="35"onClick="return(false);"/>&nbsp;기념일&nbsp;
                        			<input type="radio" name="category" id="category" value="friend" size="35"onClick="return(false);"/>&nbsp;친구&nbsp;
                        			<input type="radio" name="category" id="category" value="company" size="35"checked="checked"/>&nbsp;직장&nbsp;
                        			<input type="radio" name="category" id="category" value="hobby" size="35"onClick="return(false);"/>&nbsp;취미&nbsp;
                        			<input type="radio" name="category" id="category" value="etc" size="35"onClick="return(false);"/>&nbsp;기타&nbsp;
								</c:if>
								<c:if test="${vo.category=='hobby'}">
									<input type="radio" name="category" id="category" value="date" size="35"onClick="return(false);"/>&nbsp;데이트&nbsp;
                        			<input type="radio" name="category" id="category" value="anniversary" size="35"onClick="return(false);"/>&nbsp;기념일&nbsp;
                        			<input type="radio" name="category" id="category" value="friend" size="35"onClick="return(false);"/>&nbsp;친구&nbsp;
                        			<input type="radio" name="category" id="category" value="company" size="35"onClick="return(false);"/>&nbsp;직장&nbsp;
                        			<input type="radio" name="category" id="category" value="hobby" size="35"checked="checked"/>&nbsp;취미&nbsp;
                        			<input type="radio" name="category" id="category" value="etc" size="35"onClick="return(false);"/>&nbsp;기타&nbsp;
								</c:if>
								<c:if test="${vo.category=='etc'}">
									<input type="radio" name="category" id="category" value="date" size="35"onClick="return(false);"/>&nbsp;데이트&nbsp;
                        			<input type="radio" name="category" id="category" value="anniversary" size="35"onClick="return(false);"/>&nbsp;기념일&nbsp;
                        			<input type="radio" name="category" id="category" value="friend" size="35"onClick="return(false);"/>&nbsp;친구&nbsp;
                        			<input type="radio" name="category" id="category" value="company" size="35"onClick="return(false);"/>&nbsp;직장&nbsp;
                        			<input type="radio" name="category" id="category" value="hobby" size="35"onClick="return(false);"/>&nbsp;취미&nbsp;
                        			<input type="radio" name="category" id="category" value="etc" size="35"checked="checked"/>&nbsp;기타&nbsp;
								</c:if>
							</div>
						</td>
					</tr>			
					<tr>
						<td><i class="fas fa-clock"></i>&nbsp;<label>시작일</label><br /> 
						<input id="startDate" name="startDate" type="datetime-local" max="9999-12-31" value="${vo.startDate }" readonly="readonly"/>&nbsp; 
						<br /><br/></td>
					</tr>
					<tr>
						<td><i class="fas fa-clock"></i>&nbsp;<label>종료일</label><br />
						<input id="endDate" name="endDate" type="datetime-local" max="9999-12-31" value="${vo.endDate}" readonly="readonly"/>&nbsp;
						<br /><br/></td>
					</tr>
					<tr>
						<td>
							<div class="form-group">
								<i class="fas fa-coffee"></i>&nbsp;<label>약속 장소</label> <input class="form-control" name='loc' value="${vo.loc}" readonly="readonly"/>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="form-group">
								&nbsp;<i class="fas fa-file"></i>&nbsp;<label>약속 내용</label>
								<textarea class="form-control" rows="3" name='detail' readonly="readonly"><c:out value="${vo.detail}"/></textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td>
						<input type="button" value="뒤로가기" class="btn btn-success" onclick="javascript:window.location='/diary/calendar'">
						<c:if test="${user.email == vo.email}">
							<input type="button" value="일정수정" class="btn btn-warning" onclick="diaryupdate()">
							<input type="button" value="일정삭제" class="btn btn-danger" onclick="diarydelete()">
						</c:if>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel-body -->
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
