<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container--admin container--admin--full">
	<div class="row">
		<div class="col-12">

			<h2 class="site-name py-4">Thêm loại phòng</h2>
			<form class="d-flex align-items-center" action="them-loaiphong"
				method="post">
				<label class="col label--admin--big" for="tenloai">Tên loại
					phòng: </label>
				<div class="col-5">
					<input class="col-12 py-2 border-radius-12" type="text"
						name="tenloai">
				</div>
				<div class="col-2">
					<button class="col btn btn-info" type="submit">Thêm</button>
				</div>
				<div class="col-2">
					<a href="<c:url value='/admin/list-loaiphong'/>"
						class="col text-white btn bg-danger">Hủy</a>
				</div>
			</form>
			<c:if test="${not empty emptyText}">
				<p class="text-danger my-0">${emptyText}</p>
			</c:if>
		</div>
	</div>
</div>

