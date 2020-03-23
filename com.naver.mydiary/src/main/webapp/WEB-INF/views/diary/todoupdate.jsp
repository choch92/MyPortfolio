<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="row">
   <div class="container">
      <br />
      <h3 class="mb-5">
         <em>일정 수정</em>
      </h3>
      <!-- /.panel-heading -->
      <div class="panel-body">
         <form id="todoUpdateForm" accept-charset="UTF-8" method="post" role="form" action="/diary/todoupdate/${vo.num}" >
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
                        <input type="radio" name="category" id="category" value="date" size="35"/>&nbsp;데이트&nbsp;
                        <input type="radio" name="category" id="category" value="anniversary" size="35"/>&nbsp;기념일&nbsp;
                        <input type="radio" name="category" id="category" value="friend" size="35"/>&nbsp;친구&nbsp;
                        <input type="radio" name="category" id="category" value="company" size="35"/>&nbsp;직장&nbsp;
                        <input type="radio" name="category" id="category" value="hobby" size="35"/>&nbsp;취미&nbsp;
                        <input type="radio" name="category" id="category" value="etc" size="35"/>&nbsp;기타&nbsp;
                     </div>
                     <div id="categorydisp"></div>
                  </td>
               </tr>         
               <tr>
                  <td><i class="fas fa-clock"></i>&nbsp;<label>시작일</label><br /> 
                  <input id="startDate" name="startDate" type="datetime-local" 
                           value="${vo.startDate}"   max="9999-12-31"/>&nbsp; 
                  <div id="startDatedisp"></div>
                  <br /></td>
               </tr>
               <tr>
                  <td><i class="fas fa-clock"></i>&nbsp;<label>종료일</label><br />
                  <input id="endDate" name="endDate" type="datetime-local" 
                           value="${vo.endDate}" max="9999-12-31"/>&nbsp;
                  <div id="endDatedisp"></div>
                  <br /></td>
               </tr>
               <tr>
                  <td>
                     <div class="form-group">
                        <i class="fas fa-coffee"></i>&nbsp;<label>약속 장소</label>
                        <input class="form-control" id="loc" name='loc' value="${vo.loc}" />
                     </div>
                     <div id="locdisp"></div>
                  </td>
               </tr>
               <tr>
                  <td>
                     <div class="form-group">
                        &nbsp;<i class="fas fa-file"></i>&nbsp;<label>약속 내용</label>
                        <textarea class="form-control" id="detail" rows="3" name='detail' ><c:out value="${vo.detail}"/></textarea>
                     </div>
                     <div id="detaildisp"></div>
                  </td>
               </tr>
               <tr>
                  <td>&nbsp;
                     <button type="submit" id="submitbtn" class="btn btn-primary">수정완료</button>
                     &nbsp;
                     <button type="reset" class="btn btn-default">다시작성</button> 
                     &nbsp;
                     <input type="button" value="메인으로" class="btn btn-success"
                     onclick="javascript:window.location='/'">
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
//카테고리 유효성검사
var categoryFlag=false;
var categorydisp=document.getElementById("categorydisp");

function categoryCheck(){
   var v=$('input[name=category]:checked').val();
   
   if(v==null){
      categorydisp.innerHTML="카테고리를 선택해주세요";
      categorydisp.style.color="RED";
      categoryFlag=false;
      return;
   }
   else if(v!=null){
      categorydisp.innerHTML="";
      categoryFlag=true;
   }
}
</script>

<script>
//시작일 유효성 검사
var startDateFlag=false;
var startDatedisp=document.getElementById("startDatedisp");

function startDateCheck(){
   var startDate=document.getElementById("startDate").value;
   
   if(startDate==""){
      startDatedisp.innerHTML="시작일을 입력해주세요";
      startDatedisp.style.color="RED";
      startDateFlag=false;
      return;
   }else{
      startDatedisp.innerHTML="";
      startDateFlag=true;
   }
}
</script>

<script>
//종료일 유효성 검사
var endDateFlag=false;
var endDatedisp=document.getElementById("endDatedisp");

function endDateCheck(){
   var endDate=document.getElementById("endDate").value;
   
   if(endDate==""){
      endDatedisp.innerHTML="시작일을 입력해주세요";
      endDatedisp.style.color="RED";
      endDateFlag=false;
      return;
   }else{
      endDatedisp.innerHTML="";
      endDateFlag=true;
   }
}
</script>

<script>
//약속장소 유효성
var locFlag=false;
var locdisp=document.getElementById("locdisp");

function locCheck(){
   var loc=document.getElementById("loc").value;
   
   if(loc==""){
      locdisp.innerHTML="장소를 입력해주세요";
      locdisp.style.color="RED";
      locFlag=false;
      return;
   }else{
      locdisp.innerHTML="";
      locFlag=true;
   }
}
</script>

<script>
//약속 내용 적었는지 확인하는 함수
var detailFlag=false;
var detaildisp=document.getElementById("detaildisp");

function detailCheck(){
   var detail=document.getElementById("detail").value;
   
   if(detail==""){
      detaildisp.innerHTML="내용을 입력해주세요";
      detaildisp.style.color="RED";
      detailFlag=false;
      return;
   }else{
      detaildisp.innerHTML="";
      detailFlag=true;
   }
}
</script>

<<script>
//전송 전 확인 및 전송 처리
document.getElementById("todoUpdateForm").addEventListener('submit',function(e){
   //카테고리 유효성 검사
   categoryCheck();
   if(categoryFlag==false){
      e.preventDefault();
   }
   
   startDateCheck();
   if(startDateFlag==false){
      e.preventDefault();
   }
   
   endDateCheck();
   if(endDateFlag==false){
      e.preventDefault();
   }
   
   //약속장소 유효성 검사
   locCheck();
   if(locFlag==false){
      e.preventDefault();
   }
   
   //약속내용 유효성 검사
   detailCheck();
   if(detailFlag==false){
      e.preventDefault();
      return;
   }
   
   document.getElementById("todoUpdateForm").submit();
});
</script>

<%@ include file="../include/footer.jsp"%>























