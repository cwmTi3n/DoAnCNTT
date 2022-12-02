<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600"
	rel="stylesheet" type="text/css">


<div class="site-section site-section-phong" id="property-details">	
	<div class="row">
		<div class="col-12">
			<div class="row">
				<div class="col-3">
					<div class="row">
						<div class="col-12">
							<form action="#" method="post" enctype="multipart/form-data">
								<div>
									<input type="text" name="id_p" value="${phong.id_p }" hidden>
									<label>Hình ảnh chính: </label>
									<c:url
										value="/hinhanh?fname=${phong.anhchinh==null?'abc':phong.anhchinh}"
										var="anh" />
									<img height="180" width="240" src="${anh }"> <input
										type="file" name="hinhanh"> <a
										href="<c:url value='/seller/ql-phong/xoa-anh-phong?id_p=${phong.id_p }&hinhanh=${phong.anhchinh }'/>">Xóa</a><br />
								</div>
								<c:forEach items="${phong.getHinhanhs() }" var="ha">
									<div>
										<label>Hình ảnh: </label>
										<c:url value="/hinhanh?fname=${ha.hinhanh}" var="anh" />
										<img height="180" width="240" src="${anh }"> <input
											type="file" name="hinhanh"> <a
											href="<c:url value='/seller/ql-phong/xoa-anh-phong?id_p=${phong.id_p }&hinhanh=${ha.hinhanh }'/>">Xóa</a><br />
									</div>
								</c:forEach>
								<c:if test="${phong==null }">
									<label>Hình ảnh phụ: </label>
									<input type="file" name="hinhanh">
									<br />
									<label>Hình ảnh phụ: </label>
									<input type="file" name="hinhanh">
									<br />
								</c:if>
								<c:if test="${phong.getHinhanhs().size() < 2 && phong!=null }">
									<button>
										<a href="<c:url value='/admin/them-anh-phong?id_p=${phong.id_p}'/>">Thêm Ảnh</a>
									</button>
									<br />
								</c:if>
								<label>Tên: </label><input type="text" name="ten"
									value="${phong.ten }"> <br> <label>Chiều
									dài: </label><input type="text" name="chieudai"
									value="${phong.chieudai }"><br> <label>Chiều
									rộng: </label><input type="text" name="chieurong"
									value="${phong.chieurong }"> <br> 
									
								<label>Số người ở tối đa: </label> <select name="songuoi">
									<option value="${phong.songuoi }" selected>${phong.songuoi } người</option>
									<option value="1">1 người</option>
									<option value="2">2 người</option>
									<option value="4">4 người</option>
									<option value="8">8 người</option>
									<option value="10">10 người</option>
								</select>
									
									<label>Giá:
								</label><input type="text" name="gia" value="${phong.gia }"><br>
								<label>Địa chỉ chi tiết: </label><input type="text"
									name="dcchitiet" value="${phong.dcchitiet }"><br />
								<div class="col-md-auto">
									<select onchange="loadHuyen()"
										class="form-select form-select-sm mb-3" id="city"
										aria-label=".form-select-sm">
										<c:if test="${phong == null }">
											<option value="0" selected>Chọn tỉnh thành phố</option>
										</c:if>
										<c:if test="${phong != null }">
											<option value="${phong.getXa().getHuyen().matinh}" selected>${phong.getXa().getHuyen().getTinh().tentinh }</option>
										</c:if>
										<c:forEach items="${tinhs }" var="tinh">
											<option value="${tinh.matinh }">${tinh.tentinh }</option>
										</c:forEach>
									</select> <select onchange="loadXa()" disabled
										class="form-select form-select-sm mb-3" id="district"
										aria-label=".form-select-sm">
										<c:if test="${phong == null }">
											<option value="0" selected>Chọn quận huyện</option>
										</c:if>
										<option value="${phong.getXa().getHuyen().mahuyen }">${phong.getXa().getHuyen().tenhuyen}</option>
									</select> <select disabled class="form-select form-select-sm" id="ward"
										aria-label=".form-select-sm" name="xa">
										<option value="${phong.maxa }" selected>${phong.getXa().tenxa }</option>
									</select>
								</div>

								<label>Mô tả: </label><input type="text" name="mota"
									value="${phong.mota }"><br /> <label>Loại
									phòng: </label> 
									<select name="id_lp">
									<option value="${phong.loaiphong.id_lp }">${phong.loaiphong.tenloai }</option>
									<c:if test="${phong == null }">
										<option value="0" selected>Chọn loại phòng</option>
									</c:if>
									<c:forEach items="${loaiphongs}" var="lp">
										<option value="${lp.id_lp }">${lp.tenloai }</option>
									</c:forEach>
								</select> <br />

								<hr>

								<div class="form-group">

									<button class="btn green"
										formaction="<c:url value='/seller/ql-phong/insert'/>">

										Create <i class="fa fa-plus"></i>

									</button>

									<button class="btn btn-warning"
										formaction="<c:url value='/seller/ql-phong/update'/>">
										Update <i class="fa fa-edit"></i>

									</button>

									<br /> <br />

									<button class="btn btn-danger"
										formaction="<c:url value='/seller/ql-phong/delete'/>">

										Delete <i class="fa fa-trash"></i>

									</button>

									<button class="btn btn-success"
										formaction="${pageContext.request.contextPath }/seller/ql-phong/reset">

										Reset <i class="fa fa-undo"></i>
									</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<div class="col-9">
					<div class="row">
						<div class="col-12 table-admin">
							<div class="table-admin-layer">
								<h3>Danh sách phòng</h3>
								<div>
									<input type="text"
										class="input-find input--border m-0 d-inline-block"
										placeholder="Nhập phòng cần tìm" name="keyword" id="keyword">
									<button class="btn button mt-2 px-3 py-1 btn-find"
										onClick="searchPhong()">Tìm</button>
									<button class="btn button mt-2 px-3 py-1 btn-find"
										onClick="showBoloc()">Bộ lọc</button>
									<h4></h4>
									<h4></h4>
									<div class="mb-5" id="boloc" style="display:none;">
										<h3 class="text-black h5  font-family-2">Lọc phòng
											theo</h3>
										<button class="btn button mt-2 px-3 py-1 btn-find"
											onClick="locPhong()">Lọc</button>
										<h4></h4>
										<div class="form-group">
											<div class="select-wrap">
												<span class="icon icon-keyboard_arrow_down"></span> <select
													onchange="LoadListings()" name="loaiphong" id="loaiphong"
													class="form-control px-3">
													<option value="0" selected>Loại phòng</option>
													<c:forEach items="${loaiphongs }" var="lp">
														<option value="${lp.id_lp }">${lp.tenloai }</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="form-group">
											<div class="select-wrap">
												<span class="icon icon-keyboard_arrow_down"></span> <select
													name="songuoi" id="songuoi" class="form-control px-3">
													<option value="0" selected>Số người ở</option>
													<option value="1">1 người</option>
													<option value="2">2 người</option>
													<option value="4">4 người</option>
													<option value="8">8 người</option>
													<option value="10">10 người</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<div class="select-wrap">
												<span class="icon icon-keyboard_arrow_down"></span> <select
													onchange="loadListingsByTinh()" name="tinh" id="city"
													class="form-control px-3">
													<option value="0" selected>Chọn tỉnh, thành phố</option>
													<c:forEach items="${tinhs }" var="tinh">
														<option value="${tinh.getMatinh() }">${tinh.getTentinh() }</option>
													</c:forEach>
												</select>
											</div>
										</div>

										<div class="form-group">
											<div class="select-wrap">
												<span class="icon icon-keyboard_arrow_down"></span> <select
													onchange="loadListingsByXa()" name="huyen" id="district"
													class="form-control px-3" disabled>
													<option value="0" selected>Chọn quận huyện</option>
												</select>
											</div>
										</div>

										<div class="form-group">
											<div class="select-wrap">
												<span class="icon icon-keyboard_arrow_down"></span> <select
													onchange="" name="xa" id="ward"
													class="form-control px-3" disabled>
													<option value="0" selected>Chọn phường xã</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="select-wrap">
								<span class="icon icon-keyboard_arrow_down"></span> 
								<select
									onchange="locPhong()" name="thutu" id="thutu"
									class="form-control px-3">
									<option value="0">Mặc định</option>
									<option value="1">Mới nhất</option>
									<option value="2">Cũ nhất</option>
									<option value="3">Giá từ thấp đến cao</option>
									<option value="4">Giá từ cao đến thấp</option>
									<option value="5">Đánh giá thấp đến cao</option>
									<option value="6">Đánh giá cao đến thấp</option>
								</select>
								<h4></h4>
							</div>
								<table class="table table-hover">
									<thead class="thead-dark">
										<tr>
											<th scope="col">Hình ảnh</th>
											<th scope="col">Tên phòng</th>
											<th scope="col">Giá</th>
											<th scope="col">Diện tích</th>
											<th scope="col">Địa chỉ</th>
											<th scope="col">Chủ phòng</th>
										</tr>
									</thead>
									<tbody id="load">
										<c:forEach items="${phongs}" var="phong">
											<tr class="phong">
												<td><a
													href="<c:url value="/seller/ql-phong/select?id_p=${phong.id_p }"/>">
														<c:url value="/hinhanh?fname=${phong.anhchinh}"
															var="hinhanh" /> <img height="120" width="160"
														src="${hinhanh}" />
												</a></td>
												<td>${phong.ten }</td>
												<td>${phong.gia}</td>
												<td>${phong.chieudai}*${phong.chieurong}</td>
												<td></td>
												<td></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>

						<div>
							<button onClick="loadMore()" class="btn btn-primary">Xem tiếp</button>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
