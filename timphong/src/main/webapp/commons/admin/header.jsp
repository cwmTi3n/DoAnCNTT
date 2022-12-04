<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="sticky-wrapper" class="sticky-wrapper sticky-wrapper--admin">
	<header
		class="site-navbar site-navbar--admin js-sticky-header site-navbar-target"
		role="banner">
		<div
			class="site-blocks-cover site-blocks-cover--admin inner-page-cover overlay"
			data-aos="fade">
			<div class="container">
				<div class="row align-items-center row-admin">

					<div class="col-12 col-xl-12">
						<h1 class="mb-0 site-logo site-logo--admin m-0 p-4">
							<a href="<c:url value='/trangchu'/>" class="mb-0">Tìm Phòng</a>
						</h1>
					</div>

					<div class="col-12 col-md-12 d-xl-block">
						<nav class="site-navigation position-relative text-left"
							role="navigation">
							<ul
								class="site-menu site-menu--admin main-menu js-clone-nav mr-auto d-none d-lg-block">
								<li><a href="<c:url value='/admin/statistics'/>" class="nav-link">Tổng
										quan</a></li>
								<li><a href="<c:url value='/admin/list-phong'/>"
									class="nav-link">Quản lý Phòng</a></li>
								<li><a href="<c:url value='/admin/list-loaiphong'/>"
									class="nav-link">Quản lý Loại phòng</a></li>
								<li><a href="<c:url value='/admin/list-taikhoan'/>"
									class="nav-link">Quản lý Tài khoản</a></li>
								<li><a href="/timphong/admin/ql-dathen" class="nav-link">Quản lý Đặt hẹn</a></li>
								<li><a href="<c:url value='/trangchu'/>" class="nav-link">Trang chủ</a></li>
								<li><a href="<c:url value='/logout'/>" class="nav-link">Đăng xuất</a></li>
							</ul>
						</nav>
					</div>

					<div class="col-6 d-none d-xl-none ml-md-0 py-3">
						<a href="#"
							class="site-menu-toggle js-menu-toggle text-white float-right"><span
							class="icon-menu h3"></span></a>
					</div>

				</div>
			</div>
		</div>
	</header>
</div>