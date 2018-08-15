<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<script src='<c:url value="/resources/jsfiles/wickedtime.js"/>' ></script>
<link rel="stylesheet"	href='<c:url value="/resources/cssfiles/timepicker.css"/>'>


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
	// $("button[type=submit]").attr("disabled", "disabled");
	 $.getJSON('<c:url value="/vendor/getEquipmentList"/>', {
	 //countryId : $(this).val(),
	 ajax : 'true'
	 }, function(data) {
	//alert(data);	 
	
	 var select = $('.equipment');
	//select.find('option').remove();
	 $.each(data, function(index, value) {
		 //alert(value.art_name);
		 $("<input type='checkbox' name="+value.equipment_name+" >"+value.equipment_name+"</input>").appendTo(select);
		  
	 });
	 });
});

$(document).ready(function(){
		$("#register").submit(function(e){	
			      e.preventDefault();
			   
			var str = [];
        $.each($("input[type='checkbox']:checked  "), function(){    
        	closeOnSelect: false;
        	str.push($(this).attr('name'));
        });
      
        //alert(str);
        var checked =  [str];
        
      
	var hospital_name = $("#hospital_name").val();
			var hospital_reg_no = $("#hospital_reg_no").val();
			var hospital_type = $("#hospital_type").val();
			var hospital_website = $("#hospital_website").val();
			var from_time = $("#from_time").val();
			var to_time = $("#to_time").val();
			var no_of_doctors = $("#no_of_doctors").val();
			var hospital_address = $("#hospital_address").val();
			var country = $("#country").val();
			var state = $("#state").val();
			var city = $("#city").val();
			var pincode = $("#pincode").val();

			
			$.ajax({
				
				method : "POST",
				url : "hospitalregistration",
			data :{
				hospital_name : hospital_name,
				hospital_reg_no : hospital_reg_no,
				hospital_type : hospital_type,
				hospital_website : hospital_website,
				from_time : from_time,
				to_time : to_time,
				no_of_doctors : no_of_doctors,
				//equipments : hospital_type,
				hospital_address : hospital_address,
				country : country,
				state : state,
				city : city,
				pincode : pincode,

				equipments : checked.toString("")
				
				
			},
			success : function(result){
				 window.location="/helloambulance/vendor/hospitalsuccess";
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

	<div class="col-md-9" >
		<div class="profile-content">

			<div class="row " id="regdiv">
				<div class="col-sm-9">
					<div class="panel panel-primary setup-content">
						<div class="panel-heading">
							<h2 class="panel-title">Hospital Registration:</h2>
						</div>
						<div class="panel-body">
						
							<form method="POST" id="register">
							<!-- <form action="hospitalregistration" method="POST"> -->
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="hospital_name"
										id="hospital_name" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Hospital Name</label>
									</div>

								</div>
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="hospital_reg_no"
										id="hospital_reg_no" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Hospital Reg-No</label>
									</div>

								</div>

								<div class="group input_form_sign ">
									<select name="hospital_type" class="inputMaterial gender"
										id="hospital_type" required>
										<option value="">-select Hospital Type-</option>
										<option value="GOVERNMENT">GOVERNMENT</option>
										<option value="PRIVATE">PRIVATE</option>

									</select>
								</div>
									<!-- <div class="group input_form_sign ">
									<select name="doctor_degree" class="inputMaterial gender"
										id="Doctor_Degree" required>
										<option value="">-select degree-</option>

									</select>
								</div>
								<div class="group input_form_sign ">
									<select name="doctor_specialization"
										class="inputMaterial gender" id="Doctor_Specialization"
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
								</div> -->

										<div class="group input_form_sign ">
										<input class="inputMaterial" type="text" name="hospital_address"
											id="hospital_address" required> <span class="highlight"></span> <span
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

									<div class="group input_form_sign ">
										<input class="inputMaterial" type="text" name="hospital_website"
											id="hospital_website" required> <span class="highlight"></span> <span
											class="bar"></span>
										<div class="lef">
											<label>web site of the hospital</label>
										</div>
									</div>

									<div class="group input_form_sign ">
										<input class="inputMaterial" type="text" name="no_of_doctors"
											id="no_of_doctors" required> <span class="highlight"></span> <span
											class="bar"></span>
										<div class="lef">
											<label>No.of Doctors</label>
										</div>
									</div>

								<div class="group input_form_sign">
									<div class="row">
									<div class="col-sm-1 col-md-5"><label>Hospital Timings:</label></div>
									
										<div class="col-sm-2 col-md-3">
											<input type="text" name="from_time" id="from_time"
												class="inputMaterial timepicker" required /> <span
												class="highlight"></span> <span class="bar"></span>
											<div class="lef">
												<label>From Time</label>
											</div>
										</div>
										<div class="col-sm-2 col-sm-offset-2 col-md-3 col-md-offset-0">

											<input type="text" name="to_time" id="to_time"
												class="inputMaterial timepicker" required /> <span
												class="highlight"></span> <span class="bar"></span>
											<div class="lef">
												<label>To Time</label>
											</div>

										</div>
									</div>
									




									<!--  From Time <input type="time" name="from_time">
                 To Time <input type="time" name="to_time"> -->
								</div>



								<!-- 
									<div class="group input_form_sign ">
										<input class="inputMaterial" type="text" name="hospital_timings"
											id="" required> <span class="highlight"></span> <span
											class="bar"></span>
										<div class="lef">
											<label>Hospital Timings</label>
										</div>
									</div> -->
									
									<!-- 
									  <div class="col-sm-6">
                 <div class="form-group">
               <div class="col-sm-6">
               <label for="name" class="cols-sm-2 control-label">Equipments :</label>
               <div class="cols-sm-10">
                 <div class="input-group equipment">
               
                 </div>
               </div>
             </div>
           </div>  -->
									<div class="group input_form_sign ">
                      <label>Equipments:</label>
                         <div class="cols-sm-10">
                 <div class="input-group equipment " style="width:100%">
               
                 </div>
               </div>
                      <!-- <span class="input-group equipment" style="width: 100%">
               
                 </span> -->
                      
                     </div> 
							
									

									<div class="cont_btn">
									<!-- <input type="button" class="btn btn-danger " style="border-radius: none;" id="register" value="Register"> -->
										<button type="submit" class="btn btn-danger "
											style="border-radius: none;">Register</button> 
									</div>
							
</form>		

						</div>
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
<div id="successdiv"></div>

                <script>
                $(document).ready(function(){
                  $('.timepicker').wickedpicker();

    var options = {
        now: "12:35", //hh:mm 24 hour format only, defaults to current time
        twentyFour: false,  //Display 24 hour format, defaults to false
        upArrow: 'wickedpicker__controls__control-up',  //The up arrow class selector to use, for custom CSS
        downArrow: 'wickedpicker__controls__control-down', //The down arrow class selector to use, for custom CSS
        close: 'wickedpicker__close', //The close class selector to use, for custom CSS
        hoverState: 'hover-state', //The hover state class to use, for custom CSS
        title: 'Timepicker', //The Wickedpicker's title,
        showSeconds: false, //Whether or not to show seconds,
        timeSeparator: ' : ', // The string to put in between hours and minutes (and seconds)
        secondsInterval: 1, //Change interval for seconds, defaults to 1,
        minutesInterval: 1, //Change interval for minutes, defaults to 1
        beforeShow: null, //A function to be called before the Wickedpicker is shown
        afterShow: null, //A function to be called after the Wickedpicker is closed/hidden
        show: null, //A function to be called when the Wickedpicker is shown
        clearable: false, //Make the picker's input clearable (has clickable "x")
    };
    $('.timepicker').wickedpicker(options);
                });
                </script>

