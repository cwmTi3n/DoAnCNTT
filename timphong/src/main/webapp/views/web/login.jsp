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
						<input type="checkbox" value="lsRememberMe" id="rememberMe"
							${matkhau==null?"":"checked" } name="rmb"> <label
							for="rememberMe" class="rememberMe-text">Remember me</label>
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
							<form action="register" method="post">
								<div class="register__container__body row">
									<div class="col-md-6 my-1">
										<!-- <label for="firstName" class="register__container__body__label">First Name</label> -->
										<input type="text" class="register__container__body__input"
											placeholder="Họ" name="ho">
									</div>
									<div class="col-md-6 my-1">

										<!-- <label for="lastName" class="register__container__body__label">last Name</label> -->
										<input type="text" class="register__container__body__input"
											placeholder="Tên" name="ten">
									</div>
									<div class="col-md-6 my-1">
										<!-- <label for="phoneNumber" class="register__container__body__label">Phone Number</label> -->
										<input type="text" class="register__container__body__input"
											placeholder="Tài khoản" name="taikhoanregister">
									</div>
									<div class="col-md-6 my-1">
										<!-- <label for="userName" class="register__container__body__label">User Name</label> -->
										<input type="text" class="register__container__body__input"
											placeholder="Số điện thoại" name="sdt">
									</div>
									<div class="col-md-6 my-1">
										<!-- <label for="email" class="register__container__body__label">Email</label> -->
										<input type="password" onkeyup="checkPassword(this.value)"
											class="register__container__body__input"
											placeholder="Mật khẩu" name="matkhauregister">
									</div>
									<div class="col-md-6 my-1">
										<!-- <label for="password" class="register__container__body__label">Password</label> -->
										<input type="password"
											class="register__container__body__input"
											placeholder="Nhập lại mật khẩu" name="confirmmatkhauregister">
									</div>
									<div class="col-md-12 my-1">
										<!-- <label for="confirmPassword" class="register__container__body__label">Confirm Password</label> -->
										<input type="email" class="register__container__body__input"
											placeholder="Đại chỉ email" style="display: block"
											name="email">
									</div>

									<div class="col-12 checkPasswordRegister">
										<ul class="flex flex-column gap-2 text-dark">
											<li id="lower" class="ease-in-out"><i
												id="iconNotCheckLower"
												class="bi bi-x-circle mr-1 text-danger d-inline"></i><i
												id="iconCheckLower"
												class="bi bi-check-circle mr-1 text-success d-none"></i>Ít nhất có
												một ký tự viết thường</li>
											<li id="upper" class="ease-in-out"><i
												id="iconNotCheckUpper"
												class="bi bi-x-circle mr-1 text-danger d-inline"></i><i
												id="iconCheckUpper"
												class="bi bi-check-circle mr-1 text-success d-none"></i>Ít nhất có
												một ký tự viết hoa</li>
											<li id="number" class="ease-in-out"><i
												id="iconNotCheckNumber"
												class="bi bi-x-circle mr-1 text-danger d-inline"></i><i
												id="iconCheckNumber"
												class="bi bi-check-circle mr-1 text-success d-none"></i>Ít nhất có
												một ký tự số</li>
											<li id="special" class="ease-in-out"><i
												id="iconNotCheckSpecial"
												class="bi bi-x-circle mr-1 text-danger d-inline"></i><i
												id="iconCheckSpecial"
												class="bi bi-check-circle mr-1 text-success d-none"></i>Ít nhất có
												một ký tự đặc biệt</li>
											<li id="length" class="ease-in-out"><i
												id="iconNotCheckLength"
												class="bi bi-x-circle mr-1 text-danger d-inline"></i><i
												id="iconCheckLength"
												class="bi bi-check-circle mr-1 text-success d-none"></i>Độ dài ngắn
												nhất là 8 ký tự</li>
										</ul>
									</div>
									<div class="col-md-12">

										<p class="register__container__body__text">
											By clicking Sign Up, you agree to our Terms, Privacy Policy
											and Cookies Policy.<br>You may receive SMS notifications
											from us and can opt out at any time.
										</p>
									</div>
									<c:if test="${not empty errorverify}">
										<p class="text-danger my-0">${errorverify}</p>
									</c:if>
									<div class="col-md-12 register__container__body__button">
										<button id="btn-signup" class="button-signUp btn" type="submit">Sign
											Up</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	let lowerCase = document.getElementById("lower");
	let upperCase = document.getElementById("upper");
	let digit = document.getElementById("number");
	let specialChar = document.getElementById("special");
	let minLength = document.getElementById("length");

	let iconNotCheckLower = document.getElementById("iconNotCheckLower");
	let iconNotCheckUpper = document.getElementById("iconNotCheckUpper");
	let iconNotCheckNumber = document.getElementById("iconNotCheckNumber");
	let iconNotCheckSpecial = document.getElementById("iconNotCheckSpecial");
	let iconNotCheckLength = document.getElementById("iconNotCheckLength");

	let iconCheckLower = document.getElementById("iconCheckLower");
	let iconCheckUpper = document.getElementById("iconCheckUpper");
	let iconCheckNumber = document.getElementById("iconCheckNumber");
	let iconCheckSpecial = document.getElementById("iconCheckSpecial");
	let iconCheckLength = document.getElementById("iconCheckLength");
	let btnSignUp = document.getElementById("btn-signup");
	function checkPassword(data) {
		const lower = new RegExp("(?=.*[a-z])");
		const upper = new RegExp("(?=.*[A-Z])");
		const number = new RegExp("(?=.*[0-9])");
		const special = new RegExp("(?=.*[!@#$%^&*])");
		const length = new RegExp("(?=.{8,})");
		//Lower Case validation check
		if (lower.test(data)) {
			lowerCase.classList.add("text-black-50");
			iconNotCheckLower.classList.remove("d-inline");
			iconNotCheckLower.classList.add("d-none");
			iconCheckLower.classList.remove("d-none");
			iconCheckLower.classList.add("d-inline");
		} else {
			lowerCase.classList.remove("text-black-50");
			iconNotCheckLower.classList.add("d-inline");
			iconNotCheckLower.classList.remove("d-none");
			iconCheckLower.classList.add("d-none");
			iconCheckLower.classList.remove("d-inline");
		}

		if (upper.test(data)) {
			upperCase.classList.add("text-black-50");
			iconNotCheckUpper.classList.remove("d-inline");
			iconNotCheckUpper.classList.add("d-none");
			iconCheckUpper.classList.remove("d-none");
			iconCheckUpper.classList.add("d-inline");
		} else {
			upperCase.classList.remove("text-black-50");
			iconNotCheckUpper.classList.add("d-inline");
			iconNotCheckUpper.classList.remove("d-none");
			iconCheckUpper.classList.add("d-none");
			iconCheckUpper.classList.remove("d-inline");
		}

		if (number.test(data)) {
			digit.classList.add("text-black-50");
			iconNotCheckNumber.classList.remove("d-inline");
			iconNotCheckNumber.classList.add("d-none");
			iconCheckNumber.classList.remove("d-none");
			iconCheckNumber.classList.add("d-inline");
		} else {
			digit.classList.remove("text-black-50");
			iconNotCheckNumber.classList.add("d-inline");
			iconNotCheckNumber.classList.remove("d-none");
			iconCheckNumber.classList.add("d-none");
			iconCheckNumber.classList.remove("d-inline");
		}

		if (special.test(data)) {
			specialChar.classList.add("text-black-50");
			iconNotCheckSpecial.classList.remove("d-inline");
			iconNotCheckSpecial.classList.add("d-none");
			iconCheckSpecial.classList.remove("d-none");
			iconCheckSpecial.classList.add("d-inline");
		} else {
			specialChar.classList.remove("text-black-50");
			iconNotCheckSpecial.classList.add("d-inline");
			iconNotCheckSpecial.classList.remove("d-none");
			iconCheckSpecial.classList.add("d-none");
			iconCheckSpecial.classList.remove("d-inline");
		}

		if (length.test(data)) {
			minLength.classList.add("text-black-50");
			iconNotCheckLength.classList.remove("d-inline");
			iconNotCheckLength.classList.add("d-none");
			iconCheckLength.classList.remove("d-none");
			iconCheckLength.classList.add("d-inline");
		} else {
			minLength.classList.remove("text-black-50");
			iconNotCheckLength.classList.add("d-inline");
			iconNotCheckLength.classList.remove("d-none");
			iconCheckLength.classList.add("d-none");
			iconCheckLength.classList.remove("d-inline");
		}

		if (
			lower.test(data) &&
			upper.test(data) &&
			number.test(data) &&
			special.test(data) &&
			length.test(data)
		) {
			btnSignUp.disabled = false;
		} else
			btnSignUp.disabled = true;
	};
	
</script>