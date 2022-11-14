<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="dec"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>
<!DOCTYPE html>
<html>
<head>
<title>Tìm phòng</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="Free-Template.co" />

<link rel="shortcut icon" href="ftco-32x32.png">

<link type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,900|Oswald:300,400,700"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${url }fonts/icomoon/style.css">

<link rel="stylesheet" type="text/css"
	href="${url }css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${url }css/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="${url }css/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
	href="${url }css/owl.theme.default.min.css">
<link rel="stylesheet" type="text/css"
	href="${url }css/owl.theme.default.min.css">

<link rel="stylesheet" type="text/css"
	href="${url }css/jquery.fancybox.min.css">

<link rel="stylesheet" type="text/css"
	href="${url }css/bootstrap-datepicker.css">

<link rel="stylesheet" type="text/css"
	href="${url }fonts/flaticon/font/flaticon.css">

<link rel="stylesheet" type="text/css" href="${url }css/aos.css">

<link rel="stylesheet" type="text/css" href="${url }css/style.css">

</head>
<body data-spy="scroll" data-target=".site-navbar-target"
	data-offset="300">

	<div class="site-wrap">
		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>

		<%@ include file="/commons/admin/header.jsp"%>

		<div class="site-blocks-cover inner-page-cover overlay"
			style="background-image: url(${url}images/hero_1.jpg);"
			data-aos="fade">
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-md-5 mx-auto mt-lg-5 text-center">
						<h1>Quản lý web</h1>
					</div>
				</div>
			</div>

			<a href="#property-details" class="smoothscroll arrow-down"><span
				class="icon-arrow_downward"></span></a>
		</div>

		<dec:body />


	</div>

	<!-- .site-wrap -->

	<script src="${url }js/jquery-3.3.1.min.js"></script>
	<script src="${url }js/jquery-ui.js"></script>
	<script src="${url }js/popper.min.js"></script>
	<script src="${url }js/bootstrap.min.js"></script>
	<script src="${url }js/owl.carousel.min.js"></script>
	<script src="${url }js/jquery.countdown.min.js"></script>
	<script src="${url }js/bootstrap-datepicker.min.js"></script>
	<script src="${url }js/jquery.easing.1.3.js"></script>
	<script src="${url }js/aos.js"></script>
	<script src="${url }js/jquery.fancybox.min.js"></script>
	<script src="${url }js/jquery.sticky.js"></script>
	<script src="${url }js/main.js"></script>

	<a href="#top" class="gototop"><span class="icon-angle-double-up"></span></a>
</body>
</html>