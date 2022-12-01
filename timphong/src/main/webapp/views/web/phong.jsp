<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>

<style>
	.rating {
	display: flex;
	}
	
	.rating>label {
	position: relative;
	line-height: 0.8 !important;
	width: 0.8em;
	font-size: 20px;
	font-weight: 100;
	color: #FFD600;
	}
	
	.rating>label::before {
	content: "\2605";
	position: absolute;
	opacity: 0
	}
	
	.rating>label:before,
	.rating>label:before {
	opacity: 1 !important
	}
</style>




<h1 id="id_p" style="display:none;">${phong.id_p }</h1> <!-- Cần cách xử lý khác -->
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
				</div>
				<h4></h4>
				<h3>Đánh giá</h3>
					<c:forEach items="${danhgias }" var="dg">
						<div>
							<h6>Người đánh giá: ${dg.taikhoan.ho } ${dg.taikhoan.ten }</h6>
							<p>Ngày: ${dg.ngay }</p>
							<div class="rating">
								<c:forEach begin='1' end='${dg.sosao }'>
                					<label>☆</label>
								</c:forEach> 
                			</div> 
							<p>Nội dung: ${dg.noidung }<p><hr/>
						</div>
					</c:forEach>
			</div>
			<div class="col-lg-5 pl-lg-5 ml-auto">
				<div class="mb-5">
					<h3 class="text-black mb-4">${phong.ten }</h3>
					<p>Diện tích: ${phong.chieudai } * ${phong.chieurong }</p>
					<p>Địa chỉ: ${phong.getXa().getTenxa()},
						${phong.getXa().getHuyen().getTenhuyen()},
						${phong.getXa().getHuyen().getTinh().getTentinh()}</p>
					<p>${phong.mota }</p>
					<p>Đang có ${phong.quantam } người quan tâm đến phòng này</p>
					<p>
						<a href="<c:url value='/dathen?id_p=${phong.id_p }'/>" class="btn btn-primary">Đặt hẹn ngay</a>
					</p>
						<button onClick="luuPhong()" class="btn btn-primary">Lưu phòng</button>
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
<script>
	function luuPhong() {
		var id_p = document.getElementById('id_p').innerHTML;
		$.ajax({
			url : "/timphong/listdathen/luu", //send to Controller
			type : "post", //send it through get method
			data : {
				id_p : id_p
			},
			success : function(data) {
			}
		});
	};
	
	
	$(document).ready(function() {
		  $('#rateMe2').mdbRate();
		});
</script>