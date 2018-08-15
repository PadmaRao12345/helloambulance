<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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
			 $("#Doctor_Degree").focus(function(){
			 $.getJSON ('<c:url value="/vendor/loadDoctorDegree?${_csrf.parameterName}=${_csrf.token}"/>', {

			 }, function(data) {
			 var select = $('#Doctor_Degree');
			 select.find('option').remove();
			 $.each(data, function(index, value){
			 $('<option>').val(value.doctor_degree_id).text(value.doctor_degree).appendTo(select);
			 });
			 });
			 });

	 $('#Doctor_Degree').change(function() {
	//	alert("hiiii");
				 $.getJSON ('<c:url value="/vendor/loadDoctorSpecialization/?${_csrf.parameterName}=${_csrf.token}"/>', {
					 doctor_degree_id : $(this).val(),

					 ajax : 'true'
				 }, function(data) {
				 var select = $('#Doctor_Specialization');
				 select.find('option').remove();
				 $.each(data, function(index, value) {
				 $('<option>').val(value.doctor_specialization_id).text(value.doctor_specialization_type).appendTo(select);
				 });
				 });
			});
		 });
		 </script>
<div>

	<div class="col-md-9">
		<div class="profile-content">

			<div class="row ">
				<div class="col-sm-9">
					<div class="panel panel-primary setup-content">
						<div class="panel-heading">
							<h2 class="panel-title">Doctor Registration:</h2>
						</div>
						<div class="panel-body">
							<!--             <form role="form" id="step2" class="step2"> -->
<%-- 							<form action='<c:url value="adddoctor"/>' method="POST">
 --%>

             <form action='<c:url value="doctorsuccess"/>'method="POST">
 			<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="hospitalname"
										id="" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Hospital NAME</label>
									</div>

								</div>
								<div class="group input_form_sign ">
									<select name="doctor_degree" class="inputMaterial gender"
										id="Doctor_Degree" required>
										<option value="">-select degree-</option>

									</select>
								</div>
								<div class="group input_form_sign ">
									<select name="doctor_specialization"
										class="inputMaterial gender" id="Doctor_Specialization"
										multiple="multiple"
										required>
										<option value="">-select specialization-</option>


									</select>
								</div>
								<div class="group input_form_sign ">
									<select name="experience" class="inputMaterial gender" id=""
										required>
										<option value="">Year Of Experiences-</option>
										<option value="0">0</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
										<option value="11">11</option>
									</select>
								</div>
								<div class="group input_form_sign  ">
									<input class="inputMaterial" type="text"
										name="practice_location" id="" required> <span
										class="highlight"></span> <span class="bar"></span>
									<div class="lef">
										<label>Practice location</label>
									</div>
								</div>

								<div class="group input_form_sign  ">
									<input class="inputMaterial" type="text" name="address" id=""
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
										<label>pincode</label>
									</div>
								</div>

								<div class="cont_btn">
									<button type="submit" class="btn btn-danger "
										style="border-radius: none;">Register</button>
								</div>
							</form>


						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<ul class="">
						<h3>Add your</h3>
						<li><a href="add_details">Add your Details</a></li>

					</ul>
				</div>

			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-6" style="border-right: 1px solid #e5e5e5">

		</form>
	</div>
</div>

<!-- <form >
<input type="text" value="1" hidden="true" id="likes">
<input type="button" value="Like" id="read">
</form>
<script>
$(document).ready(function() {
	$("#read").click(function(){
		var likes;
		if("#likes").val()==1){
		likes=0;
	}
	
	if("#likes").val()==0){
	likes=1;
}	
$.ajax({
method : "POST",
url : "Index",
data :{
	likes : likes

} 
});
	});
	
	
	)};
}

</script> -->