
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/jquery.js"></script>

<script src='<c:url value="/resources/jsfiles/registration.js"/>' ></script>
<link rel="stylesheet"  	href='<c:url value="/resources/cssfiles/vendor.css"/>'>
<link rel="stylesheet"  	href='<c:url value="/resources/cssfiles/user.css"/>'>
<link rel="stylesheet"  	href='<c:url value="/resources/cssfiles/style.css"/>'>
<link rel="stylesheet"  	href='<c:url value="/resources/cssfiles/style2.css"/>'>
<script src='<c:url value="../resources/jsfiles/sample.js"/>' ></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<style>

</style> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">

//validation for date of birth
$(document).ready(function () {
$(".dob").datepicker({
  minDate: '-50Y',
  maxDate: "-18Y",
  changeMonth: true,
  changeYear: true,
  defaultDate: new Date(),
  dateFormat: 'dd/mm/yy'
}).attr("readonly", "readonly");
});

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
		 
		 
		 $(document).ready(function() {
			 $.getJSON ('<c:url value="/loadBloodGroup/?${_csrf.parameterName}=${_csrf.token}"/>', {
				 /*  bloodGroupId : $(this).val(),
				 ajax : 'true'  */
			 }, function(data) {
			 var select = $('#Blood_group');
			 select.find('option').remove();
			 $.each(data, function(index, value){
			 $('<option>').val(value.bloodGroupId).text(value.bloodGroupName).appendTo(select);
			 });
			 });
		});
		 /* email*/
			
			
			$(document).ready(function() {
				$("#email_id").change(function() {
					$.ajax({
						url : 'check_avail_mail_addedmember',
						data : {
							emailId : $("#email_id").val()
						},
						success : function(data) {
							//$("#placeerror").html(data);
							$("#placeerror").html(data);
							if(data==""){
								$("#placeerror").html(data);
								  $("#submit").removeAttr("disabled");
								 
							}
							else{
								$("#placeerror").html(data);
								 $("#submit").attr("disabled", "disabled");
							}	
						}
					});
				});
			});
		
			$(document).ready(function() {
				$("#mobile_number").change(function() {
					$.ajax({
						url : 'check_mobile_avail_addedmember',
						data : {
							mobileNumber : $("#mobile_number").val()
						},
						success : function(data) {
							$("#mobileplace").html(data);
						}
					});
				});
			});
 
 });
 
 
 
 $(document).ready(function() {
	  $("#logouttime").click(function() {
	  $.ajax({
	  url : 'timelogout'

	  });
	  });
	  });

 </script>


		<div class="col-md-9">
            <div class="profile-content">
            <div class="row">
              <!-- <div class="col-sm-12 ">
                <h3 class="padding:10px">Profile</h3>
              </div> -->
            </div>

       <div class="row ">
         <form role="form" action= "Addmemberuser" method="POST">
             <div class="panel panel-primary setup-content" >
                 <div class="panel-heading">
                      <h2 class="panel-title">Add Members</h2>
                 </div>
                 <div class="panel-body">
                   <div class="col-sm-6">
                     <div class="group input_form_sign " >
                       <select name="relation_type" class="inputMaterial bloodgroup" id="" required >
                         <option value="">RelationShip</option>
                         <option value="0">Friends</option>
                         <option value="1">Family</option>
                       </select>
                     </div>
                    
                     <div class="group input_form_sign  ">
                       <input class="inputMaterial"  type="text"  name="name" id="" required><br>
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef"><label> Name</label></div>
                     </div>
                     <div class="group input_form_sign  ">
                       <input class="inputMaterial"  type="text"  name="email_id" id="email_id" required><br>
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef"><label>E-mail Id</label></div>
                     <div id="placeerror" class="error"></div>
                     </div>

                     <div class="group input_form_sign " >
                       <select name="gender" class="inputMaterial gender"  required ><br>
                         <option value="">-select gender-</option>
                         <option value="0">Male</option>
                         <option value="1">Female</option>
                         <option value="2">Others</option>
                       </select>
                     </div>
                     <div class="group input_form_sign ">
                       <input type="text" class=" inputMaterial"  name="mobile_number" id="mobile_number" required><br>
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef">  <label>Contact No.</label></div>
                      <div id="mobileplace" class="error"></div>
                     </div>
                     <div class="group input_form_sign ">
                       <input  class="inputMaterial dob" type="date" name="date_of_birth" id="dob"  required>
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef">  <label>Date of Birth</label></div>
                     </div>
                     <div class="group input_form_sign " >
                       <select name="blood_group" class="inputMaterial bloodgroup" id="Blood_group" required >
                        
                          <option value="">-select blodgroup-</option>
                       <!--   <option value="0">B+VE</option>
                         <option value="1">B-VE</option>  -->
                       </select>
                     </div>

  				</div>
                       <div class="col-sm-6">

                         <div class="group input_form_sign " >
                           <select name="marital_status" class="inputMaterial bloodgroup"  required >
                             <option value="">Marital Status</option>
                             <option value="0">Married</option>
                             <option value="1">Single</option>
                           </select>
                         </div>
                         <div class="group input_form_sign ">
                       <input type="text" class=" inputMaterial"  name="food_habit" id="" required>
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef"><label>Food habits</label></div>
                     </div>
                         <div class="group input_form_sign ">
                           <input type="text" class=" inputMaterial"  name="designation" id="" required>
                           <span class="highlight"></span>
                           <span class="bar"></span>
                           <div class="lef">  <label>Designation</label></div>
                         </div>
                     <div class="group input_form_sign ">
                       <input type="text" class=" inputMaterial"  name="address" id="" required>
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef">  <label>ADDRESS</label></div>
                     </div>
                     

                   
                     <div class="group input_form_sign " >
                       <select name="country" class="inputMaterial gender" id="country" required >
                         <option value="">-select country-</option>
                         <option value="101">INDIA</option>
                        <!--  <option value="1">RUSSIA</option>  -->
                       </select>
                     </div>
                     
                       <div class="group input_form_sign " >
                       <select name="state" class="inputMaterial gender" id="state" required >
                         <option value="">-select state-</option>
                        <!--  <option value="0">TELANGANA</option>
                         <option value="1">ANDHRAPRADESH</option> -->
                       </select>
                     </div>
                     
                     <div class="group input_form_sign " >
                       <select name="city" class="inputMaterial gender" id="city" required >
                         <option value="">-select city-</option>
                        <!--  <option value="0">hyd</option>
                         <option value="1">kahammam</option> -->
                       </select>
                     </div>
                     <div class="group input_form_sign ">
                       <input type="text" class=" inputMaterial" maxlength="6"  name="pincode" id="" required><br>
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef">  <label>PINCODE</label></div>
                     </div>
                   </div>

                   <div class="row">
                        <div class="col-sm-12">
                          <div class="group input_form_sign  ">
                            <input  class="inputMaterial dob" type="text" name="last_donated_date" id="" required>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <div class="lef">  <label>Last Donate date</label></div>
                          </div>
                     <div class="group input_form_sign ">
                      <label>Willing To Donate Blood:</label>
                       <input type="radio"   name="willing_to_donate_blood" value="1" id="" required> Yes
                       <input type="radio"   name="willing_to_donate_blood" value="0" id="" required> No
                     </div>
                     <div class="group input_form_sign ">
                      <label>Notify Blood Request:</label>
                       <input type="radio"   name="notify_blood_request" value="1" id="" required> Yes
                       <input type="radio"   name="notify_blood_request" value="0" id="" required> No
                     </div>
                     <div class="group input_form_sign ">
                      <label>Willing To Donate Organs:</label>
                       <input type="radio"   name="willing_to_donate_organs" value="1" id="" required> Yes
                       <input type="radio"   name="willing_to_donate_organs" value="0" required> No
                     </div>
                   </div>
                   


                 </div>
                     <button class="btn btn-primary  pull-right" type="submit" id="submit">Submit</button>
                 </div>
             </div>
</form>
       </div>
            </div>
		</div>
	</div>
</div>
<!-- <center>
<strong>Powered by <a href="#" target="_blank">realcom infocom pvt.ltd.</a></strong>
</center>
<br>
<br>
 -->
</html>