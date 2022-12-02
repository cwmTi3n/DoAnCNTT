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
								<label class="label-info-admin pr-3">Tên: </label><input class="col-12 py-2 border-radius-12" 
									type="text" name="ten">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Trạng thái: </label> <select
									name="trangthai">
									<option value="1">Hiện</option>
									<option value="2">Ẩn</option>
								</select>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Chiều dài: </label><input class="col-12 py-2 border-radius-12" 
									type="text" name="chieudai">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Chiều rộng: </label><input class="col-12 py-2 border-radius-12" 
									type="text" name="chieurong">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Số người ở tối đa:
								</label> <select name="songuoi">
									<option value="1" selected>1 người</option>
									<option value="2">2 người</option>
									<option value="4">4 người</option>
									<option value="8">8 người</option>
									<option value="10">10 người</option>
								</select>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Giá: </label><input class="col-12 py-2 border-radius-12" 
									type="text" name="gia">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Địa chỉ chi tiết: </label><input class="col-12 py-2 border-radius-12" 
									type="text" name="dcchitiet">
							</div>

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
						</div>
					</div>
					<div class="col-6">
						<div class="row">
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Mô tả: </label><input class="col-12 py-2 border-radius-12" 
									type="text" name="mota">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Loại phòng: </label> <select
									name="id_lp">
									<c:forEach items="${loaiphongs}" var="lp">
										<option value="${lp.id_lp }">${lp.tenloai }</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Chủ phòng: </label><input class="col-12 py-2 border-radius-12" 
									type="text" name="id_tk" value="${id_tk }">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Hình ảnh chính: </label><input class="col-12 py-2 border-radius-12" 
									type="file" name="hinhanh">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Hình ảnh phụ: </label><input class="col-12 py-2 border-radius-12" 
									type="file" name="hinhanh">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin pr-3">Hình ảnh phụ: </label><input class="col-12 py-2 border-radius-12" 
									type="file" name="hinhanh">
							</div>
							<button type="submit">Thêm</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
