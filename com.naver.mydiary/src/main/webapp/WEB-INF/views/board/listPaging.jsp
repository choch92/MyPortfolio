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
<br/><br/>
<div class="row">
	<div class="container" style="border:2px solid #FADCA5;">
	<br/>
		<h4 class="mb-5" style="background:#FAFAD2; border-radius:10px; padding:3px">
		<c:if test="${msg == null}">
			<em>게시판 페이징 목록</em>
		</c:if>
		<c:if test="${msg != null}">
			<em>게시판 페이징 목록</em><br/><br/>
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
		</div><br/>
		
		<div style="text-align:center">
			<ul class="pagination">
				<li class="page-item" >
					<c:if test="${pageMaker.prev}">
						<li>
						<a class="page-link" href="/board/listPaging?page=${pageMaker.startPage-1}">이전</a></li>
					</c:if>
				</li>
				<li class="page-item active">
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						<li <c:out value="${pageMaker.criteria.page == idx ? 'class=active' : ''}"/>>
							<a class="page-link" href="/board/listPaging?page=${idx}">${idx}</a>
						</li>
					</c:forEach>
				</li>
				<li class="page-item">
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a class="page-link" href="/board/listPaging?page=${pageMaker.endPage + 1}">다음</a></li>
					</c:if>
				</li>
			</ul>
		</div>
		
		<br/>
		<div class="panel">
			<input type="button" value="뒤로가기" class="btn btn-success" onClick="javascript:window.location='/board/boardetc'"/>
		</div><br/>
		<!-- end panel-body -->
	</div>
	<!-- end panel-body -->
</div>

<%@ include file="../include/footer.jsp"%>
