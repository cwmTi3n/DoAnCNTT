<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.rating {
	display: flex;
	flex-direction: row-reverse;
	justify-content: center
}

.rating>input {
	display: none
}

.rating>label {
	position: relative;
	width: 1em;
	font-size: 30px;
	font-weight: 300;
	color: #FFD600;
	cursor: pointer
}

.rating>label::before {
	content: "\2605";
	position: absolute;
	opacity: 0
}

.rating>label:hover:before, .rating>label:hover ~label:before {
	opacity: 1 !important
}

.rating>input:checked ~label:before {
	opacity: 1
}

.rating:hover>input:checked ~label:before {
	opacity: 0.4
}

.buttons {
	top: 36px;
	position: relative;
}

.rating-submit {
	border-radius: 15px;
	color: #fff;
	height: 49px;
}

.rating-submit:hover {
	color: #fff;
}

.modal {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
}
</style>
<div class="site-section site-section-phong">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-12 table-web">
				<div class="table-web-layer">
					<h2 class="text-black mb-4 text-center">Danh sách đặt hẹn</h2>

					<div class=" border-bottom my-4">
						<ul class="row justify-content-around">
							<li class="d-inline-block"><a
								class="px-5 py-2 text-dark a-hanhdong"
								href="/timphong/admin/ql-dathen?hanhdong=1">Chờ xác nhận</a></li>
							<li class="d-inline-block"><a
								class="px-5 py-2 text-dark a-hanhdong"
								href="/timphong/admin/ql-dathen?hanhdong=2">Đã xác nhận</a></li>
							<li class="d-inline-block"><a
								class="px-5 py-2 text-dark a-hanhdong"
								href="/timphong/admin/ql-dathen?hanhdong=3">Bị hủy</a></li>
						</ul>
						<div id="goto-dg"></div>
						<div class="dg" id="dg" style="display: none;">
							<div class="col-8 text-black">
								<div class="row my-4">
									<form action="/timphong/danhgia" method="post">
										<input type="password" name="id_p" value="" hidden
											id="dg_id_p"> <label>Số sao: </label>
										<div class="rating">
											<input type="radio" name="sosao" value="5" id="5"><label
												for="5">☆</label> <input type="radio" name="sosao" value="4"
												id="4"><label for="4">☆</label> <input type="radio"
												name="sosao" value="3" id="3"><label for="3">☆</label>
											<input type="radio" name="sosao" value="2" id="2"><label
												for="2">☆</label> <input type="radio" name="sosao" value="1"
												id="1"><label for="1">☆</label>
										</div>
										<br /> <label>Nội dung: </label><input type="text"
											name="noidung">
										<button type="submit">Đánh giá</button>
									</form>
								</div>
							</div>
						</div>
						<table class="table table-hover text-dark">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Hình ảnh</th>
									<th scope="col">Tên phòng</th>
									<th scope="col">Giá</th>
									<th scope="col">Địa chỉ</th>
									<th scope="col">Thời gian</th>
									<th scope="col">Chủ phòng</th>
									<th scope="col">Người đặt</th>
									<th scope="col"></th>
								</tr>
							</thead>

							</tbody>
							<tbody>
								<c:forEach items="${dhChoxn}" var="dh">
									<tr>
										<td><a
											href="<c:url value='/detail-phong?id_p=${dh.phong.id_p }'/>">
												<c:url value="/hinhanh?fname=${dh.phong.anhchinh}"
													var="hinhanh" /> <img
												class="img-thumbnail img--phong__small" src="${hinhanh}" />
										</a></td>
										<td>${dh.phong.ten }</td>
										<td>${dh.phong.gia}</td>
										<td>${hanhdong==2?dh.phong.dcchitiet:""}
											${dh.phong.xa.tenxa }, ${dh.phong.xa.huyen.tenhuyen },
											${dh.phong.xa.huyen.tinh.tentinh }</td>
										<td>${dh.ngay }<br>${dh.gio }</td>
										<td><a href="<c:url value="/admin/taikhoan?id_tk=${dh.phong.taikhoan.id_tk }"/>">${dh.phong.taikhoan.tentk }</a></td>
										<td><a href="<c:url value="/admin/taikhoan?id_tk=${dh.nguoidat.id_tk }"/>">${dh.nguoidat.tentk }</a></td>
										<td><a href="<c:url value='/admin/ql-dathen/xoa?id_p=${dh.id_p }&id_tk=${dh.id_tk }'/>">Xóa</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	function danhgia(id_p) {
		document.getElementById('dg_id_p').value = id_p;
		var dg = document.getElementById('dg');
		if(dg.style.display == "none"){
			dg.style.display = "block";
		}
		else{
			dg.style.display = "none";
		}
	};
	
	function active(){
		var link1 = document.querySelector("a[href='/timphong/listdathen?hanhdong=1']");
		var char1 = link1.getAttribute("href").charAt(link1.getAttribute("href").length-1);
		var link2 = document.querySelector("a[href='/timphong/listdathen?hanhdong=2']");
		var char2 = link2.getAttribute("href").charAt(link2.getAttribute("href").length-1);
		var link3 = document.querySelector("a[href='/timphong/listdathen?hanhdong=3']");
		var char3 = link3.getAttribute("href").charAt(link3.getAttribute("href").length-1);
		
		var currentUrl = window.location.href;
		var temp = currentUrl.charAt(currentUrl.length-1);
		
		if(char1.localeCompare(temp) == 0){
			link1.classList.add("text-white", "bg-dark");
			link1.classList.remove("text-dark", "a-hanhdong");
		} else if(char2.localeCompare(temp) == 0){
			link2.classList.add("text-white", "bg-dark");
			link2.classList.remove("text-dark", "a-hanhdong");
		} else if(char3.localeCompare(temp) == 0){
			link3.classList.add("text-white", "bg-dark");
			link3.classList.remove("text-dark", "a-hanhdong");
		} else {
			link1.classList.add("text-white", "bg-dark");
			link1.classList.remove("text-dark", "a-hanhdong");
		}
	}
</script>
