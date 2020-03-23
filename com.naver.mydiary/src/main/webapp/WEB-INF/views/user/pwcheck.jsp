<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="container">
    <form accept-charset="UTF-8" method="post" role="form" action="pwcheck" ><br/><br/>
        <h2 class="form-heading">Password Check</h2><br/>
        <div style="color:red">${msg}</div><br/>

        <div class="form-group">       
            <input name="pw" type="password" id="pw" class="form-control" placeholder="Password"/><br/>
            <input class="btn btn-lg btn-warning btn-block" type="submit" value="Password Check"/><br/>
            <h4 class="text-center"><a href="../">Home</a></h4>
        </div>
    </form>
</div>

<%@ include file="../include/footer.jsp"%>