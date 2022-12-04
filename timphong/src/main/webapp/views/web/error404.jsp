<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<style>
body {
	margin: 0;
	box-sizing: border-box;
}

h1 {
	color: #fff;
	font-family: 'Rouge Script', cursive;
	font-size: 130px;
	font-weight: normal;
	line-height: 130px;
	margin: auto;
	text-align: center;
	text-shadow: 1px 1px 2px #082b34;
}

.web-404 {
	background-image: url(templates/images/404.jpg);
	height: 100vh;
	background-size: cover;
	background-repeat: no-repeat;
	position: relative;
}

.web-404:after {
	position: absolute;
	content: "";
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.4);
	z-index: 1;
}

.layer{
	z-index: 2;
    position: relative;
    
	    top: 50%;
    transform: translateY(-50%);
}
</style>

<div class="web-404">
	<div class="layer">
		<h1>404 error</h1>
		<div class="text-center mt-4">
			<a href="/timphong/trangchu" class="px-5 btn btn-outline-dark"><h3>Go back!</h3></a>
		</div>
	</div>
</div>