/* 	function LoadListings() {
		var loaiphong = document.getElementById('loaiphong');
		var loaiphong_id = loaiphong.options[loaiphong.selectedIndex].value;
		
		var city = document.getElementById('city');
		var city_id = city.options[city.selectedIndex].value;

		var district = document.getElementById('district');
		var district_id = district.options[district.selectedIndex].value;
		
		var ward = document.getElementById('ward');
		var ward_id = ward.options[ward.selectedIndex].value;
		console.log(loaiphong_id);
		console.log(city_id);
		console.log(district_id);
		console.log(ward_id);
		document.myform.action = "#";
		myform.submit();
	} */
	
	function loadListingsByTinh(){
		console.log("oke");
		loadHuyen();
	}
	
	function loadListingsByXa(){
		loadXa();
	}
	
	function searchPhong() {
		/* tạo viên amount để Gọi và đếm classname là product */
		var resultSearch = document.getElementById('load')
		var thutu = document.getElementById('thutu').value;
		var keyword = document.getElementById('keyword').value;
		var loading = "<div class='spinner-border' role='status'><span class='visually-hidden'>Loading...</span></div>"
		resultSearch.innerHTML = loading;
		$.ajax({
			url : "/timphong/search", //send to Controller
			type : "post", //send it through get method
			data : {
				key : keyword,
				thutu: thutu
			},
			success : function(data) {
				resultSearch.innerHTML = data;
			}
		});
	};
	
	function locPhong() {
		/* tạo viên amount để Gọi và đếm classname là product */
		var resultSearch = document.getElementById('load')
		var keyword = document.getElementById('keyword').value;
		var lp = document.getElementById('loaiphong').value;
		var city = document.getElementById('city').value;
		var district = document.getElementById('district').value;
		var ward = document.getElementById('ward').value;
		var thutu = document.getElementById('thutu').value;
		var songuoi = document.getElementById('songuoi').value;
		var loading = "<div class='spinner-border' role='status'><span class='visually-hidden'>Loading...</span></div>"
		resultSearch.innerHTML = loading;
		$.ajax({
			url : "/timphong/loc", //send to Controller
			type : "post", //send it through get method
			data : {
				key: keyword,
				loaiphong: lp,
				tinh: city,
				huyen: district,
				xa: ward,
				thutu: thutu,
				songuoi: songuoi
			},
			success : function(data) {
				resultSearch.innerHTML = data;
			}
		});
	};
	
	
	function loadMore() {
		/* tạo viên amount để Gọi và đếm classname là product */
		var amount = document.getElementsByClassName("phong").length;
		var resultSearch = document.getElementById('load')
		var keyword = document.getElementById('keyword').value;
		var lp = document.getElementById('loaiphong').value;
		var city = document.getElementById('city').value;
		var district = document.getElementById('district').value;
		var ward = document.getElementById('ward').value;
		var thutu = document.getElementById('thutu').value;
/* 		var loading = document.getElementById('loading');
		loading.style.display="block"; */
		$.ajax({
			url : "/timphong/xemthem", //send to Controller
			type : "post", //send it through get method
			data : {
				exits : amount,
				key : keyword,
				loaiphong : lp,
				tinh : city,
				huyen : district,
				xa : ward,
				thutu: thutu
			},
			success : function(data) {
				$("#load").append(data);
			}
		});
/* 		loading.style.display="none"; */
	};
	function showBoloc() {
		var boloc = document.getElementById('boloc');
		boloc.style.display="block";
	}
</script>


