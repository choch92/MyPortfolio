<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="container">
    <form accept-charset="UTF-8" method="post" role="form" action="delete" id="delete" ><br/><br/>
        <h2 class="form-heading">Password Check(Member Delete)</h2><br/>
        <div style="color:red">${msg}</div><br/>

        <div class="form-group">       
            <input name="pw" type="password" id="pw" class="form-control" placeholder="Password"/><br/>
            
            <div class="alert alert-danger alert-dismissable fade show">
            	<button type="button" class="close" data-dismiss="alert">&times;</button>
            	<strong>Danger!&nbsp;&nbsp;</strong>Click this button to permanently delete a member.
            </div>
            
            <input class="btn btn-lg btn-danger btn-block" type="submit" value="Member Delete"/><br/>
            <h4 class="text-center"><a href="../">Home</a></h4>
        </div>
    </form>
</div>

<script>
	document.getElementById("delete").addEventListener("submit", function(e){
		alert("회원 탈퇴 되었습니다.")
	});
</script>
<%@ include file="../include/footer.jsp"%>