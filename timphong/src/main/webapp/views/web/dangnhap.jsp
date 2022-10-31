<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tìm Phòng Trọ</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="./assets/css/main.css">
    </head>
    <body>
        <div id="login">
            <h2>Đăng nhập</h2>
            <form id="form-login" action="/timphongtro/dangnhap" method="post">
                <input type="text" name="taikhoan" value="${taikhoan}" placeholder="Username"><br/>
                <input type="password" name="matkhau" value="${matkhau}" placeholder="Password"><br/>
                <input id="cbx" type="checkbox" name="remember"><label>Ghi nhớ</label><br/>
                <button id="btn-submit" type="submit">Đăng nhập</button><br/>
                <a href="/timphongtro/dangky">Đăng ký tài khoản</a><br/>
                <p>${mess}</p>
            </form>
        </div>
    </body>
</html>