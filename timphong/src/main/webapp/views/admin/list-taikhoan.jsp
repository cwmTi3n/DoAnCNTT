<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<button><a href="<c:url value="/admin/themtk"/>">Thêm Tài Khoản</a></button>
<h2>Danh sách Seller: ${sellers.size() }</h2>
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th scope="col">STT</th>
			<th scope="col">Tài khoản</th>
			<th scope="col">Họ và tên</th>
			<th scope="col">SDT</th>
			<th scope="col">Email</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${sellers}" var="seller" varStatus="STT">
				<tr>
					<th scope="row">${STT.index+1}</th>
					<td><a href="<c:url value="/admin/taikhoan?id_tk=${seller.id_tk }"/>">${seller.tentk}</a></td>
					<td>${seller.ho} ${seller.ten}</td>
					<td>${seller.sdt}</td>
					<td>${seller.email}</td>
					<td><a href="<c:url value="/admin/xoa-taikhoan?id_tk=${seller.id_tk }"/>">Xóa</a></td>
				</tr>
		</c:forEach>
	</tbody>
</table>
<h2>Danh sách User: ${users.size() }</h2>
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th scope="col">STT</th>
			<th scope="col">Tài khoản</th>
			<th scope="col">Họ và tên</th>
			<th scope="col">SDT</th>
			<th scope="col">Email</th>
			<th scope="col"></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${users}" var="user" varStatus="STT">
				<tr>
					<th scope="row">${STT.index+1}</th>
					<td><a href="<c:url value="/admin/taikhoan?id_tk=${user.id_tk }"/>">${user.tentk}</a></td>
					<td>${user.ho} ${user.ten}</td>
					<td>${user.sdt}</td>
					<td>${user.email}</td>
					<td><a href="<c:url value="/admin/xoa-taikhoan?id_tk=${user.id_tk }"/>">Xóa</a></td>
				</tr>
		</c:forEach>
	</tbody>
</table>
