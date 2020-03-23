<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	// 리스트 페이지로 이동
	$(document).ready(function(){
		$("#btnList").click(function(){
			location.href="${path}/fruit/item";
		});
	});
</script>

<section class="content">
	<div class="box" style="margin:8px; padding: 30px; border:2px solid #FFB4B4;">
		<h4 class="mb-5" style="background:#FAFAD2; border-radius:10px; padding:3px; width:50%"><em>장바구니 목록</em></h4>
		<c:choose>
			<c:when test="${map.count == 0}">
				장바구니가 비어있습니다.
			</c:when>
		
		<c:otherwise>
			<form name="form1" id="form1" method="post" action="${path}/fruit/updateCart">
				<table border="1" style="height:50%; width:50%;">
					<tr align="center" style="background:#FAFAD2; margin:3px">
						<th align="center">상품명</th>
						<th>단가</th>
						<th>수량</th>
						<th>금액</th>
						<th>취소</th>
					</tr>
					<c:forEach var="fruit" items="${map.list}" varStatus="i">
					<tr>
						<td align="center">
							${fruit.fruitname}
						</td>
						<td style="width: 60px" align="right">
							<fmt:formatNumber pattern="###,###,###" value="${fruit.price}"/>
						</td>
						<td align="center">
							<input type="number" style="width:40px" name="amount" value="${fruit.amount}"/>
							<input type="hidden" name="fruitid" value="${fruit.fruitid}"/>
						</td>
						<td style="width:100px" align="right">
							<fmt:formatNumber pattern="###,###,###" value="${fruit.money}"/>
						</td>
						<td align="center">
							<a href="${path}/fruit/deleteCart?cartid=${fruit.cartid}">삭제</a>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td colspan="5" align="right">
							장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney}"/>&nbsp;<br/>
							배송료 : ${map.fee}&nbsp;<br/>
							전체 주문금액 : <fmt:formatNumber pattern="###,###,###" value="${map.allSum}"/>&nbsp;
						</td>
					</tr>
				</table><br/>
				<input type="hidden" name="count" value="${map.count}">
			</form>
		</c:otherwise>
	</c:choose>
	<br/>&nbsp;<button class="btn btn-primary" type="button" id="btnList">상품 목록</button>
	</div>	
</section>

<!-- footer.jsp 포함 -->
<%@ include file="../include/footer.jsp"%>
