<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<p>Danh sách phòng</p>
<table class=table>
	<thead class="thead-dark">
		<tr>
			<th scope="col">STT</th>
			<th scope="col">Id</th>
			<th scope="col">Tên loại phòng</th>
			<th scope="col">Số phòng</th>
			<th scope="col"></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${phongs}" var="p">
				<tr>
					<td>${p.id_p}</td>
					<td>${p.ten }</td>
				</tr>
		</c:forEach>
	</tbody>
</table>