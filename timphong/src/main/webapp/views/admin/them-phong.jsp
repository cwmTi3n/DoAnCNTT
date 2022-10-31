<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
<div>
    <form action="them-phong" method="post" enctype="multipart/form-data">
        <label>Tên: </label><input type="text" name="ten"><br/>
        <label>Trạng thái: </label><input type="text" name="trangthai"><br/>
        <label>Hình ảnh: </label><input type="file" name="hinhanh"><br/>
        <label>Chiều dài: </label><input type="text" name="chieudai"><br/>
        <label>Chiều rộng: </label><input type="text" name="chieurong"><br/>
        <label>Giá: </label><input type="text" name="gia"><br/>
        <label>Yêu thích: </label><input type="text" name="yeuthich"><br/>
        <label>Địa chỉ chi tiết: </label><input type="text" name="dcchitiet"><br/>
        <label>Mô tả: </label><input type="text" name="mota"><br/>
        <label>Loại phòng: </label><input type="text" name="id_lp"><br/>
        <label>Chủ phòng: </label><input type="text" name="id_tk" value="${id_tk }"><br/>
        <button type="submit">Thêm</button>
    </form>
</div>

    
