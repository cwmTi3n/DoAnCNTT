<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="sticky-wrapper" class="sticky-wrapper">
	<header class="site-navbar py-4 js-sticky-header site-navbar-target"
		role="banner">

		<div class="container">
			<div class="row align-items-center">

				<div class="col-6 col-xl-2">
					<h1 class="mb-0 site-logo p-0">
						<a href="<c:url value='/trangchu'/>" class="mb-0">Tìm phòng</a>
					</h1>
				</div>

				<div class="col-12 col-md-10 d-none d-xl-block">
					<nav class="site-navigation position-relative text-right"
						role="navigation">

						<ul
							class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
							<c:if test="${sessionScope.account.quyen == 1}">
								<li><a href="<c:url value='/admin/statistics'/>" class="nav-link">Quản lý web</a></li>
							</c:if>
							<li><a href="<c:url value='/trangchu'/>" class="nav-link">Trang
									chủ</a></li>
							<li><a href="/timphong/listings" class="nav-link">Tìm
									kiếm</a></li>
							<li><a href="#footer" class="nav-link">Liên hệ</a></li>
							<c:if test="${sessionScope.account == null}">
								<li>
									<a href="<c:url value='/login'/>" class="nav-link">Đăng nhập</a>
								</li>
							</c:if>
							<c:if test="${sessionScope.account != null}">
								<li><a href="/timphong/trangcuatui" class="nav-link">${sessionScope.account.quyen==3?"Seller:":""} ${sessionScope.account.tentk }</a></li>
								<li>
									<a href="<c:url value='/profile'/>" class="nav-link"></a>
										<a href="<c:url value='/logout'/>" class="nav-link">Đăng
										xuất</a>
								</li>
							</c:if>
						</ul>
					</nav>
				</div>


				<div class="col-6 d-inline-block d-xl-none ml-md-0 py-3">
					<a href="#"
						class="site-menu-toggle js-menu-toggle text-white float-right"><span
						class="icon-menu h3"></span></a>
				</div>

			</div>
		</div>
	</header>
</div>