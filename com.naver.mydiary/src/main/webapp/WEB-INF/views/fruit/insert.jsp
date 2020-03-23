<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp"%>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<div style="margin:8px; padding: 30px; border:2px solid #FFB4B4;">
<h4 class="mb-5" style="background:#FAFAD2; border-radius:10px; padding:3px"><em>상품 등록</em></h4>
<form id="form1" name="form1" enctype="multipart/form-data" method="post">
	<table class="table table-bordered table-hover" style="width:100%%; height:100px; text-align:center">
		<tr bgcolor="papayawhip" align="left" >
			<td>상품명</td>
			<td><input type="text" name="fruitname" id="fruitname">
				<div id="fruitnamedisp"></div>
			</td>		
		</tr>
		<tr bgcolor="papayawhip" align="left" >
			<td>가격</td>
			<td><input type="text" name="price" id="price"/>
				<div id="pricedisp"></div>
			</td>
		</tr>
		<tr bgcolor="papayawhip" align="left" >
			<td>상품설명</td>
			<td><textarea rows="5" cols="60" name="description" id="description"></textarea>
			<div id="descriptiondisp"></div>
		</tr>
		<tr bgcolor="papayawhip" align="left" >
			<td>상품이미지</td>
			<td><input type="file" name="pictureurl" id="pictureurl">
				<div id="pictureurldisp"></div>
			</td>
		</tr>
		<tr bgcolor="papayawhip" align="left" >
			<td colspan="2" align="center">
				<input class="btn btn-success" type="button" value="등록" id="addBtn">
				<input class="btn btn-primary" type="button" value="목록" id="listBtn">
			</td>
		</tr>
	</table>
</form>
</div>
<%@ include file="../include/footer.jsp"%>

<script>
	$(document).ready(function(){
		// 상품 등록 유효성 검사
		$("#addBtn").click(function(){
			var fruitname = $("#fruitname").val();
			var price = $("price").val();
			var description = $("description").val();
			var pictureurl = $("pictureurl").val();
			
			var fruitnamedisp = document.getElementById("fruitnamedisp");
			var pricedisp = document.getElementById("pricedisp");
			var descriptiondisp = document.getElementById("descriptiondisp");
			var pictureurldisp = document.getElementById("pictureurldisp");
			
			if(fruitname == ""){
				fruitnamedisp.innerHTML = "&nbsp상품명을 입력해주세요";
				fruitnamedisp.style.color = "RED";
				fruitname.focus();
			}else if(price == ""){
				pricedisp.innerHtml = "&nbsp가격을 입력해주세요";
				pricedisp.style.color = "RED";
			}else if(description == ""){
				descriptiondisp.innerHtml = "&nbsp상품 설명을 입력해주세요";
			}else if(pictureurl == ""){
				pictureurldisp.innerHtml = "&nbsp;상품 사진을 입력해주세요";
				pictureurldisp.style.color="RED";
			}
			
			// 상품 정보 전송
			document.form1.action = "${path}/fruit/insert";
			document.form1.submit();
		});
	});
	
	// 상품 목록 이동
	$("#listBtn").click(function(){
		location.href="${path}/fruit/item";
	});
</script>
