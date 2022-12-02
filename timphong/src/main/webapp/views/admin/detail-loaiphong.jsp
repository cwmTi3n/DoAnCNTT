<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<div class="container--admin container--admin--full">
	<div class="row">
		<div class="col-12">
			<h2 class="site-name py-4">Thông tin loại phòng</h2>
			<form class="d-flex align-items-center" action="list-loaiphong"
				method="post">
				<input hidden type="text" name="id_lp" value="${lp.id_lp }">
				<label class="col label--admin--big" for="tenloai">Tên loại
					phòng: </label>
				<div class="col-5">
					<input type="text" class="col-12 py-2 border-radius-12"
						name="tenloai" value="${lp.tenloai }">
				</div>
				<div class="col-2">
					<button class="col btn btn-info" type="submit">Chỉnh sửa</button>
				</div>
				<div class="col-2">
					<a href="<c:url value='/admin/list-loaiphong'/>"
						class="col text-white btn bg-danger">Quay lại</a>
				</div>
			</form>
		</div>
		<div class="col-12 table-admin mt-3">
			<div class="table-admin-layer">
				<h2 class="site-name py-4">Phòng đang đăng: ${lp.phongs.size() }</h2>
				<table class="table table-hover">
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
							<c:forEach items="${lp.phongs}" var="phong">
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
										href="<c:url value="/admin/xoa-phong?id_p=${phong.id_p }&id_taikhoan=${user.id_tk }"/>"><button
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