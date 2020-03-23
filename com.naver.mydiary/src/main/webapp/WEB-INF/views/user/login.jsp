<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
	.button{
		width:250px;
	}
</style>

<div class="container">
    <form accept-charset="UTF-8" method="post" role="form" action="login" ><br/><br/>
        <h2 class="form-heading"><em>Log in</em></h2>
        <div style="color:red">${msg}</div><br/>

        <div class="form-group">
            
            <input name="email" type="email" id="email" class="form-control" placeholder="Username" autofocus="true" /><br/>
            <input name="pw" type="password" id="pw" class="form-control" placeholder="Password"/><br/>

            <p align="center" >
            	<button type="submit" style="color: #0000000; background:#F7D358; font-size:2em; border-radius:0.5em; padding:1px 40px;">Log In</button>
            </p><br/>
            <h4 class="text-center"><a href="/user/join">Create an account</a></h4>
        </div>
    </form>
</div>

<%@ include file="../include/footer.jsp"%>