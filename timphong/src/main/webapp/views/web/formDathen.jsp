<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>

<h1 id="id_p" style="display: none;">${phong.id_p }</h1>
<!-- Cần cách xử lý khác -->
<div class="site-section site-section-phong" id="property-details">
	<div class="container">
		<div class="row">
			<div class="col-lg-7">
				<div class=" border-bottom my-4">
					<h3 class="text-black mb-4">Thông tin đặt phòng</h3>
					<form action="dathen/dat" method="post">
						<input type="password" value="${phong.id_p }" hidden name="id_p">
						<input type="password" value="${dathen.id_dh }" hidden name="id_dh">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<h5 class="text-black mb-2">Tên người đặt</h5>
									<span class="form-label"></span> <input readonly class="form-control"
										type="text" placeholder="Enter your name"
										value="${sessionScope.account.ho } ${sessionScope.account.ten }">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<h5 class="text-black mb-2">Số điện thoại</h5>
									<span class="form-label"></span> <input readonly class="form-control"
										type="tel" placeholder="Enter your phone number"
										value="${sessionScope.account.getSdt() }">
								</div>
							</div>
						</div>
						<div class="form-group">
							<h5 class="text-black mb-2">Email</h5>
							<span class="form-label"></span> <input readonly class="form-control"
								type="email" placeholder="Enter your email"
								value="${sessionScope.account.getEmail() }">
						</div>
						<div class="row">
							<div class="col-sm-5">
								<div class="form-group">
									<h5 class="text-black mb-2">Ngày đi</h5>
									<span class="form-label"></span> <input class="form-control"
										type="date" required name="ngay" value="${dathen.ngay }">
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<h5 class="text-black mb-2">Giờ</h5>
									<span class="select-wrapper select--white"> <select style="padding-top:7px;padding-bottom:7px;"
										name="gio">
											<option value="${dathen.gio}" selected>${dathen.gio}</option>
											<c:forEach begin="1" end="24" var="i">
												<option value="${i}">${i}</option>
											</c:forEach>
									</select>
									</span>
								</div>
							</div>
							<div class="form-btn">
								<button class="btn btn-dark btn-save-profile" style="margin-top: 32px">Đặt hen</button>
							</div>
						</div>
					</form>
				</div>
				<div class=" border-bottom my-4">
					<h3 class="text-black mb-4">Chính sách hủy đặt phòng</h3>
					<p class="font-weight-bold text-black">Bạn được hủy 1 tuần
						trước ngày đặt hẹn.</p>
					<p class="text-black">Đặt phòng/đặt chỗ của bạn sẽ không được
						xác nhận cho đến khi chủ nhà/người tổ chức chấp nhận yêu cầu của
						bạn (trong vòng 24 giờ).</p>
				</div>

				<div class="my-4">
					<p style="font-size: 0.8rem;">Bằng việc chọn nút bên dưới, tôi
						đồng ý với Nội quy nhà của Chủ nhà, Chính sách đặt lại FindRoom,
						và đồng ý rằng FindRoom có thể tính phí vào phương thức thanh toán
						của tôi nếu tôi phải chịu trách nhiệm về thiệt hại.</p>
				</div>
			</div>
			<div class="col-lg-5 pl-lg-5 ml-auto">
				<div class="owl-carousel slide-one-item with-dots">
					<div>
						<img src="<c:url value="/hinhanh?fname=${phong.anhchinh}"/>"
							alt="Image" class="img-fluid">
					</div>
					<c:forEach items="${phong.getHinhanhs() }" var="hinhanh">
						<div>
							<img src="<c:url value="/hinhanh?fname=${hinhanh.hinhanh}"/>"
								alt="Image" class="img-fluid">
						</div>
					</c:forEach>
				</div>
				<div class="mb-5 text-dark">
					<h2 class="text-black my-4">${phong.ten }</h2>
					<p>Loại phòng: ${phong.getLoaiphong().getTenloai()}</p>
					<p>Diện tích: ${phong.chieudai } * ${phong.chieurong }</p>
					<p>Địa chỉ: ${phong.getXa().getTenxa()},
						${phong.getXa().getHuyen().getTenhuyen()},
						${phong.getXa().getHuyen().getTinh().getTentinh()}</p>
					<p>Mô tả chi tiết: ${phong.mota }</p>
					<p>Số người có thể ở tối đa: ${phong.getSonguoi()}</p>
				</div>
			</div>
		</div>
	</div>
</div>

