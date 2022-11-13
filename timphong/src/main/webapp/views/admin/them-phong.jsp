<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
<div>
    <form action="them-phong" method="post" enctype="multipart/form-data">
        <label>Tên: </label><input type="text" name="ten"><br/>
        <label>Trạng thái: </label>
        	<select name="trangthai">
					<option value="1">Hiện</option>
					<option value="2">Ẩn</option>
			</select>
        <br/>
        <label>Chiều dài: </label><input type="text" name="chieudai"><br/>
        <label>Chiều rộng: </label><input type="text" name="chieurong"><br/>
        <label>Giá: </label><input type="text" name="gia"><br/>
        <label>Địa chỉ chi tiết: </label><input type="text" name="dcchitiet"><br/>
        
         <div class="col-md-auto">
          <select class="form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm">
            <c:forEach items="${tinhs }" var="tinh">
            	<option value="${tinh.matinh }" >${tinh.tentinh }</option>           
            </c:forEach>
          </select>
          
          <select class="form-select form-select-sm mb-3" id="district" aria-label=".form-select-sm">
            <option value="" selected>Chọn quận huyện</option>
          </select>

          <select class="form-select form-select-sm" id="ward" aria-label=".form-select-sm">
            <option value="" selected>Chọn phường xã</option>
          </select>
        </div>    
        
        <label>Mô tả: </label><input type="text" name="mota"><br/>
        
        <label>Loại phòng: </label> 
	        <select name="id_lp">
	        	<c:forEach items="${loaiphongs}" var="lp">
					<option value="${lp.id_lp }">${lp.tenloai }</option>
				</c:forEach>
			</select>	 
		<br/><label>Chủ phòng: </label><input type="text" name="id_tk" value="${id_tk }"><br/>
		<label>Hình ảnh chính: </label><input type="file" name="hinhanh"><br/>
		<label>Hình ảnh phụ: </label><input type="file" name="hinhanh"><br/>
		<label>Hình ảnh phụ: </label><input type="file" name="hinhanh"><br/>
        <button type="submit">Thêm</button>
    </form>
</div>


<script>
	function loadHuyen() {
		
		var citis = document.getElementById("city");
		var districts = document.getElementById("district");
		var wards = document.getElementById("ward");
		$.ajax({
			url : "/timphong/listtinh", //send to Controller
			type : "get", //send it through get method
			data : {
				exits : citis
			},
			success : function(data) {
				//$("#load").append(data);
				renderCity(data);
			}
		});
	};
	
	function renderCity(data) {
		  //for (const x of data) {
		    //citis.options[citis.options.length] = new Option(x.tenTinhThanhPho, x.ID);
		  //}

		  // xứ lý khi thay đổi tỉnh thành thì sẽ hiển thị ra quận huyện thuộc tỉnh thành đó
		  citis.onchange = function () {
		    district.length = 1;
		    ward.length = 1;
		    if(this.value != ""){
		      const result = data.filter(n => n.Id === this.value);

		      for (const k of result[0].Districts) {
		        district.options[district.options.length] = new Option(k.Name, k.Id);
		      }
		    }
		  };

		   // xứ lý khi thay đổi quận huyện thì sẽ hiển thị ra phường xã thuộc quận huyện đó
		  district.onchange = function () {
		    ward.length = 1;
		    const dataCity = data.filter((n) => n.Id === citis.value);
		    if (this.value != "") {
		      const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

		      for (const w of dataWards) {
		        wards.options[wards.options.length] = new Option(w.Name, w.Id);
		      }
		    }
		  };
		}
</script>
