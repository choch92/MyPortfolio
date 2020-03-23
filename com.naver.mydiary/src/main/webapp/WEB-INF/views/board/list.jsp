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
		<h4 class="mb-5" style="background:#FAFAD2; border-radius:10px; padding:3px">
		<c:if test="${msg == null}">
			<em>게시판 목록</em>
		</c:if>
		<c:if test="${msg != null}">
			<em>게시판 목록</em><br/><br/>
			<em><font color="red">${msg}<i class="fas fa-heart"></i></font></em>
		</c:if>
		</h4>
		<!-- /.panel-heading -->
		<div class="panel-body">
			<table  border="1" width="100%" height="100%" style="border-radius:2em;">
				<tr height="45px">
					<th width="11%">글번호</th>
					<th width="46%">제목</th>
					<th width="16%">작성자</th>
					<th width="16%">작성일</th>
					<th width="11%">조회수</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<tr height="30px">
						<td align="center">${vo.boardnum}&nbsp;</td>
						<td>&nbsp;<a href="/board/detail/${vo.boardnum}">${vo.boardtitle}</a></td>
						<td align="center">${vo.nickname}</td>
						<td align="center">${vo.dispdate}</td>
						<td align="center"><div style="background:#dcdcdc; border-radius:100px;">
						${vo.boardreadcnt}</div></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br/>
		<div class="panel">
			<input type="button" value="뒤로가기" class="btn btn-success" onClick="javascript:window.location='/board/boardetc'"/>
		</div>
		<!-- end panel-body -->
	</div>
	<!-- end panel-body -->
</div>

<%@ include file="../include/footer.jsp"%>
