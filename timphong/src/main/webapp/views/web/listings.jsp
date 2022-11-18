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
				<h1>Property Listings</h1>
				<p class="mb-5">Tìm kiếm và cho thuê căn hộ, văn phòng một cách
					nhanh chóng.</p>

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
					<form action="#" method="post">
						<h3 class="text-black mb-4 h5 font-family-2">Tìm kiếm</h3>
						<input type="text"
							class="input-find input--border m-0 d-inline-block"
							placeholder="Nhập phòng cần tìm">
						<button class="btn button mt-2 px-3 py-1 btn-find" type="submit">Tìm</button>
					</form>
				</div>
				<div class="mb-5">
					<h3 class="text-black mb-4 h5 font-family-2">Lọc phòng theo</h3>
					<form name="myform" action="#" method="post">
						<div class="form-group">
							<div class="select-wrap">
								<span class="icon icon-keyboard_arrow_down"></span> <select
									onchange="Show()" name="agent" id="agent"
									class="form-control px-3">
									<option value="1">Loại</option>
									<option value="2">Xu hướng</option>
									<option value="3">Đánh giá</option>
									<option value="4">Xã</option>
									<option value="5">Huyện</option>
									<option value="6">Tỉnh</option>
								</select>
							</div>
						</div>
					</form>
				</div>

				<div class="mb-5">
					<h3 class="text-black mb-4 h5 font-family-2">Lọc theo giá
						phòng</h3>
					<div id="slider-range" class="border-primary"></div>
					<input type="text" name="text" id="amount"
						class="form-control border-0 pl-0 bg-white" />
				</div>
			</div>
			<div class="col-md-9 order-2 order-md-1">

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
		<div class="row mt-4">
			<div class="col-md-9">
				<div class="custom-pagination text-center">
					<span>1</span> <a href="#">2</a> <a href="#">3</a> <span
						class="more-page">...</span> <a href="#">7</a>
				</div>

			</div>
		</div>
	</div>
</div>
<div class="site-section" id="properties-section">
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
</div>

<script>
	function SetData() {
		var select = document.getElementById('agent');
		var agent_id = select.options[select.selectedIndex].value;
		document.myform.action = "#";
		myform.submit();
	}

	function Show() {
		var select = document.getElementById('agent');
		var agent_id = select.options[select.selectedIndex].value;
		console.log(agent_id);
		document.myform.action = "load";
		myform.submit();
	}
</script>