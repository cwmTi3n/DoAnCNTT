<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container--admin container--admin--full">
	<div class="row">
		<div class="col-12">
			<h2 class="site-name py-4">Thêm phòng</h2>

			<form action="them-phong" method="post" enctype="multipart/form-data">
				<div class="row flex-wrap">
					<div class="col-6">
						<div class="row">
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3 col-4">Tên: </label><input
									class="col-8 py-2 border-radius-12" type="text" name="ten">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3 col-4">Trạng thái: </label>
								<span class="select-wrapper select--white"> <select
									name="trangthai">
										<option selected value="1">Hiện</option>
										<option value="2">Ẩn</option>
								</select>
								</span>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3 col-4">Chiều dài: </label><input
									class="col-8 py-2 border-radius-12" type="text" name="chieudai">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3 col-4">Chiều rộng: </label><input
									class="col-8 py-2 border-radius-12" type="text"
									name="chieurong">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3 col-5">Số người ở
									tối đa: </label> <span class="select-wrapper select--white"><select
									name="songuoi">
										<option value="1" selected>1 người</option>
										<option value="2">2 người</option>
										<option value="4">4 người</option>
										<option value="8">8 người</option>
										<option value="10">10 người</option>
								</select> </span>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3 col-4">Giá: </label><input
									class="col-8 py-2 border-radius-12" type="text" name="gia">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3 col-4">Địa chỉ chi
									tiết: </label><input class="col-8 py-2 border-radius-12" type="text"
									name="dcchitiet">
							</div>

							<div class="col-12">
								<span class="select-wrapper select--dark"> <select
									onchange="loadHuyen()" class="form-select form-select-sm mb-3"
									id="city" aria-label=".form-select-sm">
										<option value="0" selected>Chọn tỉnh, thành phố</option>
										<c:forEach items="${tinhs }" var="tinh">
											<option value="${tinh.getMatinh() }">${tinh.getTentinh() }</option>
										</c:forEach>
								</select>
								</span> <span class="select-wrapper select--dark"> <select
									onchange="loadXa()" disabled
									class="form-select form-select-sm mb-3" id="district"
									aria-label=".form-select-sm">
										<option value="0" selected>Chọn quận huyện</option>
								</select></span><span class="select-wrapper select--dark"> <select
									disabled class="form-select form-select-sm" id="ward"
									aria-label=".form-select-sm" name="xa">
										<option value="0" selected>Chọn phường xã</option>
								</select></span>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3 col-4">Mô tả: </label>
								<textarea rows="4" cols="72" class="py-2 border-radius-12"
									name="mota"></textarea>
							</div>
						</div>
					</div>
					<div class="col-6">
						<div class="row">
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3 col-4">Loại phòng: </label>
								<span class="select-wrapper select--dark"> <select
									name="id_lp">
										<c:forEach items="${loaiphongs}" var="lp">
											<option value="${lp.id_lp }">${lp.tenloai }</option>
										</c:forEach>
								</select>
								</span>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3 col-4">Chủ phòng: </label><input
									class="col-8 py-2 border-radius-12" readonly type="text"
									name="id_tk" value="${id_tk }">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3 col-4">Hình ảnh
									chính: </label> <img height="180" width="240" id="previewImg1"
									class="img-thumbnail img--phong" src=""> <label
									class="ml-3 label-img" for="hinhanh1"><i
									class="bi bi-upload"></i> Upload</label> <input id="hinhanh1"
									type="file" hidden onchange="previewFile1(this);"
									name="hinhanh">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3 col-4">Hình ảnh phụ
									1: </label><img height="180" width="240" id="previewImg2"
									class="img-thumbnail img--phong" src=""> <label
									class="ml-3 label-img" for="hinhanh2"><i
									class="bi bi-upload"></i> Upload</label> <input id="hinhanh2"
									type="file" hidden onchange="previewFile2(this);"
									name="hinhanh">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3 col-4">Hình ảnh phụ
									2: </label><img height="180" width="240" id="previewImg3"
									class="img-thumbnail img--phong" src=""> <label
									class="ml-3 label-img" for="hinhanh3"><i
									class="bi bi-upload"></i> Upload</label> <input id="hinhanh3"
									type="file" hidden onchange="previewFile3(this);"
									name="hinhanh">
							</div>
						</div>
					</div>
					<div class="col-12">
							<button class="btn btn-info" type="submit">Thêm</button>
							<a href=<c:url value="/admin/taikhoan?id_tk=${id_tk }"/>
							class="ml-3 d-inline-block text-white btn bg-danger">Quay lại</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script>
	function previewFile1(input) {
		var file = $("#hinhanh1").get(0).files[0];
		if (file) {
			var reader = new FileReader();

			reader.onload = function() {
				$("#previewImg1").attr("src", reader.result);
			}
			reader.readAsDataURL(file);
		}
	}
	function previewFile2(input) {
		var file = $("#hinhanh2").get(0).files[0];
		if (file) {
			var reader = new FileReader();

			reader.onload = function() {
				$("#previewImg2").attr("src", reader.result);
			}
			reader.readAsDataURL(file);
		}
	}
	function previewFile3(input) {
		var file = $("#hinhanh3").get(0).files[0];
		if (file) {
			var reader = new FileReader();

			reader.onload = function() {
				$("#previewImg3").attr("src", reader.result);
			}
			reader.readAsDataURL(file);
		}
	}
</script>