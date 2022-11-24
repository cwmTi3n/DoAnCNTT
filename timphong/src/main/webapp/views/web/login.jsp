<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>



<div class="NUS">
	<div class="container-login py-5">
		<div class="grid wide">

			<div class="container-login__header mt-5">
				<span class="container-login__header__logo"> <a
					href="<c:url value='/trangchu'/>"> <img
						src="${url }images/Logo.png" class="container__header__img">
				</a>
				</span> <span class="container-login__header__text">Find Room<br>
					<span class="text_underline container__header__text--underline">Login</span></span>
			</div>
			<div class="containe-loginr__content">
				<form action="login" method="post">
					<div class="containe-loginr__content__input-username input-login">
						<input class="input-username input-login" type="text"
							placeholder="Tên đăng nhập" name="tentk" value="${tentk}">
					</div>
					<div class="container-login__content__input-password input-login">
						<input class="input-password input-login" type="password"
							placeholder="Mật khẩu" name="matkhau" value="${matkhau }">
					</div>
					<div class="container-login__content__remember-me">
						<input type="checkbox" value="lsRememberMe" id="rememberMe" ${matkhau==null?"":"checked" } name="rmb">
						<label for="rememberMe" class="rememberMe-text">Remember
							me</label>
					</div>
					<c:if test="${not empty error}">
						<p class="text-danger my-0">${error}</p>
					</c:if>
					<div class="container-login__content__button-login">
						<button class="button-login btn-login" type="submit">Đăng
							nhập</button>
					</div>
				</form>
				<div class="container-login__content__forgot-password">
					<a class="forgot-password"
						href="/timphong/views/web/forgotpassword.jsp">Forgot Password</a>
				</div>
				<div class="container-login__content__button-register">
					<input type="checkbox" class="register--open" id="register"
						name="register"> <label for="register"> <span
						class="button-register btn-login">Đăng ký</span>
					</label>
					<div class="register">
						<div class="register__container container">
							<div class="register__container__close">
								
								<label for="register"> <i class="bi bi-x-circle"></i>
								</label>
							</div>
							<div
								class="container-login__header register__container__header row">
								<span class="container-login__header__logo"> <a
									href="<c:url value='/trangchu'/>"> <img
										src="${url }images/Logo.png" class="container__header__img">
								</a>
								</span> <span
									class="container-login__header__text register__container__header__text">FIND
									ROOM<br> <span
									class="text_underline register__container__header__text--underline">Sign
										Up</span>
								</span>

							</div>
							<div class="register__container__body row">
								<div class="col-md-6 my-1">
									<!-- <label for="firstName" class="register__container__body__label">First Name</label> -->
									<input type="text" class="register__container__body__input"
										placeholder="Họ">
								</div>
								<div class="col-md-6 my-1">

									<!-- <label for="lastName" class="register__container__body__label">last Name</label> -->
									<input type="text" class="register__container__body__input"
										placeholder="Tên">
								</div>
								<div class="col-md-6 my-1">
									<!-- <label for="phoneNumber" class="register__container__body__label">Phone Number</label> -->
									<input type="text" class="register__container__body__input"
										placeholder="Tài khoản">
								</div>
								<div class="col-md-6 my-1">
									<!-- <label for="userName" class="register__container__body__label">User Name</label> -->
									<input type="text" class="register__container__body__input"
										placeholder="Số điện thoại">
								</div>
								<div class="col-md-6 my-1">
									<!-- <label for="email" class="register__container__body__label">Email</label> -->
									<input type="password" class="register__container__body__input"
										placeholder="Mật khẩu">
								</div>
								<div class="col-md-6 my-1">
									<!-- <label for="password" class="register__container__body__label">Password</label> -->
									<input type="password" class="register__container__body__input"
										placeholder="Nhập lại mật khẩu">
								</div>
								<div class="col-md-12 my-1">
									<!-- <label for="confirmPassword" class="register__container__body__label">Confirm Password</label> -->
									<input type="email" class="register__container__body__input"
										placeholder="Đại chỉ email" style="display: block">
								</div>
								<div class="col-md-12 my-2">

									<p class="register__container__body__text">
										By clicking Sign Up, you agree to our Terms, Privacy Policy
										and Cookies Policy.<br>You may receive SMS notifications
										from us and can opt out at any time.
									</p>
								</div>
								<div class="col-md-12 register__container__body__button">
									<button class="button-signUp btn">Sign Up</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>