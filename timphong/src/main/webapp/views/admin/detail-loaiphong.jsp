<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
				<h2 class="site-name py-4">Phòng đang đăng:
					${lp.phongs.size() }</h2>
				<table class="table table-hover">
					<thead class="thead-dark table-header-admin rounded">
						<tr>
							<th scope="col">STT</th>
							<th scope="col">Hình ảnh</th>
							<th scope="col">Trạng thái</th>
							<th scope="col">Giá</th>
							<th scope="col">Diện tích</th>
							<th scope="col">Chức năng</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lp.phongs}" var="phong" varStatus="STT">
							<tr>
								<th scope="row">${STT.index+1}</th>
								<td><a
									href="<c:url value="/admin/phong?id_p=${phong.id_p }"/>"> <c:url
											value="/hinhanh?fname=${phong.anhchinh}" var="hinhanh" /> <img
										height="120" width="160" src="${hinhanh}" />
								</a>
								</td>
								<td>${phong.trangthai==1 ? "Hiện":"Ẩn"}</td>
								<td>${phong.gia}</td>
								<td>${phong.chieudai}*${phong.chieurong}</td>
								<td><a
									href="<c:url value="/admin/xoa-phong?id_p=${phong.id_p }&id_loaip=${lp.id_lp }"/>">Xóa</a></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>