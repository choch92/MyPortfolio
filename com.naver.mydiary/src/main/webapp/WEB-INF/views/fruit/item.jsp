<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp"%>

<style>
p {margin: 8px 0px 8px 0px;}
a {text-decoration:none; display:inline-block;}
</style>

<div class="box" style="margin:8px; padding: 30px; border:2px solid #FFB4B4;">

	<div class="box-header with-border">
		<h4 class="mb-5" style="background:#FAFAD2; border-radius:10px; padding:3px"><em>상품 목록</em></h4>
		<!-- 로그인 하였을 경우에만 상품 등록을 할 수 있게 button을 보이게하거나 안보이게하는 것 -->
		<c:if test="${user!=null}">
			<button class="btn btn-success" type="button" id="btnAdd">상품등록</button>
		</c:if>
		<button id='mainBtn' class="btn btn-primary">메인으로</button>
	</div>
	
	<div class="box-body">
	<br/>
		<!-- 상품 목록 전체를 출력하기 위한 table 생성 -->
		<table class="table table-bordered table-hover" style="width:100%; height:100px; text-align:center">

			<!-- table 헤더 설정 -->
			<tr style="background:#FAFAD2" align="center" >
				<th width="15%">&nbsp;상품 ID</th>
				<th width="30%">&nbsp;상품 이미지</th>
				<th width="20%">&nbsp;상품 이름</th>
				<th width="15%">&nbsp;상품 가격</th>
			</tr>
			
			<!-- FruitController에서 list에 넣어진 값을 fruit에 넣고 var는 화면에 출력하기 위해 사용할 변수 설정 -->
			<c:forEach var="fruit" items="${list}">
				<tr>
					<!-- 상품 아이디 출력 -->	
					<td>${fruit.fruitid}</td>

					<!-- 상품 사진 출력(상품 상세보기로 들어갈수 있게 사진에 경로 설정) -->
					<td>
						<a href="detail/${fruit.fruitid}">
							<img src="/img/${fruit.pictureurl}" width="120px" height="80px">
						</a>
					</td>

					<!-- 상품 이름 출력(위와 마찬가지로 상품 상세보기로 갈수 있게 경로 설정) -->
					<td><a href="detail/${fruit.fruitid}">${fruit.fruitname}</a><br/>
						<c:if test="${user!=null}">
							<a href="${path}/fruit/update/${fruit.fruitid}">[상품수정]</a><br/>
						</c:if>
						<!-- 상품 삭제 기능을 사용자가 로그인 했을 때만 보이게 끔 설정 -->
						<c:if test="${user!=null}">
							<a href="${path}/fruit/delete/${fruit.fruitid}">[상품삭제]</a>
						</c:if>
					</td>

					<!-- 상품 가격 출력 -->
					<td>${fruit.price}원</td>					
				</tr>				
			</c:forEach>		
		</table>
	</div>
</div>

<script>
	document.getElementById('mainBtn').addEventListener("click", function(event) {
		location.href = "../";
	});
</script>

<script>
	$(document).ready(function(){
		$("#btnAdd").click(function(){
			location.href="${path}/fruit/insert";
		});
	});
</script>
<!-- footer.jsp 포함 -->
<%@ include file="../include/footer.jsp"%>
