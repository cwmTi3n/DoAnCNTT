<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>

<div class="site-blocks-cover overlay"
	style="background-image: url(${url}images/hero_1.jpg);" data-aos="fade"
	id="home-section">


	<div class="container">
		<div class="row align-items-center justify-content-center">
			<div class="col-md-6 mt-lg-5 text-center">
				<h1>Tìm kiếm phòng</h1>

			</div>
		</div>
	</div>

	<a href="#listings-section" class="smoothscroll arrow-down"><span
		class="icon-arrow_downward"></span></a>
</div>


<div class="site-section" id="listings-section">
	<div class="container">

		<div class="row">
			<div class="col-md-3 order-1 order-md-2">
				<div class="mb-5">
						<h3 class="text-black mb-4 h5 font-family-2">Tìm kiếm</h3>
						<input type="text"
							class="input-find input--border m-0 d-inline-block"
							placeholder="Nhập phòng cần tìm" name="keyword" id="keyword">
						<button class="btn button mt-2 px-3 py-1 btn-find" onClick="searchPhong()">Tìm</button>
				</div>
				<div class="mb-5">
					<h3 class="text-black mb-4 h5 font-family-2">Lọc phòng theo</h3>
						<button class="btn button mt-2 px-3 py-1 btn-find" onClick="locPhong()">Lọc</button>
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
									name="songuoi" id="songuoi"
									class="form-control px-3">
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
									onchange="LoadListings()" name="xa" id="ward"
									class="form-control px-3" disabled>
									<option value="0" selected>Chọn phường xã</option>
								</select>
							</div>
						</div>
				<div class="mb-5">
					<h3 class="text-black mb-4 h5 font-family-2">Lọc theo giá
						phòng</h3>
					<div id="slider-range" class="border-primary"></div>
					<input type="text" name="gia" id="amount"
						class="form-control border-0 pl-0 bg-white" />
				</div>
				</div>

			</div>
			<div class="col-md-9 order-2 order-md-1">
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
				</div>
				<h4></h4>
				<div id="load" class="row large-gutters">
					<c:forEach items="${phongs }" var="phong">
						<div class="phong col-md-6 col-lg-4 mb-5 mb-lg-5 ">
							<div class="ftco-media-1">
								<div class="ftco-media-1-inner">
									<a href="<c:url value='/detail-phong?id_p=${phong.id_p}'/>"
										class="d-inline-block mb-4"> <img
										src="<c:url value="/hinhanh?fname=${phong.anhchinh}"/>"
										alt="Image" class="img-fluid">
									</a>
									<div class="ftco-media-details">
										<h3>${phong.ten }</h3>
										<p>${phong.mota }</p>
										<p>Đang có ${phong.quantam } người quan tâm đến phòng này</p>
										<p>${phong.getXa().getTenxa()},
											${phong.getXa().getHuyen().getTenhuyen()},
											${phong.getXa().getHuyen().getTinh().getTentinh()}</p>
										<strong>$${phong.gia }</strong>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<br>
				<button onClick="loadMore()" class="btn btn-primary">Xem
					tiếp</button>
			</div>
		</div>
	</div>
</div>
<!-- <div class="site-section" id="properties-section">
	<div class="container">
		<div class="row mb-5 align-items-center">
			<div class="col-md-7 text-left">
				<h2 class="section-title mb-3">More Properties</h2>
			</div>
			<div class="col-md-5 text-left text-md-right">
				<div class="custom-nav1">
					<a href="#" class="custom-prev1">Previous</a><span class="mx-3">/</span><a
						href="#" class="custom-next1">Next</a>
				</div>
			</div>
		</div>

		<div class="owl-carousel nonloop-block-13 mb-5">

			<div class="ftco-media-1">
				<div class="ftco-media-1-inner">
					<a href="property-single.html" class="d-inline-block mb-4"><img
						src="images/property_1.jpg" alt="Image" class="img-fluid"></a>
					<div class="ftco-media-details">
						<h3>HD17 19 Utica Ave.</h3>
						<p>New York - USA</p>
						<strong>$20,000,000</strong>
					</div>

				</div>
			</div>


			<div class="ftco-media-1">
				<div class="ftco-media-1-inner">
					<a href="property-single.html" class="d-inline-block mb-4"><img
						src="images/property_2.jpg" alt="Image" class="img-fluid"></a>
					<div class="ftco-media-details">
						<h3>HD17 19 Utica Ave.</h3>
						<p>New York - USA</p>
						<strong>$20,000,000</strong>
					</div>

				</div>
			</div>

			<div class="ftco-media-1">
				<div class="ftco-media-1-inner">
					<a href="property-single.html" class="d-inline-block mb-4"><img
						src="images/property_3.jpg" alt="Image" class="img-fluid"></a>
					<div class="ftco-media-details">
						<h3>HD17 19 Utica Ave.</h3>
						<p>New York - USA</p>
						<strong>$20,000,000</strong>
					</div>

				</div>
			</div>


			<div class="ftco-media-1">
				<div class="ftco-media-1-inner">
					<a href="property-single.html" class="d-inline-block mb-4"><img
						src="images/property_4.jpg" alt="Image" class="img-fluid"></a>
					<div class="ftco-media-details">
						<h3>HD17 19 Utica Ave.</h3>
						<p>New York - USA</p>
						<strong>$20,000,000</strong>
					</div>

				</div>
			</div>
		</div>

	</div>
</div>-->

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
		loadHuyen();
		LoadListings();
	}
	
	function loadListingsByXa(){
		loadXa();
		LoadListings();
	}
	
	function searchPhong() {
		/* tạo viên amount để Gọi và đếm classname là product */
		var resultSearch = document.getElementById('load')
		var thutu = document.getElementById('thutu').value;
		var keyword = document.getElementById('keyword').value;
		$.ajax({
			url : "/timphong/listings", //send to Controller
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
		$.ajax({
			url : "/timphong/listings", //send to Controller
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
		$.ajax({
			url : "/timphong/more", //send to Controller
			type : "get", //send it through get method
			data : {
				exits : amount,
				key : keyword,
				loaiphong : lp,
				tinh : city,
				huyen : district,
				xa : ward
			},
			success : function(data) {
				$("#load").append(data);
			}
		});
	};
</script>