<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class=container--admin>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">

	<button>
		<a href="<c:url value="/admin/them-phong?id_tk=${user.id_tk}"/>">Thêm
			Phòng Cho Seller</a>
	</button>

	<div>
		<h2>Thông tin cá nhân</h2>
		<form action="taikhoan" method="post" enctype="multipart/form-data">
			<c:url value="/hinhanh?fname=${user.anhdaidien}&path=taikhoan" var="anh" />
			<label>Ảnh đại diện: </label><img height="180" width="240" src="${anh }"><input type="file" name="anhdaidien"><br />
			<label>Id: </label><input type="text" name="id_tk"
				value="${user.id_tk }"><br /> <label>Tên tài khoản:
			</label><input type="text" name="tentk" value="${user.tentk }"><br />
			<label>Mật khẩu: </label><input type="text" name="matkhau"
				value="${user.matkhau }"><br /> <label>Họ: </label><input
				type="text" name="ho" value="${user.ho }"><br /> <label>Tên:
			</label><input type="text" name="ten" value="${user.ten }"><br /> <label>Quyền:
			</label> <select name="quyen">
				<c:if test="${user.quyen == 2 }">
					<option value="2">User</option>
					<option value="3">Seller</option>
				</c:if>
				<c:if test="${user.quyen == 3 }">
					<option value="3">Seller</option>
					<option value="2">User</option>
				</c:if>
			</select><br /> <label>SDT: </label><input type="text" name="sdt"
				value="${user.sdt }"><br /> <label>Email: </label><input
				type="text" name="email" value="${user.email }"><br />
			<button type="submit">Chỉnh sửa</button>
		</form>
	</div>
	<c:if test="${user.quyen==3}">
		<div>
			<h2>Phòng đang đăng: ${tongPhong }</h2>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">STT</th>
						<th scope="col">Id</th>
						<th scope="col">Hình ảnh</th>
						<th scope="col">Tên phòng</th>
						<th scope="col">Trạng thái</th>
						<th scope="col">Giá</th>
						<th scope="col">Diện tích</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${phongcts}" var="phongct" varStatus="STT">
						<tr>
							<th scope="row">${STT.index+1}</th>
							<td>${phongct.id_p}</td>
							<td><a
								href="<c:url value="/admin/phong?id_p=${phongct.id_p }&id_taikhoan=${user.id_tk }"/>">
									<c:url value="/hinhanh?fname=${phongct.anhchinh}" var="hinhanh" />
									<img height="120" width="160" src="${hinhanh}" />
							</a></td>
							<td>${phongct.ten }</td>
							<td>${phongct.trangthai==1 ? "Hiện":"Ẩn"}</td>
							<td>${phongct.gia}</td>
							<td>${phongct.chieudai}*${phongct.chieurong}</td>
							<td><a
								href="<c:url value="/admin/xoa-phong?id_p=${phongct.id_p }&id_taikhoan=${user.id_tk }"/>">Xóa</a></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</c:if>
	<h2>Đang theo dõi</h2>
	<h2>Người theo dõi</h2>
	<h2>Đặt hẹn</h2>
</div>
