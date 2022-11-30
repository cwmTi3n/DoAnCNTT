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
	
	.rating>label:hover:before,
	.rating>label:hover~label:before {
	opacity: 1 !important
	}
	
	.rating>input:checked~label:before {
	opacity: 1
	}
	
	.rating:hover>input:checked~label:before {
	opacity: 0.4
	}
	
	
	.buttons{
	top: 36px;
	position: relative;
	}
	
	
	.rating-submit{
	border-radius: 15px;
	color: #fff;
	    height: 49px;
	}
	
	
	.rating-submit:hover{
	
	color: #fff;
	}
</style>





<div class="site-section site-section-phong">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class=" border-bottom my-4">
					<h4 class="text-black mb-4">Đang lưu</h4>
					<table class="table">
						<thead class="thead-dark">
							<tr>
								<th scope="col">STT</th>
								<th scope="col">Hình ảnh</th>
								<th scope="col">Tên phòng</th>
								<th scope="col">Mô tả</th>
								<th scope="col">Giá</th>
								<th scope="col">Địa chỉ</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${dhLuu}" var="dh" varStatus="STT">
								<tr>
									<th scope="row">${STT.index+1}</th>
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

				<div class=" border-bottom my-4">
					<ul id="nav">
						<li><a href="/timphong/listdathen?hanhdong=1">Chờ xác
								nhận</a></li>
						<li><a href="/timphong/listdathen?hanhdong=2">Đã xác nhận</a></li>
						<li><a href="/timphong/listdathen?hanhdong=3">Bị hủy</a></li>
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
								<th scope="col">${hanhdong==2?"Liên hệ":""}</th>
								<c:if test="${hanhdong==2 }">
									<th scope="col"></th>
								</c:if>
							</tr>
						</thead>

						</tbody>
						<tbody>
							<c:forEach items="${dhChoxn}" var="dh" varStatus="STT">
								<tr>
									<th scope="row">${STT.index+1}</th>
									<td><a
										href="<c:url value='/detail-phong?id_p=${dh.phong.id_p }'/>">
											<c:url value="/hinhanh?fname=${dh.phong.anhchinh}"
												var="hinhanh" /> <img height="120" width="160"
											src="${hinhanh}" />
									</a></td>
									<td>${dh.phong.ten }</td>
									<td>${dh.phong.gia}</td>
									<td>${hanhdong==2?dh.phong.dcchitiet:""}
										${dh.phong.xa.tenxa }, ${dh.phong.xa.huyen.tenhuyen },
										${dh.phong.xa.huyen.tinh.tentinh }</td>
									<td>${dh.ngay }${dh.gio }</td>
									<c:if test="${dh.trangthai==1 }">
										<td><a
											href="/timphong/listdathen/huy?id_p=${dh.phong.id_p }">Hủy</a>
											/ <a href="/timphong/dathen?id_p=${dh.phong.id_p }">Sửa</a></td>
									</c:if>
									<c:if test="${dh.trangthai==2 }">
										<td>${dh.phong.taikhoan.sdt}</td>
										<td><input hidden type="checkbox" id="danhgia"
											name="danhgia"> <label for="danhgia"> <span
												class="btn btn-info">Đánh giá</span>
										</label>
											<div class="danhgia">
												<div class="col-8 text-black">
													<div class="row my-4">
														<form action="/timphong/danhgia" method="post">
															<input type="password" name="id_p" value="${dh.phong.id_p}" hidden>
															<label>Số sao: </label>
															            <div class="rating"> 
                															<input type="radio" name="sosao" value="5" id="5"><label for="5">☆</label> 
                															<input type="radio" name="sosao" value="4" id="4"><label for="4">☆</label> 
                															<input type="radio" name="sosao" value="3" id="3"><label for="3">☆</label> 
                															<input type="radio" name="sosao" value="2" id="2"><label for="2">☆</label> 
                															<input type="radio" name="sosao" value="1" id="1"><label for="1">☆</label>
            															</div>
															<br/><label>Nội dung: </label><input type="text" name="noidung">
															<button type="submit">Đánh giá</button>
														</form>
													</div>
												</div>
											</div></td>
									</c:if>
									<c:if test="${dh.trangthai==3 }">
										<td>
										<td><a
											href="/timphong/listdathen/xoa?id_p=${dh.phong.id_p }">Xóa</a>
											/ <a href="/timphong/dathen?id_p=${dh.phong.id_p }">Đặt
												lại</a></td>
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
