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
	<h4></h4>
	<h4></h4>
	<div class="row">
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
								onClick="themPhong()">Thêm phòng</button>
							<h4></h4>
							<h4></h4>

						</div>
					</div>
					<div class="select-wrap">

						<div id="them-phong" style="display: none;">
										<form class="text-dark" action="/timphong/seller/ql-phong/insert" method="post"
				enctype="multipart/form-data">
				<div class="row flex-wrap">
					<div class="col-5">
						<div class="row">
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Tên: </label><input
									class="col-8 py-2 border-radius-12" type="text" name="ten">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Chiều
									dài: </label><input class="col-8 py-2 border-radius-12" type="text"
									name="chieudai">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Chiều
									rộng: </label><input class="col-8 py-2 border-radius-12" type="text"
									name="chieurong">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-5">Số
									người ở tối đa: </label> <span class="select-wrapper select--white"><select
									name="songuoi">
										<option value="1" selected>1 người</option>
										<option value="2">2 người</option>
										<option value="4">4 người</option>
										<option value="8">8 người</option>
										<option value="10">10 người</option>
								</select> </span>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Giá: </label><input
									class="col-8 py-2 border-radius-12" type="text" name="gia">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Địa
									chỉ: </label><input class="col-8 py-2 border-radius-12" type="text"
									name="dcchitiet">
							</div>

							<div class="col-12">
								<span class="select-wrapper select--dark mb-3 mr-3"> <select
									onchange="loadHuyen()" class="form-select form-select-sm"
									id="city" aria-label=".form-select-sm">
										<option value="0" selected>Chọn tỉnh, thành phố</option>
										<c:forEach items="${tinhs }" var="tinh">
											<option value="${tinh.getMatinh() }">${tinh.getTentinh() }</option>
										</c:forEach>
								</select>
								</span> <span class="select-wrapper select--dark mb-3 mr-3"> <select
									onchange="loadXa()" disabled class="form-select form-select-sm"
									id="district" aria-label=".form-select-sm">
										<option value="0" selected>Chọn quận huyện</option>
								</select></span><span class="select-wrapper select--dark mb-3"> <select
									disabled class="form-select form-select-sm" id="ward"
									aria-label=".form-select-sm" name="xa">
										<option value="0" selected>Chọn phường xã</option>
								</select></span>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Mô tả:
								</label>
								<textarea rows="4" cols="50" class="py-2 border-radius-12"
									name="mota"></textarea>
							</div>
						</div>
					</div>
					<div class="col-7">
						<div class="row">
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Loại
									phòng: </label> <span class="select-wrapper select--dark"> <select
									name="id_lp">
										<c:forEach items="${loaiphongs}" var="lp">
											<option value="${lp.id_lp }">${lp.tenloai }</option>
										</c:forEach>
								</select>
								</span>
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Hình
									ảnh chính: </label> <img height="180" width="240" id="previewImg1"
									class="img-thumbnail img--phong" src=""> <label
									class="ml-3 label-img" for="hinhanh1"><i
									class="bi bi-upload"></i> Upload</label> <input id="hinhanh1"
									type="file" hidden onchange="previewFile1(this);"
									name="hinhanh">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Hình
									ảnh phụ 1: </label><img id="previewImg2"
									class="img-thumbnail img--phong" src=""> <label
									class="ml-3 label-img" for="hinhanh2"><i
									class="bi bi-upload"></i> Upload</label> <input id="hinhanh2"
									type="file" hidden onchange="previewFile2(this);"
									name="hinhanh">
							</div>
							<div class="col-12 mb-3">
								<label class="label-info-admin__small pr-3 col-4">Hình
									ảnh phụ 2: </label><img height="180" width="240" id="previewImg3"
									class="img-thumbnail img--phong" src=""> <label
									class="ml-3 label-img" for="hinhanh3"><i
									class="bi bi-upload"></i> Upload</label> <input id="hinhanh3"
									type="file" hidden onchange="previewFile3(this);"
									name="hinhanh">
							</div>
						</div>
					</div>
					<div class="col-10 text-right my-4">
						<button class="btn btn-info" type="submit">Thêm</button>
						<a href=<c:url value="/admin/taikhoan?id_tk=${id_tk }"/>
							class="ml-3 d-inline-block text-white btn bg-danger">Quay lại</a>
					</div>
				</div>
			</form>
						</div>

						<span class="icon icon-keyboard_arrow_down"></span> <select
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
					<div>
						<table class="table table-hover">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Hình ảnh</th>
									<th scope="col">Tên phòng</th>
									<th scope="col">Giá</th>
									<th scope="col">Diện tích</th>
									<th scope="col">Địa chỉ</th>
									<th scope="col"></th>
									<th scope="col"></th>
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
										<td>${phong.getXa().getTenxa()},
											${phong.getXa().getHuyen().getTenhuyen()},
											${phong.getXa().getHuyen().getTinh().getTentinh()}</td>
										<td><a
											href="<c:url value="/seller/ql-phong/select?id_p=${phong.id_p }"/>"><button
													class="btn btn-success btn-sm rounded-0" type="button"
													data-toggle="tooltip" data-placement="top" title="Edit">
													<i class="fa fa-edit"></i>
												</button></a></td>
										<td><a
											href="<c:url value='/seller/ql-phong/delete?id_p=${phong.id_p }'/>"><button
													class="btn btn-danger btn-sm rounded-0" type="button"
													data-toggle="tooltip" data-placement="top" title="Delete">
													<i class="fa fa-trash"></i>
												</button></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div>
							<button onClick="loadMore()" class="btn btn-primary">Xem
								tiếp</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-3">
			<div class="mb-5">
				<h3 class="text-black h5  font-family-2">Lọc phòng theo</h3>
				<button class="btn button mt-2 px-3 py-1 btn-find"
					onClick="locPhong()">Lọc</button>
				<h4></h4>
				<div class="form-group">
					<div class="select-wrap">
						<span class="icon icon-keyboard_arrow_down"></span> <select
							onchange="LoadListings()" id="loaiphong"
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
							id="songuoi" class="form-control px-3">
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
							onchange="loadLocHuyen()" id="blcity"
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
							onchange="loadLocXa()" id="bldistrict"
							class="form-control px-3" disabled>
							<option value="0" selected>Chọn quận huyện</option>
						</select>
					</div>
				</div>

				<div class="form-group">
					<div class="select-wrap">
						<span class="icon icon-keyboard_arrow_down"></span> <select
							onchange="" id="blward" class="form-control px-3" disabled>
							<option value="0" selected>Chọn phường xã</option>
						</select>
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

	function loadListingsByTinh() {
		loadHuyen();
	}

	function loadListingsByXa() {
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
				thutu : thutu
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
		var city = document.getElementById('blcity').value;
		var district = document.getElementById('bldistrict').value;
		var ward = document.getElementById('blward').value;
		var thutu = document.getElementById('thutu').value;
		var songuoi = document.getElementById('songuoi').value;
		var loading = "<div class='spinner-border' role='status'><span class='visually-hidden'>Loading...</span></div>"
		resultSearch.innerHTML = loading;
		$.ajax({
			url : "/timphong/loc", //send to Controller
			type : "post", //send it through get method
			data : {
				key : keyword,
				loaiphong : lp,
				tinh : city,
				huyen : district,
				xa : ward,
				thutu : thutu,
				songuoi : songuoi
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
				thutu : thutu
			},
			success : function(data) {
				$("#load").append(data);
			}
		});
		/* 		loading.style.display="none"; */
	};

	function themPhong() {
		var them = document.getElementById('them-phong');
		if (them.style.display == "block") {
			them.style.display = "none";
		} else {
			them.style.display = "block";
		}

	};
	
	function loadLocHuyen() {
		var id_t = $('#blcity').find(":selected").val();
		var labelXa = "<option value='0' selected>Chọn phường xã</option>"
		var citis = document.getElementById("blcity");
		var districts = document.getElementById("bldistrict");
		var wards = document.getElementById("blward");
		console.log(id_t);
		if (id_t != 0) {
			districts.disabled = false;
			//wards.disabled = true;
			wards.innerHTML = labelXa;
			$.ajax({
				url: "/timphong/listhuyen", //send to Controller
				type: "get", //send it through get method
				data: {
					exits: id_t
				},
				success: function(data) {
					/* 					removeData(districts);
					 removeData(ward);
					 $("#district").append(data); */

					districts.innerHTML = data;
				}
			});
		} else {
			districts.disabled = true;
			wards.disabled = true;

			districts.value = 0;
			wards.value = 0;
		}

	};

	function loadLocXa() {
		var id_h = $('#bldistrict').find(":selected").val();

		var citis = document.getElementById("blcity");
		var districts = document.getElementById("bldistrict");
		var wards = document.getElementById("blward");

		if (id_h != 0) {
			wards.disabled = false;
			$.ajax({
				url: "/timphong/listxa", //send to Controller
				type: "get", //send it through get method
				data: {
					exits: id_h
				},
				success: function(data) {
					/* 					removeData(wards);
					 $("#ward").append(data); */
					wards.innerHTML = data;
				}
			});
		} else {
			wards.disabled = true;
			wards.value = 0;
		}
	};
	
	function previewFile1(input) {
		var file = $("#hinhanh1").get(0).files[0];
		if (file) {
			var reader = new FileReader();

			reader.onload = function() {
				$("#previewImg1").attr("src", reader.result);
			}
			reader.readAsDataURL(file);
		}
	}
	function previewFile2(input) {
		var file = $("#hinhanh2").get(0).files[0];
		if (file) {
			var reader = new FileReader();

			reader.onload = function() {
				$("#previewImg2").attr("src", reader.result);
			}
			reader.readAsDataURL(file);
		}
	}
	function previewFile3(input) {
		var file = $("#hinhanh3").get(0).files[0];
		if (file) {
			var reader = new FileReader();

			reader.onload = function() {
				$("#previewImg3").attr("src", reader.result);
			}
			reader.readAsDataURL(file);
		}
	}
</script>


