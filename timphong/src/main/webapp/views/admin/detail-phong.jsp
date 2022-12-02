<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container--admin container--admin--full">
	<div class="row">
		<div class="col-12">
			<h2 class="site-name py-4">Chỉnh sửa phòng</h2>
			<form class="text-dark" action="phong" method="post"
				enctype="multipart/form-data">
				<c:url value="/hinhanh?fname=${phong.anhchinh}" var="anh" />
				<div class="row flex-wrap">
					<div class="col-5">
						<div class="row">
							<input class="col-8 py-2 border-radius-12" hidden readonly
								type="text" name="id_p" value="${phong.id_p }">

							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Tên: </label><input
									class="col-8 py-2 border-radius-12" type="text" name="ten"
									value="${phong.ten }">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Trạng
									thái: </label><span class="select-wrapper select--white"> <select
									name="trangthai">
										<c:if test='${phong.trangthai == 1 }'>
											<option selected value="1">Hiện</option>
											<option value="2">Ẩn</option>
										</c:if>
										<c:if test='${phong.trangthai != 1 }'>
											<option selected value="2">Ẩn</option>
											<option value="1">Hiện</option>
										</c:if>

								</select></span>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Chiều
									dài: </label><input class="col-8 py-2 border-radius-12" type="text"
									name="chieudai" value="${phong.chieudai }">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Chiều
									rộng: </label><input class="col-8 py-2 border-radius-12" type="text"
									name="chieurong" value="${phong.chieurong }">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-5">Số
									người ở tối đa: </label><span class="select-wrapper select--white">
									<select name="songuoi">
										<option value="${phong.songuoi }" selected>${phong.songuoi }
											người</option>
										<option value="1">1 người</option>
										<option value="2">2 người</option>
										<option value="4">4 người</option>
										<option value="8">8 người</option>
										<option value="10">10 người</option>
								</select>
								</span>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Giá: </label><input
									class="col-8 py-2 border-radius-12" type="text" name="gia"
									value="${phong.gia }">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Địa
									chỉ: </label><input class="col-8 py-2 border-radius-12" type="text"
									name="dcchitiet" value="${phong.dcchitiet }">
							</div>

							<div class="col-12">
								<span class="select-wrapper select--dark mb-3 mr-3"> <select
									onchange="loadHuyen()" class="form-select form-select-sm"
									id="city" aria-label=".form-select-sm">
										<option value="${phong.getXa().getHuyen().matinh}" selected>${phong.getXa().getHuyen().getTinh().tentinh }</option>
										<c:forEach items="${tinhs }" var="tinh">
											<option value="${tinh.matinh }">${tinh.tentinh }</option>
										</c:forEach>
								</select></span><span class="select-wrapper select--dark mb-3 mr-3"> <select
									onchange="loadXa()" disabled class="form-select form-select-sm"
									id="district" aria-label=".form-select-sm">
										<option value="${phong.getXa().getHuyen().mahuyen }" selected>${phong.getXa().getHuyen().tenhuyen}</option>
								</select></span><span class="select-wrapper select--dark mb-3"> <select
									disabled class="form-select form-select-sm" id="ward"
									aria-label=".form-select-sm" name="xa">
										<option value="${phong.maxa }" selected>${phong.getXa().tenxa }</option>
								</select></span>
							</div>

							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Mô tả:
								</label>
								<textarea rows="4" cols="50" class="py-2 border-radius-12"
									name="mota">${phong.getMota()}</textarea>
							</div>



						</div>
					</div>
					<div class="col-7">
						<div class="row">

							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Loại
									phòng: </label><span class="select-wrapper select--dark"> <select
									name="id_lp">
										<option value="${phong.loaiphong.id_lp }">${phong.loaiphong.tenloai }</option>
										<c:forEach items="${loaiphongs}" var="lp">
											<option value="${lp.id_lp }">${lp.tenloai }</option>
										</c:forEach>
								</select></span>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Chủ
									phòng: </label><input class="col-8 py-2 border-radius-12" type="text"
									name="id_tk" value="${phong.id_tk }" readonly>
							</div>


							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Hình
									ảnh chính: </label> <img class="img-thumbnail img--phong"
									id="previewImg1" src="${anh }"> <label
									class="ml-3 label-img" for="hinhanh1"><i
									class="bi bi-upload"></i> Upload</label> <input id="hinhanh1"
									type="file" hidden onchange="previewFile1(this);"
									name="hinhanh"> <a
									href="<c:url value='/admin/xoa-anh-phong?id_p=${phong.id_p }&hinhanh=${phong.anhchinh }'/>">Xóa</a>
							</div>

							<c:forEach items="${phong.getHinhanhs() }" var="ha"
								varStatus="STT">

								<div class="col-12 mb-3">
									<label class="label-info-admin__small pr-3 col-4">Hình
										ảnh phụ: </label>
									<c:url value="/hinhanh?fname=${ha.hinhanh}" var="anh" />
									<img class="img-thumbnail img--phong"
										id="previewImg${STT.index+2}" src="${anh }"> <label
										class="ml-3 label-img" for="hinhanh${STT.index+2}"><i
										class="bi bi-upload"></i> Upload</label> <input
										id="hinhanh${STT.index+2}" type="file" hidden
										onchange="previewFile${STT.index+2}(this);" name="hinhanh">
									<a
										href="<c:url value='/admin/xoa-anh-phong?id_p=${phong.id_p }&hinhanh=${ha.hinhanh }'/>">Xóa</a>
								</div>

							</c:forEach>
							<c:if test="${phong.getHinhanhs().size() < 2 }">
								<button>
									<a
										href="<c:url value='/admin/them-anh-phong?id_p=${phong.id_p}'/>">Thêm
										Ảnh</a>
								</button>

							</c:if>

						</div>
					</div>
					<div class="col-10 text-right my-4">
						<button class="btn btn-info" type="submit">Chỉnh sửa</button>
						<c:if test="${id_ik != null }">
							<a href=<c:url value="/admin/taikhoan?id_tk=${id_tk }"/>
								class="ml-3 d-inline-block text-white btn bg-danger">Quay
								lại</a>
						</c:if>
						<c:if test="${id_ik == null }">
							<a href=<c:url value="/admin/list-phong"/>
								class="ml-3 d-inline-block text-white btn bg-danger">Quay
								lại</a>
						</c:if>
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
