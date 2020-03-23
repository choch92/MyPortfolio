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
		<h2 class="mb-3" text-align="left"><em>Board Service</em></h2>
		<p><font size="5"><em>This feature has update, delete, paging service.</em></font></p>
	</div>
	<div class="row">
		<div class="col-lg-3 col-md-6 mb-lg-0"><br/>
			<span class="service-icon rounded-circle mx-auto mb-3">
			<i class="icon-pencil"></i>
			</span>
			<h4>
			<c:if test="${user==null}">
				<a href="/user/login"><strong>로그인 하신후 글작성</strong></a>
			</c:if>
			<c:if test="${user!=null}">
				<a href="/board/write"><strong>Board Write</strong></a>
			</c:if>
			</h4>
			<p class="text-faded mb-0"></p>
		</div><br/>
		<div class="col-lg-3 col-md-6"><br/>
			<span class="service-icon rounded-circle mx-auto mb-3"> 
			<i class="icon-list"></i>
			</span>
			<h4>
				<a href="/board/list"><strong>Board List</strong></a><br/>
				
			</h4>
			<p class="text-faded mb-0"></p>
		</div>
		<div class="col-lg-3 col-md-6"><br/>
			<span class="service-icon rounded-circle mx-auto mb-3"> 
			<i class="icon-grid"></i>
			</span>
			<h4>
				<a href="/board/listPaging"><strong>Board Paging List</strong></a><br/>
				
			</h4>
			<p class="text-faded mb-0"></p>
		</div>
	</div>
	<br/><a href="../" class="btn btn-success btn-lg">Home</a>
</div>
</section>
<%@ include file="../include/footer.jsp"%>