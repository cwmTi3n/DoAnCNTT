<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>
    

    
    <div class="site-block-wrap">
    <div class="owl-carousel with-dots">
      <div class="site-blocks-cover overlay overlay-2" style="background-image: url(${url}images/hero_1.jpg);" data-aos="fade" id="home-section">

        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-6 mt-lg-5 text-center">
              <p><a href="https://free-template.co" target="_blank" class="btn btn-primary px-5 py-3">Đăng nhập</a></p>
            </div>
          </div>
        </div>
      </div>  
  
      <div class="site-blocks-cover overlay overlay-2" style="background-image: url(${url}images/hero_2.jpg);" data-aos="fade" id="home-section">
      </div>  
    </div>   
  </div>      


<div class="site-section" id="properties-section">
	<div class="container">
        <div class="row large-gutters">
        	<c:forEach items="${phongs }" var="phong">
        	 	<div class="phong col-md-6 col-lg-4 mb-5 mb-lg-5 ">
					<div class="ftco-media-1">
						<div class="ftco-media-1-inner">
							<a href="property-single.html" class="d-inline-block mb-4">
							<img src="<c:url value="/hinhanh?fname=${phong.hinhanh}"/>" alt="Image" class="img-fluid"></a>
							<div class="ftco-media-details">
								<h3>${phong.ten }</h3>
								<p>${phong.mota }</p>
								<strong>$${phong.gia }</strong>
							</div>

						</div>
					</div>
				</div>
        	</c:forEach>
		</div>
		<br> <button onClick="loadMore()" class="btn btn-primary">Xem tiếp</button>
	</div>
	<div id="load">
	</div>
</div>

<script>
	function loadMore() {
		/* tạo viên amount để Gọi và đếm classname là product */
		var amount = document.getElementsByClassName("phong").length;
		$.ajax({
			url : "/timphong/more", //send to Controller
			type : "get", //send it through get method
			data : {
				exits : amount
			},
			success : function(data) {
				$("#load").append(data);
			}
		});
	};
</script>