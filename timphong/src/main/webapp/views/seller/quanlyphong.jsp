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

   <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(${url}images/hero_1.jpg);" data-aos="fade">
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-5 mx-auto mt-lg-5 text-center">
            <h1>HD17 19 Utica Ave, New York, USA</h1>
            <p class="mb-5"><strong class="text-white">$2,000,000</strong></p>
            
          </div>
        </div>
      </div>

      <a href="#ds-phong" class="smoothscroll arrow-down"><span class="icon-arrow_downward"></span></a>
    </div>
<div class="page-content-wrapper" id="ds-phong">

	<div class="page-content">

		<div class="row">

			<div class="col-md-12">

				<!-- BEGIN EXAMPLE TABLE PORTLET-->

				<div class="portlet box grey-cascade">

					<div class="portlet-body">

						<div class="table-toolbar">

							<!-- Hiển thị thông báo -->

<%-- 							<%@include file="/common/info.jsp"%>
 --%>
							<!-- Kết thúc hiển thị thông báo -->

							<div class="row">

								<div class="col-md-3">

									<div class="row">

										<div class="col-lg-12">

											<form action="#" method="post" enctype="multipart/form-data">
															<div>
					<input type="text" name="id_p"
					value="${phong.id_p }" hidden>
					<label>Hình ảnh chính: </label>
					<c:url value="/hinhanh?fname=${phong.anhchinh==null?'abc':phong.anhchinh}" var="anh" />
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
					<label>Hình ảnh phụ: </label><input type="file" name="hinhanh"><br />
					<label>Hình ảnh phụ: </label><input type="file" name="hinhanh"><br />
				</c:if>
				<c:if test="${phong.getHinhanhs().size() < 2 && phong!=null }">
					<button>
						<a href="<c:url value='/admin/them-anh-phong?id_p=${phong.id_p}'/>">Thêm Ảnh</a>
					</button>
					<br />
				</c:if>
				<label>Tên: </label><input type="text" name="ten" value="${phong.ten }"> <br>
				 <label>Chiều dài: </label><input type="text" name="chieudai"
					value="${phong.chieudai }"><br>
				 <label>Chiều
					rộng: </label><input type="text" name="chieurong"
					value="${phong.chieurong }"> <br>
				<label>Giá: </label><input
					type="text" name="gia" value="${phong.gia }"><br>
				<label>Địa chỉ
					chi tiết: </label><input type="text" name="dcchitiet"
					value="${phong.dcchitiet }"><br />
					
								<div class="col-md-auto">
				<select onchange="loadHuyen()"
					class="form-select form-select-sm mb-3" id="city"
					aria-label=".form-select-sm">
					<c:if test="${phong == null }">
						<option value="0" selected>Chọn tỉnh thành phố</option>
					</c:if>
					<option value="${phong.getXa().getHuyen().matinh}">${phong.getXa().getHuyen().getTinh().tentinh }</option>
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
				</select> 
				<select disabled class="form-select form-select-sm" id="ward"
					aria-label=".form-select-sm" name="xa">
					<option value="${phong.maxa }" selected>${phong.getXa().tenxa }</option>
				</select>
			</div>
					
					 <label>Mô tả: </label><input
					type="text" name="mota" value="${phong.mota }"><br /> <label>Loại
					phòng: </label> <select name="id_lp">
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

													<button class="btn btn-warning" formaction="<c:url value='/seller/ql-phong/update'/>"> Update <i class="fa fa-edit"></i>

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

								<div class="col-md-6">

									<div class="row">

	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">STT</th>
				<th scope="col">Hình ảnh</th>
				<th scope="col">Tên phòng</th>
				<th scope="col">Giá</th>
				<th scope="col">Diện tích</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${phongs}" var="phong" varStatus="STT">
				<tr>
					<th scope="row">${STT.index+1}</th>
					<td><a
						href="<c:url value="/seller/ql-phong/select?id_p=${phong.id_p }"/>">
							<c:url value="/hinhanh?fname=${phong.anhchinh}" var="hinhanh" />
							<img height="120" width="160" src="${hinhanh}" />
					</a></td>
					<td>${phong.ten }</td>
					<td>${phong.gia}</td>
					<td>${phong.chieudai}*${phong.chieurong}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>



									</div>

								</div>

							</div>

						</div>





					</div>

				</div>

				<!-- END EXAMPLE TABLE PORTLET-->

			</div>

		</div>

	</div>

</div>

