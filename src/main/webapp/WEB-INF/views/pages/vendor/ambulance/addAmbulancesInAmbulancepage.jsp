<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!--  --><!--  -->


<style>

input[type=checkbox], input[type=radio] {
    width: -webkit-fill-available;
}

</style>
<script type="text/javascript">
 $(document).ready(function(){
	 $('#country').change(function() {
		 $.getJSON('<c:url value="/loadStates/?${_csrf.parameterName}=${_csrf.token}"/>', {
		 countryId : $(this).val(),
		 ajax : 'true'
		 }, function(data) {
		 var select = $('#state');
		 select.find('option').remove();
		 $.each(data, function(index, value) {
		 $('<option>').val(value.stateId).text(value.stateName).appendTo(select);
		 });
		 });
	});
		 $('#state').change(function() {
		 $.getJSON ('<c:url value="/loadCities/?${_csrf.parameterName}=${_csrf.token}"/>', {
		 stateId : $(this).val(),
		 ajax : 'true'
		 }, function(data) {
		 var select = $('#city');
		 select.find('option').remove();
		 $.each(data, function(index, value){
		 $('<option>').val(value.cityId).text(value.cityName).appendTo(select);
		 });
		 });
		 });
 });

		 
		 $(document).ready(function() {
				$("#mobile_number").change(function() {
					$.ajax({
						url : 'check_mobile_avail',
						data : {
							mobileNumber : $("#mobile_number").val()
						},
						success : function(data) {
							$("#id_div").html(data);
						}
					});
				});
			});
		 
		 /* email*/
			
			$(document).ready(function() {
				$("#email_id").change(function() {
					$.ajax({
						url : 'check_avail_email_in_ambulance',
						data : {
							emailId : $("#email_id").val()
						},
						success : function(data) {
/* 							$("#id3_res_div").html(data);
 */							if(data==""){
								$("#id3_res_div").html(data);
								  $("#submit").removeAttr("disabled");
								 
							}
							else{
								$("#id3_res_div").html(data);
								 $("#submit").attr("disabled", "disabled");
							}	
						}
					});
				});
			});
 $(document).ready(function() {
		// $("button[type=submit]").attr("disabled", "disabled");
		 $.getJSON('<c:url value="/vendor/getEquipmentList"/>', {
		 //countryId : $(this).val(),
		 ajax : 'true'
		 }, function(data) {
		//alert(data);	 
		
		 var select = $('.equipments');
		//select.find('option').remove();
		 $.each(data, function(index, value) {
			 //alert(value.art_name);
			 $("<input type='checkbox' name="+value.equipment_name+" >"+value.equipment_name+"</input>").appendTo(select);
			  
		 });
		 });
	});

 $(document).ready(function(){
	 
	
	        var loading = $("#loading");
	        $(document).ajaxStart(function () {
	            loading.show();
	        });

	        $(document).ajaxStop(function () {
	            loading.hide();
	        });
	 
	 
		$("#register").submit(function(e){	
			$("#hidediv").hide();
			      e.preventDefault();
			   
			var str = [];
     $.each($("input[type='checkbox']:checked  "), function(){    
     	closeOnSelect: false;
     	str.push($(this).attr('name'));
     });
   
     //alert(str);
     var checked =  [str];
     
   
 			   var name = $("#name").val();
   			  var email_id = $("#email_id").val();
				var gender = $("#gender").val();
				var vechicle_reg_no = $("#vechicle_reg_no").val();
				var vechicle_model = $("#vechicle_model").val();
				var vechicle_engine_no = $("#vechicle_engine_no").val();
				var vechicle_colour = $("#vechicle_colour").val();
				var purchesed_from = $("#purchesed_from").val();
				var type_of_ambulance = $("#type_of_ambulance").val();
				var address = $("#address").val();
				var country = $("#country").val();
				var state = $("#state").val();
				var city = $("#city").val();
				var pincode = $("#pincode").val();


			
			$.ajax({
				
				method : "POST",
				url : "addAmbulancesforAmbulance",
			data :{
				name : name,
				email_id : email_id,
				gender : gender,
				vechicle_reg_no : vechicle_reg_no,
				vechicle_model : vechicle_model,
				vechicle_engine_no : vechicle_engine_no,
				vechicle_colour : vechicle_colour,
				purchesed_from : purchesed_from,
				type_of_ambulance : type_of_ambulance,
				address : address,
				country : country,
				state : state,
				city : city,
				pincode : pincode,

				equipments : checked.toString("")
				
				
			},
			success : function(result){
				 window.location="/helloambulance/vendor/ambulanceSuccessInAmbulance";
				//alert(result);
				//alert($("#regdiv").html(result););
			//	$("regdiv").hide();
			//$("#regdiv").html(result);
				
			}
			});
			});
			});
	
 
 
 
	
	
  </script>
