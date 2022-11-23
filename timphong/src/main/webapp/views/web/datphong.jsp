<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/templates/" var="url"></c:url>

<div class="site-section site-section-phong">
	<div class="container">
		<div class="row">
			<div class="col-lg-7">
				<div class=" border-bottom my-4">
					<h3 class="text-black mb-4">Thông tin đặt phòng</h3>
					<div class="d-flex day-travel my-2">
						<div>
							<h5 class="text-black mb-2">Ngày đi</h5>
							<p class="text-black">
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<fmt:formatDate type="date" value="${now}" />
							</p>
						</div>
						<div>
							<button onClick="test();">Chỉnh sửa</button>
						</div>
					</div>
					<div class="d-flex day-travel my-2">
						<div>
							<h5 class="text-black mb-2">Tên người đặt</h5>
							<p class="text-black">${user.getHo() }
								${user.getTen() }</p>
						</div>
						<div>
							<button onClick="test();">Chỉnh sửa</button>
						</div>
					</div>
					<div class="d-flex day-travel my-2">
						<div>
							<h5 class="text-black mb-2">Số điện thoại</h5>
							<p class="text-black">${user.getSdt() }</p>
						</div>
						<div>
							<button onClick="test();">Chỉnh sửa</button>
						</div>
					</div>
				</div>

				<div class=" border-bottom my-4">
					<h3 class="text-black mb-4">Chính sách hủy đặt phòng</h3>
					<p class="font-weight-bold text-black">Bạn được hủy 1 tuần trước ngày đặt hẹn.</p>
					<p class="text-black">Đặt phòng/đặt chỗ của bạn sẽ không được xác nhận cho đến khi
						chủ nhà/người tổ chức chấp nhận yêu cầu của bạn (trong vòng 24
						giờ).</p>
				</div>

				<div class="my-4">
					<p style="font-size: 0.8rem;">Bằng việc chọn nút bên dưới, tôi đồng ý với Nội quy nhà của
						Chủ nhà, Chính sách đặt lại FindRoom, và đồng ý rằng FindRoom có
						thể tính phí vào phương thức thanh toán của tôi nếu tôi phải chịu
						trách nhiệm về thiệt hại.</p>
				</div>
			</div>
			<div class="col-lg-5 pl-lg-5 ml-auto">
				<div class="owl-carousel slide-one-item with-dots">
					<div>
						<img src="<c:url value="/hinhanh?fname=${phong.anhchinh}"/>"
							alt="Image" class="img-fluid">
					</div>
				</div>
				<div class="mb-5">
					<h3 class="text-black mb-4">${phong.ten }</h3>
					<p>Diện tích: ${phong.chieudai } * ${phong.chieurong }</p>
					<p>Địa chỉ: ${phong.getXa().getTenxa()},
						${phong.getXa().getHuyen().getTenhuyen()},
						${phong.getXa().getHuyen().getTinh().getTentinh()}</p>
				</div>

				<div class="mb-5">

					<div class="mt-5">
						<img src="${url }images/person_1.jpg" alt="Image"
							class="w-25 mb-3 rounded-circle">
						<h4 class="text-black">${phong.getTaikhoan().getTen() }</h4>
						<p class="text-muted mb-4">Nhà phân phối căn hộ</p>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>
<script>
	function test() {
		console.log("hello");
	}
</script>