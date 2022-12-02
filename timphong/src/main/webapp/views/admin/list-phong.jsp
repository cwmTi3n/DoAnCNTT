<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container--admin container--admin--full">
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">
	<div class="row">
		<div class="col-12 col-xl-12">
			<h2 class="site-name py-4">Quản lý phòng</h2>
			<a class="d-inline-flex mb-3 new-object-button"
				href="<c:url value='/admin/them-loaiphong'/>"> <i
				class="bi bi-plus-lg"></i> Thêm phòng
			</a>
		</div>
		<div class="col-12 col-xl-12 table-admin">
			<div class="table-admin-layer">
				<h3 class="font-weight-bold py-2">Danh sách phòng</h3>
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr style="vertical-align: middle;">

							<th class="col-2" scope="col">Hình ảnh</th>
							<th class="col-2" scope="col">Tên phòng</th>
							<th class="col-1" scope="col">Giá</th>
							<th class="col-1" scope="col">Diện tích</th>
							<th class="col-3" scope="col">Địa chỉ</th>
							<th class="col-2" scope="col">Chủ phòng</th>
							
							<th class="" scope="col"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${phongs}" var="phong">
							<tr>
								<td class="col-2"><c:url
										value="/hinhanh?fname=${phong.anhchinh}" var="hinhanh" /> <img
									class="img-thumbnail img--phong__small" src="${hinhanh}" /></td>
								<td class="col-2">${phong.ten }</td>
								<td class="col-1">${phong.gia}</td>
								<td class="col-1">${phong.chieudai}*${phong.chieurong}</td>
								<td class="col-2">${phong.getXa().getTenxa()},
									${phong.getXa().getHuyen().getTenhuyen()},
									${phong.getXa().getHuyen().getTinh().getTentinh() }</td>
								<td class="col-2"><a class="main-name-object"
									href="<c:url value="/admin/taikhoan?id_tk=${phong.getTaikhoan().getId_tk() }"/>">${phong.getTaikhoan().getTentk()}</a></td>
								<td class="col-1"><a class="d-inline-block mb-3 mr-3"
									href="<c:url value="/admin/phong?id_p=${phong.id_p }&id_taikhoan=${user.id_tk }"/>"><button
											class="btn btn-success btn-sm rounded-0" type="button"
											data-toggle="tooltip" data-placement="top" title="Edit">
											<i class="bi bi-pencil-square"></i>
										</button></a><a
									href="<c:url value="/admin/xoa-phong?id_p=${phong.id_p }"/>"><button
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
</div>