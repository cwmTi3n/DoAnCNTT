<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class=container--admin>
	<div>
		<h2>Thêm loại phòng</h2>
		<form action="them-loaiphong" method="post">
			<label>Tên loại phòng: </label><input type="text" name="tenloai"><br />
			<button type="submit">Thêm</button>
		</form>
	</div>
</div>