<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/templates/" var="url"></c:url>

    <div class="site-blocks-cover inner-page-cover overlay" style="background-image: url(${url}images/hero_1.jpg);" data-aos="fade">
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-5 mx-auto mt-lg-5 text-center">
            <h1>Tìm phòng trọ uy tín</h1>            
          </div>
        </div>
      </div>

      <a href="#property-details" class="smoothscroll arrow-down"><span class="icon-arrow_downward"></span></a>
    </div>  

    
    
    <div class="site-section" id="property-details">
      <div class="container">
        <div class="row">
          <div class="col-lg-7">
            <div class="owl-carousel slide-one-item with-dots">
            <div>
              	<img src="<c:url value="/hinhanh?fname=${phong.anhchinh}"/>" alt="Image" class="img-fluid">
            </div>
            <c:forEach items="${phong.getHinhanhs() }" var="hinhanh">
              <div>
              	<img src="<c:url value="/hinhanh?fname=${hinhanh.hinhanh}"/>" alt="Image" class="img-fluid">
              </div>
            </c:forEach>
<%--               <div><img src="${url }images/property_2.jpg" alt="Image" class="img-fluid"></div>
              <div><img src="${url }images/property_3.jpg" alt="Image" class="img-fluid"></div> --%>
            </div>
          </div>
          <div class="col-lg-5 pl-lg-5 ml-auto">
            <div class="mb-5">
              <h3 class="text-black mb-4">${phong.ten }</h3>
              <p>Diện tích: ${phong.chieudai } * ${phong.chieurong }</p>
              <p>${phong.mota }</p>
              <!-- <p>Ex, esse? Obcaecati nam in cum eius quaerat repellendus adipisci ducimus dolorum sed quos. Amet recusandae cumque reprehenderit nam quia voluptatibus, repellat, aspernatur ut fuga perferendis consectetur excepturi neque in!</p>
              <p class="mb-4">Neque facilis iure earum, placeat odit ipsum, amet, optio accusantium voluptatem quasi obcaecati fugit? Explicabo eius dolorem provident quis non voluptas, dignissimos tempora eligendi, in, nam velit, quasi tenetur. Animi!</p> -->
              <p><a href="#" class="btn btn-primary">Buy Property</a></p>
            </div>

<%--             <div class="mb-5">
              
              <div class="mt-5">
                <img src="${url }images/person_1.jpg" alt="Image" class="w-25 mb-3 rounded-circle">
                <h4 class="text-black">Kyla Stewart</h4>
                <p class="text-muted mb-4">Real Estate Agent</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab, iure atque sit ratione vitae neque! Laborum voluptate eius, laboriosam explicabo!</p>
                <p><a href="#" class="btn btn-primary btn-sm">Contact Agent</a></p>
              </div>
            </div> --%>

          </div>
        </div>
      </div>
    </div>