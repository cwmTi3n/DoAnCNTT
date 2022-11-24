<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="site-section site-section-phong">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class=" border-bottom my-4">
					<h4 class="text-black mb-4">Các phòng đang được đặt hẹn</h4>
				</div>
				
				<div class=" border-bottom my-4">
					<ul id="nav">
						<li><a href="/timphong/xacnhan-p?hanhdong=1">Chờ xác nhận</a></li>
						<li><a href="/timphong/xacnhan-p?hanhdong=2">Đã xác nhận</a></li>
						<li><a href="/timphong/xacnhan-p?hanhdong=3">Đã hủy</a></li>
					</ul>
					<table class="table">
							<thead class="thead-dark">
								<tr>
									<th scope="col">STT</th>
									<th scope="col">Hình ảnh</th>
									<th scope="col">Tên phòng</th>
									<th scope="col">Giá</th>
									<th scope="col">Địa chỉ</th>
									<th scope="col">Thời gian</th>
									<th scope="col">SDT</th>
									<th scope="col"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dhChoxn}" var="dh" varStatus="STT">
									<tr>
										<th scope="row">${STT.index+1}</th>
										<td><a
											href="<c:url value='/dathen?id_p=${dh.phong.id_p }'/>">
												<c:url value="/hinhanh?fname=${dh.phong.anhchinh}" var="hinhanh" />
												<img height="120" width="160" src="${hinhanh}" />
										</a></td>
										<td>${dh.phong.ten }</td>
										<td>${dh.phong.gia}</td>
										<td>${dh.phong.xa.tenxa }, ${dh.phong.xa.huyen.tenhuyen }, ${dh.phong.xa.huyen.tinh.tentinh }</td>
										<td>${dh.ngay } ${dh.gio }</td>
										<td>${dh.nguoidat.sdt}</td>
										<c:if test = "${dh.trangthai == 1 }">
											<td>
												<a href="/timphong/xacnhan-p/huy?id_p=${dh.phong.id_p }&id_tk=${dh.nguoidat.id_tk}">Hủy</a> / 
												<a href="/timphong/xacnhan-p/dongy?id_p=${dh.phong.id_p }&id_tk=${dh.nguoidat.id_tk}">Xác nhận</a>
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

