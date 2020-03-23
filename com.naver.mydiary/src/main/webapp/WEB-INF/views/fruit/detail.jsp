<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<section class="content">
	<div align="left" class="body" style="margin:8px; padding: 30px; border:2px solid #FFB4B4;">
		<h4 class="mb-5" style="background:#FAFAD2; border-radius:10px; padding:3px"><em>상품 상세보기</em></h4>
		<table border="1">
			<tr>
				<!-- 상품 사진 출력 영역 -->
				<td>
					<img style="border: 3px solid gold; border-radius: 7px; margin:10px;" src="/img/${fruit.pictureurl}" 
                    width="300px" height="300px"/>
				</td>
				
				<td align="center">
					<table border="1" style="height:300px; width:400px;">
						<tr align="center">
							<td width="80">&nbsp;&nbsp;상품명</td>
							<td width="160">${fruit.fruitname}</td>
						</tr>
						<tr align="center">
							<td width="80">&nbsp;&nbsp;가격</td>
							<td width="160"><fmt:formatNumber value="${fruit.price}" pattern="###,###,###"/></td>
						</tr>
						<tr align="center">
							<td width="80">&nbsp;&nbsp;상품내용</td>
							<td width="160">${fruit.description}</td>
						</tr>
						<tr align="center">
							<td colspan="2" align="center" width="240">
								<!-- 해당 제품 장바구니 담기 -->
								<!-- 상품을 장바구니에 추가시키기 위하여 상품id번호, 수량을 form 태그로 전송 -->
								<form name="form1" method="post" action="${path}/fruit/insertCart">
									<!-- 현재의 상품 ID를 입력받기 위해 hidden 속성으로 처리 -->
									<input type="hidden" name="fruitid" value="${fruit.fruitid}">
									<select name="amount">
										<!-- option 달기 1부터 10 -->
										<c:forEach begin="1" end="10" var="i">
											<option value="${i}" > ${i}</option>
										</c:forEach>
									</select>&nbsp;개
									<!-- submit타입으로 form형식이 제출될 때 basketlist페이지로 이동하면서 상품이 추가됨 -->
									<input type="submit" value="장바구니에 담기">
								</form>
							</td>
						</tr>
						<tr align="center">
							<td colspan="2" align="center" width="240"><a href="/fruit/item">■목록으로 돌아가기</a></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
</section><br/>
<!-- footer.jsp 포함 -->
<%@ include file="../include/footer.jsp"%>

