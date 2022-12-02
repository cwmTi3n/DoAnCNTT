<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container--admin container--admin--full">
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
		crossorigin="anonymous">


	<div class="row">
		<div class="col-12">
			<h2 class="site-name py-4">Thông tin cá nhân</h2>
			<form class="d-flex align-items-center" action="taikhoan"
				method="post" enctype="multipart/form-data">
				<input type="text" hidden name="id_tk" value="${user.id_tk }">
				<c:url value="/hinhanh?fname=${user.anhdaidien}&path=taikhoan"
					var="anh" />
				<div class="row flex-wrap">
					<div class="col-6">
						<div class="row">
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3" for="">Ảnh: </label><img
									id="previewImg"
									class="rounded-circle profile-img img-thumbnail" src="${anh }">
								<label class="ml-3 label-img" for="anhdaidien"><i
									class="bi bi-upload"></i> Upload</label> <input hidden type="file"
									name="anhdaidien" id="anhdaidien" onchange="previewFile(this);"
									class="inputfile"> <br>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3" for="tentk">Tài
									khoản: </label><input readonly class="col-12 py-2 border-radius-12"
									type="text" name="tentk" value="${user.tentk }">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Mật khẩu: </label><input
									class="col-12 py-2 border-radius-12" type="password"
									name="matkhau" value="${user.matkhau }">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Quyền: </label> <span
									class="select-wrapper select--white"><select
									name="quyen">
										<c:if test="${user.quyen == 2 }">
											<option selected value="2">User</option>
											<option value="3">Seller</option>
										</c:if>
										<c:if test="${user.quyen == 3 }">
											<option selected value="3">Seller</option>
											<option value="2">User</option>
										</c:if>
								</select> </span>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="row">
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Họ: </label><input
									class="col-12 py-2 border-radius-12" type="text" name="ho"
									value="${user.ho }">
							</div>
							<div class="col-12 mb-3">

								<label class="label-info-admin pr-3">Tên: </label><input
									class="col-12 py-2 border-radius-12" type="text" name="ten"
									value="${user.ten }">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">SDT: </label><input
									class="col-12 py-2 border-radius-12" type="text" name="sdt"
									value="${user.sdt }">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Email: </label><input
									class="col-12 py-2 border-radius-12" type="text" name="email"
									value="${user.email }">
							</div>
						</div>
					</div>

					<div class="col-6">
						<c:if test="${user.quyen == 3 }">
							<a class="d-inline-flex mb-3 new-object-button"
								href="<c:url value="/admin/them-phong?id_tk=${user.id_tk}"/>"><i
								class="bi bi-plus-lg"></i> Thêm Phòng Cho Seller</a>
						</c:if>
					</div>
					<div class="col-6>">
						<button class="btn btn-info" type="submit">Chỉnh sửa</button>
						<a href="<c:url value='/admin/list-taikhoan'/>"
							class="ml-3 d-inline-block text-white btn bg-danger">Quay lại</a>
					</div>
				</div>

			</form>
		</div>
		<c:if test="${user.quyen==3}">
			<div class="col-12">
				<h2 class="site-name py-4">Phòng đang đăng: ${tongPhong }</h2>
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
										<c:url value="/hinhanh?fname=${phongct.anhchinh}"
											var="hinhanh" /> <img height="120" width="160"
										src="${hinhanh}" />
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
		<div class="col-12">
			<h2 class="site-name py-4">Danh sách đặt hẹn</h2>
		</div>
	</div>
</div>






<script>
	function previewFile(input) {
		var file = $("input[type=file]").get(0).files[0];
		console.log("hello");
		if (file) {
			var reader = new FileReader();

			reader.onload = function() {
				$("#previewImg").attr("src", reader.result);
			}

			console.log($('#previewImg'));
			reader.readAsDataURL(file);
		}
	}
</script>