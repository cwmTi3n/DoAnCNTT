<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>


<div class="site-section site-section-phong" id="property-details">
	<div class="container">
		<div class="row">
			<div class="col-lg-7">
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
					
					<div>
						<img src="${url }images/property_2.jpg" alt="Image"
							class="img-fluid">
					</div>
					<div>
						<img src="${url }images/property_3.jpg" alt="Image"
							class="img-fluid">
					</div>
				</div>
			</div>
			<div class="col-lg-5 pl-lg-5 ml-auto">
				<div class="mb-5">
					<h3 class="text-black mb-4">${phong.ten }</h3>
					<p>Diện tích: ${phong.chieudai } * ${phong.chieurong }</p>
					<p>Địa chỉ: ${phong.getXa().getTenxa()},
						${phong.getXa().getHuyen().getTenhuyen()},
						${phong.getXa().getHuyen().getTinh().getTentinh()}</p>
					<p>${phong.getMoTa() }</p>
					<p>
						<a href="#" class="btn btn-primary">Đặt phòng</a>
					</p>
				</div>

				<div class="mb-5">

					<div class="mt-5">
						<img src="${url }images/person_1.jpg" alt="Image"
							class="w-25 mb-3 rounded-circle">
						<h4 class="text-black">Tên chủ phòng</h4>
						<p class="text-muted mb-4">Nhà phân phối căn hộ</p>
						<p>Hi vọng các bạn tìm được căn hộ mong muốn, Best wish!</p>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>