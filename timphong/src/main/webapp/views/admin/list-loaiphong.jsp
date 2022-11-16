<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="list-phong" class="container container--admin">
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">
	<div class="row">
		<div class="col-12 col-xl-12">
			<h2 class="site-name py-4">Quản lý Loại phòng</h2>
			<a class="d-inline-flex mb-3" href="<c:url value='/admin/them-loaiphong'/>">
				<button class="new-object-button btn">Thêm loại phòng</button>
			</a>
		</div>

		<div class="col-12 col-xl-12">
			<table class="table">
				<thead class="thead-light table-header-admin">
					<tr class="">
						<th class="" scope="col">STT</th>
						<th class="" scope="col">Tên loại phòng</th>
						<th class="" scope="col">Số phòng</th>
						<th class="" scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${loaiphongs}" var="lp" varStatus="STT">
						<tr>
							<td scope="row">${STT.index+1}</td>
							<td><a
								href="<c:url value='/admin/loaiphong?id_lp=${lp.id_lp }'/>">${lp.tenloai}</a></td>
							<td>${lp.phongs.size() }</td>
							<td><i class="bi bi-0-circle"></i> <a
								href="<c:url value='/admin/xoa-loaiphong?id_lp=${lp.id_lp }'/>">Xóa</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</div>