<div>
<div id="loading" style="display: none;"><img alt="loading" src="../resources/images/pleasewait.gif"  style="margin-left:200px; padding:50px;width: 400px;">
</div>

	<div class="col-md-9"  id="hidediv">
		<div class="profile-content">

			<div class="row ">
				<div class="col-sm-9">
					<div class="panel panel-primary setup-content">
						<div class="panel-heading">
							<h2 class="panel-title">Ambulance Registration:</h2>
						</div>
						<div class="panel-body">
<form method="POST" id="register"> 															
									<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="name"
										id="name" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Name </label>
									</div>
             						</div>
             	<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="email_id"
										id="email_id" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Email Id</label>
									</div>
				 <div id="id3_res_div" class="error" style="color: red;"></div>
									</div>
									
										 <div class="group input_form_sign " >
                  <select name="gender" class="inputMaterial gender" id="gender"  required >
                    <option value="">-select Gender-</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                  </select>
                </div>
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="vechicle_reg_no"
										id="vechicle_reg_no" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Vehicle Reg.No</label>
									</div>
								</div>
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="vechicle_model"
										id="vechicle_model" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Vehicle Model</label>
									</div>
								</div>
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="vechicle_engine_no"
										id="vechicle_engine_no" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Engine.No</label>
									</div>
								</div>
								
							
								<div class="group input_form_sign  ">
									<input class="inputMaterial" type="text"
										name="vechicle_colour" id="vechicle_colour" required> <span
										class="highlight"></span> <span class="bar"></span>
									<div class="lef">
										<label>Vehicle Colour</label>
									</div>
								</div>
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="purchesed_from"
										id="purchesed_from" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Purchsed From</label>

									</div>
								</div>
								
								<div class="group input_form_sign ">
									<select name="type_of_ambulance" class="inputMaterial gender"
										id="type_of_ambulance" required>
										<option value="">-Select Ambulance Type-</option>
										<option value="ALS(Advanced Life Support)">ALS</option>
										<option value="BLS(Basic Life Support)">BLS</option>
									</select>
								</div>
								<!-- 
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="equipments"
										id="" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Medical Equipments</label>
									</div>
								</div> -->
								
									<!--  <div class="group input_form_sign ">
                      <label>Medical Equipments:</label>
                       <input type="radio"   name=""equipments"" value="1" id="" required>Oxygen
                       <input type="radio"   name=""equipments"" value="0" required> Ventilater
                     </div> -->
                    
                     <div class="group input_form_sign ">
                      <label>Equipments:</label>
                         <div class="cols-sm-10">
                 <div class="input-group equipments " style="width:100%">
               
                 </div>
               </div>
                      <!-- <span class="input-group equipment" style="width: 100%">
               
                 </span> -->
                      
                     </div> 
								
								<div class="group input_form_sign  ">
									<input class="inputMaterial" type="text" name="address" id="address"
										required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Address</label>
									</div>
								</div>
								<div class="group input_form_sign ">
									<select name="country" class="inputMaterial gender"
										id="country" required>
										<option value="">-select country-</option>
										<option value="101">INDIA</option>

									</select>
								</div>

								<div class="group input_form_sign ">
									<select name="state" class="inputMaterial gender" id="state"
										required>
										<option value="">-select state-</option>
										<option value="36">TELANGANA</option>
									</select>
								</div>
								<div class="group input_form_sign ">
									<select name="city" class="inputMaterial gender" id="city"
										required>
										<option value="">-select city-</option>
										<option value="4466">Hyderabad</option>
									</select>
								</div>

								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="pincode"
										id="pincode" required> <span class="highlight"></span>
									<span class="bar"></span>
									<div class="lef">
										<label>Pincode</label>
									</div>
								</div>
								<div class="cont_btn">
									<button type="submit" class="btn btn-danger "
										style="border-radius: none;" >Register</button>
								</div>
							</form>
						</div>
							<div id="loading" style="display:none"><img alt="loading" src="../resources/images/Loading_icon.gif" ><br>Loading  ................</div>
					</div>
				</div>
				<!-- <div class="col-sm-3">
					<ul class="">
						<h3>Add your</h3>
						<li><a href="doctor1.html">Education</a></li>
						<li><a href="doctor2.html">Experience</a></li>
						<li><a href="doctor3.html">Practice location</a></li>
						<li><a href="doctor4.html">membership</a></li>
						<li><a href="doctor5.html">Awards</a></li>
						<li><a href="doctor6.html">Achievements</a></li>
						<li><a href="doctor7.html">Publication/Presentation</a></li>
						<li><a href="doctor8.html">Courses</a></li>
						<li><a href="doctor9.html">Profile Picture</a></li>
						<li><a href="doctor10.html">Upload identity</a></li>
					</ul>
				</div> -->

			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-6" style="border-right: 1px solid #e5e5e5">

		
	</div>
</div>


