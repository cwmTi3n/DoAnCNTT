<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class=container--admin>
	<div>
		<div>
			<h2>Chinh sua phong</h2>
			<form action="phong" method="post" enctype="multipart/form-data">
				<div>
					<label>Hình ảnh chính: </label>
					<c:url value="/hinhanh?fname=${phong.anhchinh}" var="anh" />
					<img height="180" width="240" src="${anh }"> <input
						type="file" name="hinhanh"> <a
						href="<c:url value='/admin/xoa-anh-phong?id_p=${phong.id_p }&hinhanh=${phong.anhchinh }'/>">Xóa</a><br />
				</div>
				<c:forEach items="${phong.getHinhanhs() }" var="ha">
					<div>
						<label>Hình ảnh: </label>
						<c:url value="/hinhanh?fname=${ha.hinhanh}" var="anh" />
						<img height="180" width="240" src="${anh }"> <input
							type="file" name="hinhanh"> <a
							href="<c:url value='/admin/xoa-anh-phong?id_p=${phong.id_p }&hinhanh=${ha.hinhanh }'/>">Xóa</a><br />
					</div>
				</c:forEach>
				<c:if test="${phong.getHinhanhs().size() < 2 }">
					<button>
						<a href="<c:url value='/admin/them-anh-phong?id_p=${phong.id_p}'/>">Thêm Ảnh</a>
					</button>
					<br />
				</c:if>
				<label>Id: </label><input type="text" name="id_p"
					value="${phong.id_p }"><br /> <label>Tên: </label><input
					type="text" name="ten" value="${phong.ten }"><br /> <label>Trạng
					thái: </label> <select name="trangthai">
					<c:if test='${phong.trangthai == 1 }'>
						<option value="1">Hiện</option>
						<option value="2">Ẩn</option>
					</c:if>
					<c:if test='${phong.trangthai != 1 }'>
						<option value="2">Ẩn</option>
						<option value="1">Hiện</option>
					</c:if>
				</select> <br /> <label>Chiều dài: </label><input type="text" name="chieudai"
					value="${phong.chieudai }"><br /> <label>Chiều
					rộng: </label><input type="text" name="chieurong"
					value="${phong.chieurong }"><br /> 
					
				<label>Số người ở tối đa: </label> <select name="songuoi">
					<option value="${phong.songuoi }" selected>${phong.songuoi } người</option>
					<option value="1">1 người</option>
					<option value="2">2 người</option>
					<option value="4">4 người</option>
					<option value="8">8 người</option>
					<option value="10">10 người</option>
				</select>
					
					<label>Giá: </label><input
					type="text" name="gia" value="${phong.gia }"><br />
					<label>Địa chỉ
					chi tiết: </label><input type="text" name="dcchitiet"
					value="${phong.dcchitiet }"><br />
					
								<div class="col-md-auto">
				<select onchange="loadHuyen()"
					class="form-select form-select-sm mb-3" id="city"
					aria-label=".form-select-sm">
					<option value="${phong.getXa().getHuyen().matinh}" selected>${phong.getXa().getHuyen().getTinh().tentinh }</option>
					<c:forEach items="${tinhs }" var="tinh">
						<option value="${tinh.matinh }">${tinh.tentinh }</option>
					</c:forEach>
				</select> <select onchange="loadXa()" disabled
					class="form-select form-select-sm mb-3" id="district"
					aria-label=".form-select-sm">
					<option value="${phong.getXa().getHuyen().mahuyen }" selected>${phong.getXa().getHuyen().tenhuyen}</option>
				</select> <select disabled class="form-select form-select-sm" id="ward"
					aria-label=".form-select-sm" name="xa">
					<option value="${phong.maxa }" selected>${phong.getXa().tenxa }</option>
				</select>
			</div>
					
					 <label>Mô tả: </label><input
					type="text" name="mota" value="${phong.mota }"><br /> <label>Loại
					phòng: </label> <select name="id_lp">
					<option value="${phong.loaiphong.id_lp }">${phong.loaiphong.tenloai }</option>
					<c:forEach items="${loaiphongs}" var="lp">
						<option value="${lp.id_lp }">${lp.tenloai }</option>
					</c:forEach>
				</select> <br />
				<label>Chủ phòng: </label><input type="text" name="id_tk"
					value="${phong.id_tk }"><br />
				<button type="submit">Chỉnh sửa</button>
			</form>
		</div>
	</div>
</div>


