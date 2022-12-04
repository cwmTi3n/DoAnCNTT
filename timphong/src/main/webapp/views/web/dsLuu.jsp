<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="site-section site-section-phong">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-12 table-web">
				<div class="table-web-layer">
					<h2 class="text-black mb-4 text-center">Đang lưu</h2>
					<table class="table table-hover text-dark">
						<thead class="thead-dark">
							<tr>

								<th class="col-2" scope="col">Hình ảnh</th>
								<th class="col-2" scope="col">Tên phòng</th>
								<th class="col-1" scope="col">Giá</th>
								<th class="col-1" scope="col">Diện tích</th>
								<th class="col-3" scope="col">Địa chỉ</th>
								<th class="col-2" scope="col">Chủ phòng</th>
								<th class="" scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${dhLuu}" var="dh">
								<tr>

									<td class="col-2"><a
										href="<c:url value='/dathen?id_p=${dh.phong.id_p }'/>"><c:url
											value="/hinhanh?fname=${dh.phong.anhchinh}" var="hinhanh" />
										<img class="img-thumbnail img--phong__small" src="${hinhanh}" /></a>
									</td>
									<td class="col-2">${dh.phong.ten }</td>
									<td class="col-1">${dh.phong.gia}</td>
									<td class="col-1">${dh.phong.chieudai}*${dh.phong.chieurong}</td>
									<td class="col-3">${dh.phong.getXa().getTenxa()},
										${dh.phong.getXa().getHuyen().getTenhuyen()},
										${dh.phong.getXa().getHuyen().getTinh().getTentinh() }</td>
									<td class="col-2">${dh.phong.getTaikhoan().getTen()}</td>
									
									<td class="col-1"><a
										 class="btn btn-danger btn-save-profile mb-3" href="/timphong/favorites/xoa?id_p=${dh.phong.id_p }">Xóa</a>
										<a class="btn btn-dark btn-save-profile" href="/timphong/dathen?id_p=${dh.phong.id_p }">Đặt</a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
