<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<div id="list-phong" class="container--admin container--admin--full">
	<div class="row">
		<div class="col-12 col-xl-12">
			<h2 class="site-name py-4">Quản lý Loại phòng</h2>
			<a class="d-inline-flex mb-3 new-object-button"
				href="<c:url value='/admin/them-loaiphong'/>"> <i
				class="bi bi-plus-lg"></i> Thêm loại phòng
			</a>
		</div>

		<div class="col-12 col-xl-12 table-admin">
			<div class="table-admin-layer">
			<table class="table table-hover">
				<thead class="thead-light table-header-admin rounded">
					<tr class="">
						<th class="" scope="col">STT</th>
						<th class="" scope="col">Tên loại phòng</th>
						<th class="" scope="col">Số phòng</th>
						<th class="" scope="col">Chức năng</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${loaiphongs}" var="lp" varStatus="STT">
						<tr class="text-center">
							<td scope="row">${STT.index+1}</td>
							<td class="main-name-object">${lp.tenloai}</td>
							<td>${lp.phongs.size() }</td>
							<td><a class="btn btn-success mr-4"
								href="<c:url value='/admin/loaiphong?id_lp=${lp.id_lp }'/>"><button
											class="btn btn-success btn-sm rounded-0" type="button"
											data-toggle="tooltip" data-placement="top" title="Edit">
											<i class="bi bi-pencil-square"></i>
										</button></a> <a class="btn btn-danger"
								href="<c:url value='/admin/xoa-loaiphong?id_lp=${lp.id_lp }'/>"><button
											class="btn btn-danger btn-sm rounded-0" type="button"
											data-toggle="tooltip" data-placement="top" title="Delete">
											<i class="bi bi-trash"></i>
										</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</div>