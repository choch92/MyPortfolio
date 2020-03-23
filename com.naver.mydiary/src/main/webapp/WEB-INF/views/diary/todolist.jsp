<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<style>
	table{
		border-top: 1px solid #444444;
		border-collapse: collapse;
	}
	th{
		background-color:#e3f2fd;
		text-align:center;
	}
</style>

<div class="row">
	<div class="container">
		<br />
		<h3 class="mb-5">
			<em>일정 목록</em>
		</h3>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<form id="todolist" accept-charset="UTF-8" method="post" role="form" action="todolist">
				<table  border="1" width="100%" height="100%" style="border-radius:2em;">
					<tr height="45px">
						<th width="15%">카테고리</th>
						<th width="20%">일정 날짜</th>
						<th width="60%">내용</th>
					</tr>
					<c:forEach var="vo" items="${list}">
						<c:if test="${user.email == vo.email}">
							<tr height="30px">
								<td align="center">
									<c:if test="${vo.category == 'date'}">
										&nbsp;<i class="fas fa-heart"></i>&nbsp;데이트
									</c:if>
									<c:if test="${vo.category == 'anniversary'}">
										&nbsp;<i class="fas fa-calendar-alt"></i>&nbsp;기념일
									</c:if>
									<c:if test="${vo.category == 'frined'}">
										&nbsp;<i class="fas fa-user"></i>>&nbsp;친구
									</c:if>
									<c:if test="${vo.category == 'company'}">
										&nbsp;<i class="fas fa-home"></i>&nbsp;직장
									</c:if>
									<c:if test="${vo.category == 'hobby'}">
										&nbsp;<i class="fas fa-poo"></i>&nbsp;취미
									</c:if>
									<c:if test="${vo.category == 'etc'}">
										&nbsp;<i class="fas fa-cogs"></i>&nbsp;기타
									</c:if>									
								</td>
								<td align="center">
									<c:choose>
										<c:when test="${fn:length(vo.startDate) >= 10}">
											<c:out value="${fn:substring(vo.startDate,5,10)} ~ ${fn:substring(vo.endDate,5,10)}"/>
										</c:when>
										<c:otherwise>
											<c:out value="${vo.startDate}"/>
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									&nbsp;&nbsp;<a href="/diary/tododetail/${vo.num}"><c:out value="${vo.detail}"/></a>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</table>
			</form>
		</div>
		<br/><div class="panel">
			<input type="button" value="뒤로가기" class="btn btn-success" onClick="javascript:window.location='/diary/calendar'"/>
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel-body -->
</div>



<%@ include file="../include/footer.jsp"%>