<style id="" media="all">/* cyrillic-ext */
@font-face {
	font-family: 'Montserrat';
	font-style: normal;
	font-weight: 400;
	font-display: swap;
	src:
		url(/fonts.gstatic.com/s/montserrat/v25/JTUSjIg1_i6t8kCHKm459WRhyzbi.woff2)
		format('woff2');
	unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF,
		U+A640-A69F, U+FE2E-FE2F;
}
/* cyrillic */
@font-face {
	font-family: 'Montserrat';
	font-style: normal;
	font-weight: 400;
	font-display: swap;
	src:
		url(/fonts.gstatic.com/s/montserrat/v25/JTUSjIg1_i6t8kCHKm459W1hyzbi.woff2)
		format('woff2');
	unicode-range: U+0301, U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
}
/* vietnamese */
@font-face {
	font-family: 'Montserrat';
	font-style: normal;
	font-weight: 400;
	font-display: swap;
	src:
		url(/fonts.gstatic.com/s/montserrat/v25/JTUSjIg1_i6t8kCHKm459WZhyzbi.woff2)
		format('woff2');
	unicode-range: U+0102-0103, U+0110-0111, U+0128-0129, U+0168-0169,
		U+01A0-01A1, U+01AF-01B0, U+1EA0-1EF9, U+20AB;
}
/* latin-ext */
@font-face {
	font-family: 'Montserrat';
	font-style: normal;
	font-weight: 400;
	font-display: swap;
	src:
		url(/fonts.gstatic.com/s/montserrat/v25/JTUSjIg1_i6t8kCHKm459Wdhyzbi.woff2)
		format('woff2');
	unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB,
		U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
}
/* latin */
@font-face {
	font-family: 'Montserrat';
	font-style: normal;
	font-weight: 400;
	font-display: swap;
	src:
		url(/fonts.gstatic.com/s/montserrat/v25/JTUSjIg1_i6t8kCHKm459Wlhyw.woff2)
		format('woff2');
	unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6,
		U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193,
		U+2212, U+2215, U+FEFF, U+FFFD;
}
/* cyrillic-ext */
@font-face {
	font-family: 'Montserrat';
	font-style: normal;
	font-weight: 700;
	font-display: swap;
	src:
		url(/fonts.gstatic.com/s/montserrat/v25/JTUSjIg1_i6t8kCHKm459WRhyzbi.woff2)
		format('woff2');
	unicode-range: U+0460-052F, U+1C80-1C88, U+20B4, U+2DE0-2DFF,
		U+A640-A69F, U+FE2E-FE2F;
}
/* cyrillic */
@font-face {
	font-family: 'Montserrat';
	font-style: normal;
	font-weight: 700;
	font-display: swap;
	src:
		url(/fonts.gstatic.com/s/montserrat/v25/JTUSjIg1_i6t8kCHKm459W1hyzbi.woff2)
		format('woff2');
	unicode-range: U+0301, U+0400-045F, U+0490-0491, U+04B0-04B1, U+2116;
}
/* vietnamese */
@font-face {
	font-family: 'Montserrat';
	font-style: normal;
	font-weight: 700;
	font-display: swap;
	src:
		url(/fonts.gstatic.com/s/montserrat/v25/JTUSjIg1_i6t8kCHKm459WZhyzbi.woff2)
		format('woff2');
	unicode-range: U+0102-0103, U+0110-0111, U+0128-0129, U+0168-0169,
		U+01A0-01A1, U+01AF-01B0, U+1EA0-1EF9, U+20AB;
}
/* latin-ext */
@font-face {
	font-family: 'Montserrat';
	font-style: normal;
	font-weight: 700;
	font-display: swap;
	src:
		url(/fonts.gstatic.com/s/montserrat/v25/JTUSjIg1_i6t8kCHKm459Wdhyzbi.woff2)
		format('woff2');
	unicode-range: U+0100-024F, U+0259, U+1E00-1EFF, U+2020, U+20A0-20AB,
		U+20AD-20CF, U+2113, U+2C60-2C7F, U+A720-A7FF;
}
/* latin */
@font-face {
	font-family: 'Montserrat';
	font-style: normal;
	font-weight: 700;
	font-display: swap;
	src:
		url(/fonts.gstatic.com/s/montserrat/v25/JTUSjIg1_i6t8kCHKm459Wlhyw.woff2)
		format('woff2');
	unicode-range: U+0000-00FF, U+0131, U+0152-0153, U+02BB-02BC, U+02C6,
		U+02DA, U+02DC, U+2000-206F, U+2074, U+20AC, U+2122, U+2191, U+2193,
		U+2212, U+2215, U+FEFF, U+FFFD;
}
</style>

<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

<link type="text/css" rel="stylesheet" href="css/style.css" />


<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-23581568-13');
</script>
<script defer
	src="https://static.cloudflareinsights.com/beacon.min.js/vaafb692b2aea4879b33c060e79fe94621666317369993"
	integrity="sha512-0ahDYl866UMhKuYcW078ScMalXqtFJggm7TmlUtp0UlD4eQk0Ixfnm5ykXKvGJNFjLMoortdseTfsRT8oCfgGA=="
	data-cf-beacon='{"rayId":"76f0adf458726bd6","token":"cd0b4b3a733644fc843ef0b185f98241","version":"2022.11.3","si":100}'
	crossorigin="anonymous"></script>