<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container--admin">
	<div class="row">
		<form action="them-phong" method="post" enctype="multipart/form-data">
			<label>Tên: </label><input type="text" name="ten"><br /> <label>Trạng
				thái: </label> <select name="trangthai">
				<option value="1">Hiện</option>
				<option value="2">Ẩn</option>
			</select> <br /> <label>Chiều dài: </label><input type="text" name="chieudai"><br />
			<label>Chiều rộng: </label><input type="text" name="chieurong"><br />
			<label>Giá: </label><input type="text" name="gia"><br /> <label>Địa
				chỉ chi tiết: </label><input type="text" name="dcchitiet"><br />

			<div class="col-md-auto">
				<select onchange="loadHuyen()"
					class="form-select form-select-sm mb-3" id="city"
					aria-label=".form-select-sm">
					<option value="0" selected>Chọn tỉnh, thành phố</option>
					<c:forEach items="${tinhs }" var="tinh">
						<option value="${tinh.matinh }">${tinh.tentinh }</option>
					</c:forEach>
				</select> <select onchange="loadXa()" disabled
					class="form-select form-select-sm mb-3" id="district"
					aria-label=".form-select-sm">
					<option value="0" selected>Chọn quận huyện</option>
				</select> <select disabled class="form-select form-select-sm" id="ward"
					aria-label=".form-select-sm" name="xa">
					<option value="0" selected>Chọn phường xã</option>
				</select>
			</div>

			<label>Mô tả: </label><input type="text" name="mota"><br />
			<label>Loại phòng: </label> <select name="id_lp">
				<c:forEach items="${loaiphongs}" var="lp">
					<option value="${lp.id_lp }">${lp.tenloai }</option>
				</c:forEach>
			</select> <br /> <label>Chủ phòng: </label><input type="text" name="id_tk"
				value="${id_tk }"><br /> <label>Hình ảnh chính: </label><input
				type="file" name="hinhanh"><br /> <label>Hình ảnh
				phụ: </label><input type="file" name="hinhanh"><br /> <label>Hình
				ảnh phụ: </label><input type="file" name="hinhanh"><br />
			<button type="submit">Thêm</button>
		</form>
	</div>
</div>

<script>
	function loadHuyen() {
		var id_t = $('#city').find(":selected").val();
		var labelXa = "<option value='0' selected>Chọn phường xã</option>"
		var citis = document.getElementById("city");
		var districts = document.getElementById("district");
		var wards = document.getElementById("ward");

		if (id_t != 0) {
			districts.disabled = false;
			//wards.disabled = true;
			wards.innerHTML = labelXa;
			$.ajax({
				url : "/timphong/listhuyen", //send to Controller
				type : "get", //send it through get method
				data : {
					exits : id_t
				},
				success : function(data) {
					/* 					removeData(districts);
					 removeData(ward);
					 $("#district").append(data); */

					districts.innerHTML = data;
				}
			});
		} else {
			districts.disabled = true;
			wards.disabled = true;

			districts.value = 0;
			wards.value = 0;
		}

	};

	function loadXa() {
		var id_h = $('#district').find(":selected").val();

		var citis = document.getElementById("city");
		var districts = document.getElementById("district");
		var wards = document.getElementById("ward");

		if (id_h != 0) {
			wards.disabled = false;
			$.ajax({
				url : "/timphong/listxa", //send to Controller
				type : "get", //send it through get method
				data : {
					exits : id_h
				},
				success : function(data) {
					/* 					removeData(wards);
					 $("#ward").append(data); */
					wards.innerHTML = data;
				}
			});
		} else {
			wards.disabled = true;
			wards.value = 0;
		}
	};

	/* 	function removeData(data) {
	 if (data !== undefined) {
	 var i, L = data.options.length - 1;
	 for (i = L; i >= 1; i--) {
	 data.remove(i);
	 }
	 }
	 } */
</script>
