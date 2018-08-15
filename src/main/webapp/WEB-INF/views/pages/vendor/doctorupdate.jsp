<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!-- <script type="text/javascript">
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
			 $.getJSON ('<c:url value="/vendor/loadDoctorDegree/?${_csrf.parameterName}=${_csrf.token}"/>', {
				
			 }, function(data) {
			 var select = $('#Doctor_Degree');
			 select.find('option').remove();
			 $.each(data, function(index, value){
			 $('<option>').val(value.doctor_degree_id).text(value.doctor_degree).appendTo(select);
			 });
			 });
			 });
		
	 $('#Doctor_Degree').change(function() {
		
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
		 </script> -->
<div>

	<div class="col-md-9">
		<div class="profile-content">

			<div class="row ">
				<div class="col-sm-9">
					<div class="panel panel-primary setup-content">
						<div class="panel-heading">
							<h2 class="panel-title">Update Doctor Details :</h2>
						</div>
						<div class="panel-body">
							<!--             <form role="form" id="step2" class="step2"> -->
<%-- 							<form action='<c:url value="adddoctor"/>' method="POST">
 --%>								
 
             <form action='<c:url value="updateDoctor"/>'method="POST">
 			<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="hospitalname" value="${doctor.hospitalname}"
										id="" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Hospital NAME</label>
									</div>

								</div>
								
					
									<%-- 	<div class="group input_form_sign ">
									<select name="doctor_specialization"
										class="inputMaterial gender" id="Doctor_Specialization"
										required>
										<option value="">-select specialization-</option>


									</select>
								</div> --%>
								<!-- <div class="group input_form_sign ">
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
								</div> -->
								
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="experience" value="${doctor.experience}"
										id="" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Year Of Experiences</label>
									</div>

								</div>
								
								<div class="group input_form_sign  ">
									<input class="inputMaterial" type="text"
										name="practice_location" id=""  value="${doctor.practice_location}" required> <span
										class="highlight"></span> <span class="bar"></span>
									<div class="lef">
										<label>Practice location</label>
									</div>
								</div>
								
									<div class="group input_form_sign ">
										<label>Degree</label>
										<input class="inputMaterial" type="text" name="doctor_degree" value="${doctor.doctor_degree}"
											id="Doctor_Degree" required readonly="readonly"> 
									</div>
								

									<div class="group input_form_sign ">
										<label>Address</label>
										<input class="inputMaterial" type="text" name="address" value="${doctor.address}"
											id="hospital_address" required readonly="readonly"> 
									</div>
									
									
									<div class="group input_form_sign ">
									<label>Country</label>
									<input class="inputMaterial" type="text" name="country" value="${doctor.country}" readonly="readonly"
										id="country" required>

								</div>
								<div class="group input_form_sign ">
								<label>State</label>
									<input class="inputMaterial" type="text" name="state" value="${doctor.state}" readonly="readonly"
										id="state" required> 
								</div>

									<div class="group input_form_sign ">
									<label>City</label>
									<input class="inputMaterial" type="text" name="city" value="${doctor.city}" readonly="readonly"
										id="city" required> 

								</div>
								

									<div class="group input_form_sign ">
									<label>pincode</label>
										<input class="inputMaterial" type="text" name="pincode" value="${doctor.pincode}" readonly="readonly"
											id="pincode" required> <span class="highlight"></span>
										
										
									</div>


								<div class="cont_btn">
									<button type="submit" class="btn btn-danger "
										style="border-radius: none;">Update Details</button>
								</div>
							</form>


						</div>
					</div>
				</div>
				<div class="col-sm-3">
				<h3>Add your</h3>
					<ul class="">
						
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
				</div>

			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-6" style="border-right: 1px solid #e5e5e5">

	</div>
</div>


