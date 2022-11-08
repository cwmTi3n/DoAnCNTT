<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<form action="themtk" method="post">
	<input type="text" name="tentk" placeholder="Tên tài khoản"><br/> 
	<input type="text" name="matkhau" placeholder="Mật khẩu"><br/> 
	<input type="text" name="ho" placeholder="Họ"><br/> 
	<input type="text" name="ten" placeholder="Tên"><br/>
	<label>Quyền: </label>
	<select name="quyen">
		<option value="2">User</option>
		<option value="3">Seller</option>
	</select><br/> 
	<input type="text" name="sdt" placeholder="Số điện thoại"><br/>
	<input type="text" name="email" placeholder="Email"><br/>
	<button type="submit">Thêm</button>
</form>