<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container--admin container--admin--full">
	<div class="row">
		<div class="col-12">
			<h2 class="site-name py-4">Thêm tài khoản</h2>
			<form class="text-dark" action="themtk" method="post" enctype="multipart/form-data">
				<div class="row flex-wrap">
					<div class="col-6">
						<div class="row">
							<div class="col-12 mb-3">
								<label class="col-3 align-middle label-info-admin__small pr-3">Ảnh
									đại diện: </label> <img id="previewImg"
									class="rounded-circle profile-img img-thumbnail" src="${anh }">
								<label class="ml-3 label-img" for="anhdaidien"><i
									class="bi bi-upload"></i> Upload</label> <input hidden type="file"
									name="anhdaidien" id="anhdaidien" onchange="previewFile(this);"
									class="inputfile">
							</div>
							<div class="col-12 mb-3">
								<label class="col-3 label-info-admin__small pr-3">Tài
									khoản: </label> <input class="col-7 py-2 border-radius-12" type="text"
									name="tentk" placeholder="Tên tài khoản">
							</div>
							<div class="col-12 mb-3">
								<label class="col-3 label-info-admin__small pr-3">Mật
									khẩu: </label> <input class="col-7 py-2 border-radius-12"
									type="password" name="matkhau" placeholder="Mật khẩu">
							</div>

							<div class="col-12 mb-3">
								<label class="col-3 label-info-admin__small pr-3">Quyền:
								</label><span class="select-wrapper select--white"> <select
									name="quyen">
										<option selected value="2">User</option>
										<option value="3">Seller</option>
								</select></span>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="row">
							<div class="col-12 mb-3">
								<label class="col-3 label-info-admin__small pr-3">Họ: </label> <input
									class="col-7 py-2 border-radius-12" type="text" name="ho"
									placeholder="Họ">
							</div>
							<div class="col-12 mb-3">
								<label class="col-3 label-info-admin__small pr-3">Tên: </label>
								<input class="col-7 py-2 border-radius-12" type="text"
									name="ten" placeholder="Tên">
							</div>
							<div class="col-12 mb-3">
								<label class="col-3 label-info-admin__small pr-3">SDT: </label> <input class="col-7 py-2 border-radius-12"
									type="text" name="sdt" placeholder="Số điện thoại">
							</div>
							<div class="col-12 mb-3">
								<label class="col-3 label-info-admin__small pr-3">Email: </label> <input class="col-7 py-2 border-radius-12"
									type="text" name="email" placeholder="Email">
							</div>
						</div>
					</div>
					<div class="col-10 text-right my-4">
						<button class="btn btn-info" type="submit">Thêm</button>
						<a href=<c:url value="/admin/list-taikhoan"/>
							class="ml-3 d-inline-block text-white btn bg-danger">Quay lại</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	function previewFile(input) {
		var file = $("input[type=file]").get(0).files[0];
		if (file) {
			var reader = new FileReader();

			reader.onload = function() {
				$("#previewImg").attr("src", reader.result);
			}
			reader.readAsDataURL(file);
		}
	}
</script>