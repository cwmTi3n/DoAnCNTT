<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>
<div class="site-section-phong">
	<form action="verifycode" method="post" class="mx-5">
		<h2 class="text-dark">Mã code của bạn đã được gửi đến Email: ${taikhoan.getEmail()}</h2>
		<h3>Nhập mã code của bạn tại đây</h3>
		<input name="currentCode">
		<button type="submit">Send</button>
		<c:if test="${not empty verifysuccess}">
			<p class="text-danger my-0">${verifysuccess}</p>
			<p>Để tiếp tục truy cập Web, bạn vui lòng Đăng nhập tại đây 
			<a href="/timphong/login" class="btn btn-info">Đây nè ^.^ </a>
			</p>
		</c:if>
		<c:if test="${not empty notverifysuccess}">
			<p class="text-danger my-0">${notverifysuccess}</p>
		</c:if>
	</form>
</div>