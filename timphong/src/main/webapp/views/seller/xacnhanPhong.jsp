<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="site-section site-section-phong">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class=" border-bottom my-4 text-center">
					<h2 class="text-black mb-4">Các phòng đang được đặt hẹn</h2>
				</div>

				<div class=" border-bottom my-4">
					<ul id="nav" class="row justify-content-around">
						<li class="d-inline-block"><a class="px-5 py-2 text-dark a-hanhdong" href="/timphong/xacnhan-p?hanhdong=1">Chờ xác nhận</a></li>
						<li class="d-inline-block"><a class="px-5 py-2 text-dark a-hanhdong" href="/timphong/xacnhan-p?hanhdong=2">Đã xác nhận</a></li>
						<li class="d-inline-block"><a class="px-5 py-2 text-dark a-hanhdong" href="/timphong/xacnhan-p?hanhdong=3">Đã hủy</a></li>
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
										href="<c:url value='/dathen?id_p=${dh.phong.id_p }'/>"> <c:url
												value="/hinhanh?fname=${dh.phong.anhchinh}" var="hinhanh" />
											<img height="120" width="160" src="${hinhanh}" />
									</a></td>
									<td>${dh.phong.ten }</td>
									<td>${dh.phong.gia}</td>
									<td>${dh.phong.xa.tenxa },${dh.phong.xa.huyen.tenhuyen },
										${dh.phong.xa.huyen.tinh.tentinh }</td>
									<td>${dh.ngay }${dh.gio }</td>
									<td>${dh.nguoidat.sdt}</td>
									<c:if test="${dh.trangthai == 1 }">
										<td><a
											href="/timphong/xacnhan-p/huy?id_p=${dh.phong.id_p }&id_tk=${dh.nguoidat.id_tk}">Hủy</a>
											/ <a
											href="/timphong/xacnhan-p/dongy?id_p=${dh.phong.id_p }&id_tk=${dh.nguoidat.id_tk}">Xác
												nhận</a></td>
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

<script>
	function active() {
		var link1 = document
				.querySelector("a[href='/timphong/xacnhan-p?hanhdong=1']");
		var char1 = link1.getAttribute("href").charAt(
				link1.getAttribute("href").length - 1);
		var link2 = document
				.querySelector("a[href='/timphong/xacnhan-p?hanhdong=2']");
		var char2 = link2.getAttribute("href").charAt(
				link2.getAttribute("href").length - 1);
		var link3 = document
				.querySelector("a[href='/timphong/xacnhan-p?hanhdong=3']");
		var char3 = link3.getAttribute("href").charAt(
				link3.getAttribute("href").length - 1);

		var currentUrl = window.location.href;
		var temp = currentUrl.charAt(currentUrl.length - 1);

		if (char1.localeCompare(temp) == 0) {
			link1.classList.add("text-white", "bg-dark");
			link1.classList.remove("text-dark", "a-hanhdong");
		} else if (char2.localeCompare(temp) == 0) {
			link2.classList.add("text-white", "bg-dark");
			link2.classList.remove("text-dark", "a-hanhdong");
		} else if (char3.localeCompare(temp) == 0) {
			link3.classList.add("text-white", "bg-dark");
			link3.classList.remove("text-dark", "a-hanhdong");
		} else {
			link1.classList.add("text-white", "bg-dark");
			link1.classList.remove("text-dark", "a-hanhdong");
		}
	}
</script>
