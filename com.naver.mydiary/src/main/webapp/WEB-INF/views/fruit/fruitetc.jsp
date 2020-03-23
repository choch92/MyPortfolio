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
		<h2 class="mb-3" text-align="left"><em>Shopping Service</em></h2>
		<p><font size="5"><em>This page has the ability to add, edit, delete and add to the list of fruits.</em></font></p>
	</div>
	<div class="row">
		<div class="col-lg-3 col-md-6 mb-5 mb-lg-0"><br/>
			<span class="service-icon rounded-circle mx-auto mb-3">
			<i class="icon-screen-smartphone"></i>
			</span>
			<h4>
			<c:if test="${user==null}">
				<a href="/user/login"><strong>Login</strong></a>
			</c:if>
			<c:if test="${user!=null}">
				<a href="/user/logout"><strong>Logout</strong></a>
			</c:if>
			</h4>
			<p class="text-faded mb-0"></p>
		</div><br/>
		<div class="col-lg-3 col-md-6"><br/>
			<span class="service-icon rounded-circle mx-auto mb-3"> 
			<i class="icon-book-open"></i>
			</span>
			<h4>
				<a href="/fruit/item"><strong>Fruit List</strong></a>
			</h4>
			<p class="text-faded mb-0"></p>
		</div>
		<div class="col-lg-3 col-md-6 mb-5 mb-lg-0"><br/>
			<span class="service-icon rounded-circle mx-auto mb-3"> 
			<i class="icon-basket"></i>
			</span>
			<h4>
				<a href="/fruit/basketlist"><strong>Shopping Cart</strong></a>
			</h4>
			<p class="text-faded mb-0"></p>
		</div>
		<div class="col-lg-3 col-md-6 mb-5 mb-md-0"><br/>
			<span class="service-icon rounded-circle mx-auto mb-3"> 
			<i class="icon-like"></i>
			</span>
			<h4>
				<a href="#"><strong>생각중....</strong></a>
			</h4>
			<p class="text-faded mb-0"></p>
		</div>
	</div>
	<br/><a href="../" class="btn btn-success btn-lg">Home</a>
</div>
</section>
<%@ include file="../include/footer.jsp"%>

