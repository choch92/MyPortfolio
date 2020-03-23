<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp"%>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<div style="margin:8px; padding: 30px; border:2px solid #FFB4B4;">
	<h4 class="mb-5" style="background:#FAFAD2; border-radius:10px; padding:3px"><em>상품 수정</em></h4>
		<form id="fruitupdate" name="fruitupdate" enctype="multipart/form-data" method="post">
			<table class="table table-bordered table-hover" style="width:70%; height:100px; text-align:center">
			
				<tr bgcolor="papayawhip" align="left" >
					<td>상품이미지</td>
					<td><img src="/img/${fruit.pictureurl}" height="120px" width="120px"><br/>
						<input type="file" name="pictureurl" id="pictureurl">
						<div id="pictureurldisp"></div>
					</td>		
				</tr>
				
				<tr bgcolor="papayawhip" align="left" >
					<td>상품명</td>
					<td><input type="text" id="fruitname" name="fruitname" value="${fruit.fruitname}"><br/>
						<div id="fruitnamedisp"></div>
					</td>
				</tr>
				
				<tr bgcolor="papayawhip" align="left" >
					<td>가격</td>
					<td><input type="number" name="price" id="price" value="${fruit.price}"/>
						<div id="pricedisp"></div>
					</td>
				</tr>
				<tr bgcolor="papayawhip" align="left" >
					<td>상품설명</td>
					<td><textarea rows="5" cols="60" name="description" id="description">${fruit.description}</textarea>
					<div id="descriptiondisp"></div>
				</tr>
		
				<tr bgcolor="papayawhip" align="left" >
					<td colspan="2" align="center">
						<input type="hidden" name=fruitid value="${fruit.fruitid}">
						<input class="btn btn-success" type="button" value="수정" id="editBtn">
						<input class="btn btn-primary" type="button" value="목록" id="listBtn">
					</td>
				</tr>
			</table>
		</form>
</div>
<%@ include file="../include/footer.jsp"%>

<script>
	$(document).ready(function(){
		// 상품수정 버튼 클릭 이벤트
		$("#editBtn").click(function(){
			var fruitname = $("#fruitname").val();
			var price = $("#price").val();
			var description = $("#description").val();
			
			var fruitnamedisp = document.getElementById("fruitnamedisp");
			var pricedisp = document.getElementById("pricedisp");
			var descriptiondisp = document.getElementById("descriptiondisp");

			if(fruitname == ""){
				fruitnamedisp.innerHTML = "&nbsp상품명을 입력해주세요";
				fruitnamedisp.style.color = "RED";
				fruitname.focus();
			}else if(price == ""){
				pricedisp.innerHtml = "&nbsp가격을 입력해주세요";
				pricedisp.style.color = "RED";
			}else if(description == ""){
				descriptiondisp.innerHtml = "&nbsp상품 설명을 입력해주세요";
				descriptiondisp.style.color="RED";
			}
			
			// 상품 정보 전송
			document.fruitupdate.action = "${path}/fruit/update";
			document.fruitupdate.submit();
		});
	});

	// 상품 목록 이동
	$("#listBtn").click(function(){
		location.href="${path}/fruit/item";
	});
</script>
