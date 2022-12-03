<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>



<div class="site-block-wrap">
	<div class="owl-carousel with-dots">
		<div class="site-blocks-cover overlay overlay-2"
			style="background-image: url(${url}images/hero_1.jpg);"
			data-aos="fade" id="home-section">

			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-md-6 mt-lg-5 text-center">
						<h1 class="text-shadow">Buy &amp; Sell Property Here</h1>
						<br>
						<!-- <p class="mb-5 text-shadow">Free website template for Real Estate websites by the fine folks at <a href="https://free-template.co/" target="_blank">Free-Template.co</a>  </p> -->
						<p>
							<c:if test="${sessionScope.account == null}">
								<a href="<c:url value='/login'/>"
									class="btn btn-primary px-5 py-3">Đăng nhập</a>
							</c:if>
							<c:if test="${sessionScope.account != null}">
								<a href="<c:url value='/listings'/>"
									class="btn btn-primary px-5 py-3">Tìm kiếm</a>
							</c:if>
						</p>

					</div>
				</div>
			</div>
		</div>

		<div class="site-blocks-cover overlay overlay-2"
			style="background-image: url(${url}images/hero_2.jpg);"
			data-aos="fade" id="home-section">
			<div class="container">
				<div class="row align-items-center justify-content-center">
					<div class="col-md-6 mt-lg-5 text-center">
						<h1 class="text-shadow">Find Your Perfect Property For Your
							Home</h1>
						<br>
						<!-- <p class="mb-5 text-shadow">Free website template for Real Estate websites by the fine folks at <a href="https://free-template.co/" target="_blank">Free-Template.co</a>  </p> -->
						<p>
							<c:if test="${sessionScope.account == null}">
								<a href="<c:url value='/login'/>"
									class="btn btn-primary px-5 py-3">Đăng nhập</a>
							</c:if>
							<c:if test="${sessionScope.account != null}">
								<a href="<c:url value='/listings'/>"
									class="btn btn-primary px-5 py-3">Tìm kiếm</a>
							</c:if>
						</p>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="site-section" id="properties-section">
	<div class="container">
		<div id="load" class="row large-gutters">
			<c:forEach items="${phongs }" var="phong">
				<div class="phong col-md-6 col-lg-4 mb-5 mb-lg-5 ">
					<div class="ftco-media-1">
						<div class="ftco-media-1-inner">
							<a href="<c:url value='/detail-phong?id_p=${phong.id_p}'/>"
								class="d-inline-block mb-4"> <img
								src="<c:url value="/hinhanh?fname=${phong.anhchinh}"/>"
								alt="Image" class="img-fluid">
								<div class="ftco-media-details text-dark">
									<h3 class="mt-3 mb-1" style="font-weight: 400!important">${phong.ten }</h3>
									<p>Loại phòng: ${phong.getLoaiphong().getTenloai() }</p>
									<strong>Giá: ${phong.gia } VNĐ</strong>
									<p class="pr-3">Địa chỉ: ${phong.getXa().getTenxa()},
										${phong.getXa().getHuyen().getTenhuyen()},
										${phong.getXa().getHuyen().getTinh().getTentinh()}</p>
									<p>Số người ở tối đa: ${phong.getSonguoi() }</p>
									<p>Đánh giá: ${phong.getDanhgia() }</p>
								</div>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<br>
		<div class="spinner-border" role="status" style="display:none" id="loading">
  			<span class="visually-hidden">Loading...</span>
		</div>
		<button onClick="loadMore()" class="btn btn-primary">Xem tiếp</button>
	</div>
</div>


<script>
	function loadMore() {
		/* tạo viên amount để Gọi và đếm classname là product */
		var amount = document.getElementsByClassName("phong").length;
		var loading = document.getElementById('loading');
		loading.style.display="block";
		$.ajax({
			url : "/timphong/more", //send to Controller
			type : "get", //send it through get method
			data : {
				exits : amount
			},
			success : function(data) {
				$("#load").append(data);
			}
		});
		loading.style.display="none";
	};
</script>