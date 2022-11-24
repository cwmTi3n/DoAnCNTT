<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>   
    

<div id="profile" class="site-section-phong">
	<div class="container">
		<div class="row profile-row p-4 my-5">
			<div class="d-flex col-12" style="align-items: center;">
				<img class="profile-img img-thumbnail" src="${url }images/Logo.png">
				<h2 class="text-black mb-0 ml-3">Welcome, ${sessionScope.account.ho} ${sessionScope.account.ten}</h2>

			</div>
			<div class="col-8 text-black">
				<div class="row my-4">
					<ul>
						<li><a href="/timphong/listdathen">Đặt hẹn</a></li>
						<c:if test="${sessionScope.account.quyen == 3}">
							<li><a href="/timphong/seller/ql-phong">Quản lý phòng</a></li>
							<li><a href="/timphong/xacnhan-p">Xác nhận</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>