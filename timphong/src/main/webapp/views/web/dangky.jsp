<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tìm Phòng Trọ</title>
    </head>
    <body>
        <div id="dangky-tk">
            <form action="/timphongtro/dangky" method="post">
                <input type="text" name="taikhoan" placeholder="Tài khoản"><br/>
                <input type="text" name="matkhau" placeholder="Mật khẩu"><br/>
                <input type="text" name="mail_sdt" placeholder="Mail hoặc Số điện thoại"><br/>
                <button type="submit">Đăng ký</button><br/>
                <p>${mess}</p><br/>
                <a href="/timphongtro/dangnhap">Đăng nhập</a>
            </form>
        </div>
    </body>
</html>