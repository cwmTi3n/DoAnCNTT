<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class=container--admin>
	<div>
		<h2>Thêm ảnh cho phòng:</h2>
		<form action="them-anh-phong" method="post"
			enctype="multipart/form-data">
			<label>Id: </label><input type="text" name="id_p" value="${id_p }">
			<label>Hinh ảnh: </label><input type="file" name="hinhanh"><br />
			<button type="submit">Thêm</button>
		</form>
	</div>
</div>