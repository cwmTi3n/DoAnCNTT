<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>

<div id="profile" class="site-section-phong bg-secondary">
	<div class="container">
		<div class="row profile-row">
			<div class="col-12">
				<div>
					<img class="profile-img" src="${url }iamges/logo.png">
					<h3 class="text-black">Welcom, ABC</h3>
				</div>

			</div>
			<div class="col-9 text-black">
				<div class="d-flex my-2">
					<div>
						<h5>Họ và tên</h5>
						<p>Lưu Ngạn Lâm</p>
					</div>
				</div>
				<div class="d-flex my-2">
					<div>
						<h5>Tên tài khoản</h5>
						<p>lnlam</p>
					</div>
				</div>
				<div class="d-flex my-2">
					<div>
						<h5>Email</h5>
						<p>01274757673lam@gmail.com</p>
					</div>
				</div>
				<div class="d-flex my-2">
					<div>
						<h5>Số điện thoại</h5>
						<p>0986712392</p>
					</div>
				</div>
				<div class="d-flex my-2">
					<div>
						<h5>Bạn đang là</h5>
						<p>User</p>
					</div>
				</div>
				<div class="d-flex my-2">
					<div>
						<h5>Mật khẩu</h5>
						<p>0986713292</p>
					</div>
				</div>
			</div>
			<div class="col-3">
				<button>Change password</button>
			</div>
		</div>
	</div>
</div>