<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class=container--admin>
	<div>
		<h2>Thông tin loại phòng</h2>
		<form action="taikhoan" method="post">
			<label>Id: </label><input type="text" name="id_tk"
				value="${lp.id_lp }"><br /> <label>Tên loại phòng:
			</label><input type="text" name="tenloai" value="${lp.tenloai }"><br />
			<button type="submit">Chỉnh sửa</button>
		</form>
	</div>
	<div>
		<h2>Phòng đang đăng: ${lp.phongs.size() }</h2>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">STT</th>
					<th scope="col">Id</th>
					<th scope="col">Hình ảnh</th>
					<th scope="col">Trạng thái</th>
					<th scope="col">Giá</th>
					<th scope="col">Diện tích</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${lp.phongs}" var="phong" varStatus="STT">
					<tr>
						<th scope="row">${STT.index+1}</th>
						<td>${phong.id_p}</td>
						<td><a
							href="<c:url value="/admin/phong?id_p=${phong.id_p }"/>"> <c:url
									value="/hinhanh?fname=${phong.anhchinh}" var="hinhanh" /> <img
								height="120" width="160" src="${hinhanh}" />
						</a></td>
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