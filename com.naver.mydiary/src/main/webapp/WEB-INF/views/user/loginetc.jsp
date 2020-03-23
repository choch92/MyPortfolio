<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
	#pad{
		padding:10dx;
	}
</style>

<section class="content-section text-center" style="background:papayawhip">
<div class="container">
	<div class="content-section-heading"><span></span>
		<h2 class="mb-3" text-align="left"><em>Login Service</em></h2>
	</div>
	<div class="row">
		<div class="col-lg-3 col-md-6 mb-5 mb-lg-0"><br/>
			<span class="service-icon rounded-circle mx-auto mb-3">
			<i class="icon-screen-smartphone"></i>
			</span>
			<h4>
			<c:if test="${user==null}">
				<a href="/user/login"><strong>Member Login</strong></a>
			</c:if>
			<c:if test="${user!=null}">
				<a href="/user/logout"><strong>Member Logout</strong></a>
			</c:if>
			</h4>
			<p class="text-faded mb-0"></p>
		</div><br/>
		<div class="col-lg-3 col-md-6"><br/>
			<span class="service-icon rounded-circle mx-auto mb-3"> 
			<i class="icon-mustache"></i>
			</span>
			<h4>
				<a href="/user/join"><strong>Create an account</strong></a>
			</h4>
			<p class="text-faded mb-0"></p>
		</div>
		<div class="col-lg-3 col-md-6 mb-5 mb-lg-0"><br/>
			<span class="service-icon rounded-circle mx-auto mb-3"> 
			<i class="icon-pencil"></i>
			</span>
			<h4>
				<a href="/user/update"><strong>Member Update</strong></a>
			</h4>
			<p class="text-faded mb-0"></p>
		</div>
		<div class="col-lg-3 col-md-6 mb-5 mb-md-0"><br/>
			<span class="service-icon rounded-circle mx-auto mb-3"> 
			<i class="icon-like"></i>
			</span>
			<h4>
				<a href="/user/delete"><strong>Member Delete</strong></a>
			</h4>
			<p class="text-faded mb-0"></p>
		</div>
	</div>
	<br/><a href="../" class="btn btn-success btn-lg">Home</a>
</div>
</section>
<%@ include file="../include/footer.jsp"%>