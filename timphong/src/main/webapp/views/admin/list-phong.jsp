<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<p>Danh sách phòng</p>
		<table class="table">
			<thead class="thead-dark">
				<tr>
					<th scope="col">STT</th>
					<th scope="col">Id</th>
					<th scope="col">Hình ảnh</th>
					<th scope="col">Trạng thái</th>
					<th scope="col">Giá</th>
					<th scope="col">Diện tích</th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${phongs}" var="phong" varStatus="STT">
						<tr>
							<th scope="row">${STT.index+1}</th>
							<td>${phong.id_p}</td>
							<td>
								<a href="<c:url value="/admin/phong?id_p=${phong.id_p }&id_taikhoan=${user.id_tk }"/>">
									<c:url value="/hinhanh?fname=${phong.anhchinh}" var="hinhanh"/>
									<img height="120" width="160" src="${hinhanh}"/>
								</a>
							</td>
							<td>${phong.trangthai==1 ? "Hiện":"Ẩn"}</td>
							<td>${phong.gia}</td>
							<td>${phong.chieudai}*${phong.chieurong}</td>
							<td><a href="<c:url value="/admin/xoa-phong?id_p=${phong.id_p }&id_taikhoan=${user.id_tk }"/>">Xóa</a></td>
							
						</tr>
				</c:forEach>
			</tbody>
		</table>