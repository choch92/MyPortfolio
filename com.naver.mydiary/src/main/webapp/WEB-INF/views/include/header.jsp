<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>My Portfolio</title>

<!-- jQuery -->
<script src="/resources/js/jquery.js"></script>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<link href="/resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/css/stylish-portfolio.min.css" rel="stylesheet">
<link href="/resources/css/stylish-portfolio.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Navigation -->
	<a class="menu-toggle rounded" href="#"> <i class="fas fa-bars"></i>
	</a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand">
				<a class="js-scroll-trigger" href="#page-top">My Project</a></li>
			<!-- 로그인 된 경우 -->
			<c:if test="${user!=null}">
				<li class="sidebar-nav-item"><a class="js-scroll-trigger" href="/user/logout">
				<img src="/userimage/${user.image}" width="30" height="30"/>${user.nickname}님 환영합니다.</a></li>
			</c:if>
			<!-- 로그인 안된 경우 -->
			<c:if test="${user==null}">
				<li class="sidebar-nav-item"><a class="js-scroll-trigger" href="/user/login">
				<img src="/userimage/default.png" width="30" height="30"/>&nbsp;로그인이 필요한 페이지</a></li>
			</c:if>
			
			<li class="sidebar-nav-item"><a class="js-scroll-trigger" href="/">Home</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger" href="#services">Services</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger" href="#portfolio">Portfolio</a></li>
			<li class="sidebar-nav-item"><a class="js-scroll-trigger" href="#contact">Contact</a></li>
		</ul>
	</nav>

	<!-- Header -->
	<header class="masthead d-flex">
		<div class="container text-center my-auto">
			<h1 class="mb-1">My Portfolio</h1>
			<h3 class="mb-5">
				<em>Introduce My Portfolio</em>
			</h3>
			<a class="btn btn-primary btn-xl js-scroll-trigger" href="#services">Find Out More</a>
		</div>
		<div class="overlay"></div>
	</header>