<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div>
	<div>
		<c:url value="/hinhanh?fname=${phong.hinhanh}" var="anh"/>
		<img height="auto" width="50%" src="${anh }" >
	</div>
	<div>
		<h2>Chinh sua phong</h2>
	    <form action="phong" method="post" enctype="multipart/form-data">
	    	<label>Id: </label><input type="text" name="id_p" value="${phong.id_p }"><br/>
	        <label>Tên: </label><input type="text" name="ten" value="${phong.ten }"><br/>
	        <label>Trạng thái: </label>
 	       		<select name="trangthai">
	       			<c:if test='${phong.trangthai == 1 }'>
						<option value="1">Hiện</option>
						<option value="2">Ẩn</option>
					</c:if>
					<c:if test='${phong.trangthai != 1 }'>
						<option value="2">Ẩn</option>
						<option value="1">Hiện</option>
					</c:if>
				</select>
	        <br/>
	        <label>Hình ảnh: </label><input type="file" name="hinhanh"><br/>
	        <label>Chiều dài: </label><input type="text" name="chieudai" value="${phong.chieudai }"><br/>
	        <label>Chiều rộng: </label><input type="text" name="chieurong" value="${phong.chieurong }"><br/>
	        <label>Giá: </label><input type="text" name="gia" value="${phong.gia }"><br/>
	        <label>Yêu thích: </label><input type="text" name="yeuthich" value="${phong.yeuthich }"><br/>
	        <label>Địa chỉ chi tiết: </label><input type="text" name="dcchitiet" value="${phong.dcchitiet }"><br/>
	        <label>Mô tả: </label><input type="text" name="mota" value="${phong.mota }"><br/>
	        
	        <label>Loại phòng: </label> 
		        <select name="id_lp">
		        	<option value="${phong.loaiphong.id_lp }">${phong.loaiphong.tenloai }</option>
		        	<c:forEach items="${loaiphongs}" var="lp">
						<option value="${lp.id_lp }">${lp.tenloai }</option>
					</c:forEach>
				</select>
	        <br/><label>Chủ phòng: </label><input type="text" name="id_tk" value="${phong.id_tk }"><br/>
	        <button type="submit">Chỉnh sửa</button>
	    </form>
	</div>
</div>

    
