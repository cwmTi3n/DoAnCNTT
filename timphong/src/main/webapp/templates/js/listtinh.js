
function loadHuyen() {
	var id_t = $('#city').find(":selected").val();
	var labelXa = "<option value='0' selected>Chọn phường xã</option>"
	var citis = document.getElementById("city");
	var districts = document.getElementById("district");
	var wards = document.getElementById("ward");

	if (id_t != 0) {
		districts.disabled = false;
		//wards.disabled = true;
		wards.innerHTML = labelXa;
		$.ajax({
			url: "/timphong/listhuyen", //send to Controller
			type: "get", //send it through get method
			data: {
				exits: id_t
			},
			success: function(data) {
				/* 					removeData(districts);
				 removeData(ward);
				 $("#district").append(data); */

				districts.innerHTML = data;
			}
		});
	} else {
		districts.disabled = true;
		wards.disabled = true;

		districts.value = 0;
		wards.value = 0;
	}

};

function loadXa() {
	var id_h = $('#district').find(":selected").val();

	var citis = document.getElementById("city");
	var districts = document.getElementById("district");
	var wards = document.getElementById("ward");

	if (id_h != 0) {
		wards.disabled = false;
		$.ajax({
			url: "/timphong/listxa", //send to Controller
			type: "get", //send it through get method
			data: {
				exits: id_h
			},
			success: function(data) {
				/* 					removeData(wards);
				 $("#ward").append(data); */
				wards.innerHTML = data;
			}
		});
	} else {
		wards.disabled = true;
		wards.value = 0;
	}
};

/* 	function removeData(data) {
 if (data !== undefined) {
 var i, L = data.options.length - 1;
 for (i = L; i >= 1; i--) {
 data.remove(i);
 }
 }
 } */