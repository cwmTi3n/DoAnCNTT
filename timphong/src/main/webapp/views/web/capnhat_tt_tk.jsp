<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tìm Phòng Trọ</title>
    </head>
    <body>
        <div id="capnhat-tt-tk">
            <form action="/timphongtro/capnhat-tt" method="post">
            	<input name="taikhoan" type="text" value="${taikhoan}" hidden="">
                <input name="ho" type="text" placeholder="Họ"><br/>
                <input name="ten" type="text" placeholder="Tên"><br/>
                <input name="sdt" type="text" placeholder="Số điện thoại"><br/>
                <input name="cmnd" type="text" placeholder="Số chứng minh"><br/>
                <button type="submit">Đăng ký</button>
            </form>
        </div>
    </body>
</html>