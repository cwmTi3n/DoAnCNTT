<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class=container--admin>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">
	<button>
		<a href="<c:url value='/admin/them-loaiphong'/>">Thêm loại phòng</a>
	</button>
	<h2>Danh sách loại phòng:</h2>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">STT</th>
				<th scope="col">Id</th>
				<th scope="col">Tên loại phòng</th>
				<th scope="col">Số phòng</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${loaiphongs}" var="lp" varStatus="STT">
				<tr>
					<th scope="row">${STT.index+1}</th>
					<td>${lp.id_lp}</td>
					<td><a
						href="<c:url value='/admin/loaiphong?id_lp=${lp.id_lp }'/>">${lp.tenloai}</a></td>
					<td>${lp.phongs.size() }</td>
					<td><a
						href="<c:url value='/admin/xoa-loaiphong?id_lp=${lp.id_lp }'/>">Xóa</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>