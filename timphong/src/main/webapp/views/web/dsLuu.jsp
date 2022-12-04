<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="site-section site-section-phong">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class=" border-bottom my-4">
					<h4 class="text-black mb-4">Đang lưu</h4>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								
								<th scope="col">Hình ảnh</th>
								<th scope="col">Tên phòng</th>
								<th scope="col">Mô tả</th>
								<th scope="col">Giá</th>
								<th scope="col">Địa chỉ</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${dhLuu}" var="dh">
								<tr>
									
									<td><a
										href="<c:url value='/dathen?id_p=${dh.phong.id_p }'/>"> <c:url
												value="/hinhanh?fname=${dh.phong.anhchinh}" var="hinhanh" />
											<img height="120" width="160" src="${hinhanh}" />
									</a></td>
									<td>${dh.phong.ten }</td>
									<td>${dh.phong.mota }</td>
									<td>${dh.phong.gia}</td>
									<td>${dh.phong.xa.tenxa },${dh.phong.xa.huyen.tenhuyen },
										${dh.phong.xa.huyen.tinh.tentinh }</td>
									<td><a
										href="/timphong/listdathen/xoa?id_p=${dh.phong.id_p }">Xóa</a>
										/ <a href="/timphong/dathen?id_p=${dh.phong.id_p }">Đặt</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
