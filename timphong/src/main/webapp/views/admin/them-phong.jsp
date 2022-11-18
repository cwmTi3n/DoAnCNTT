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
						<option value="${tinh.getMatinh() }">${tinh.getTentinh() }</option>
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
