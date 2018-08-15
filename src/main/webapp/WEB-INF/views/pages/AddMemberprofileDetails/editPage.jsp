<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
							$("#placeerror").html(data);
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



 $(document).ready(function() {
		// $("button[type=submit]").attr("disabled", "disabled");
		
		 $.getJSON('<c:url value="/user/getartid"/>', {
		 //countryId : $(this).val(),
		 ajax : 'true'
		 }, function(data) {
		//alert(data);
		//alert(data['art_id']);
	//	var id = [];
	
		
		 var select = $('.group input_form_sign');
		 
		//select.find('option').remove();
		 $.each(data, function(index, value) {
			 for(i=0;i<100;i++){
			//alert(value.art_id[i]);
			 $("#"+value.willing_to_donate_organs[i]).attr('checked', 'checked');
			 //alert(value.art_id[2]);//
			 
			 }
			// $("<input type='checkbox'  id="+value.art_id+" checked >"+value.art_id+"</input>").appendTo(select);
			
				
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

 <c:forEach items="${showdetails}" var="savers" >
       <div class="row ">
       
         <form role="form" action="../upadatememberprofile/<c:out value="${savers.family_member_id}"></c:out>" method="POST" >
             <div class="panel panel-primary setup-content" >
                 <div class="panel-heading">
                      <h2 class="panel-title">Add Members</h2>
                 </div>
                 <div class="panel-body">
                   <div class="col-sm-6">
                     <div class="group input_form_sign " >
<%--                       <input type="text" class="inputMaterial gender"  value="${savers.relation_type}" required  readonly="readonly">
 --%>                      <select name="relation_type" class="inputMaterial bloodgroup" id=""   required >
                       
                         <option value="">RelationShip</option>
                         <option value="0"<c:if test="${savers.getRelation_type()=='Friend'}">selected</c:if>>Friends</option>
                         <option value="1"<c:if test="${savers.getRelation_type()=='Family'}">selected</c:if>>Family</option>
                       </select> 
                     </div>
                    
                     <div class="group input_form_sign  ">
                       <input class="inputMaterial"  type="text"  name="name" id=""  value="${savers.name}" required>
                     
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef"><label> Name</label></div>
                     </div>
                     <div class="group input_form_sign  ">
                       <input class="inputMaterial"  type="text"  name="email_id" id="email_id"  value="${savers.email_id}" required><br>
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef"><label>E-mail Id</label></div>
                     <div id="placeerror" class="error"></div>
                     </div>

                     <div class="group input_form_sign " >
<%--                      <input type="text" class="inputMaterial gender"  value="${savers.gender}" required  readonly="readonly">
 --%>                       <select name="gender" class="inputMaterial gender"  required >
                         <option value="">-select gender-</option>
                         <option value="0"<c:if test="${savers.getGender()=='male'}">selected</c:if>>Male</option>
                         <option value="1"<c:if test="${savers.getGender()=='female'}">selected</c:if>>Female</option>
                         <option value="2"<c:if test="${savers.getGender()=='others'}">selected</c:if>>Others</option>
                       </select> 
                     </div>
                     <div class="group input_form_sign ">
                       <input type="text" class=" inputMaterial"  name="mobile_number" id="mobile_number"  value="${savers.mobile_number}" required><br>
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef">  <label>Contact No.</label></div>
                      <div id="mobileplace" class="error"></div>
                     </div>
                     <div class="group input_form_sign ">
                       <input  class="inputMaterial dob" type="date" name="date_of_birth" id="dob"  value="${savers.date_of_birth }"required>
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef">  <label>Date of Birth</label></div>
                     </div>
                     <div class="group input_form_sign " >
                     <input type="" class="inputMaterial gender" id="Blood_group" value="${savers.blood_group}" required  readonly="readonly">
                      <%--  <select name="blood_group" class="inputMaterial bloodgroup" id="Blood_group"  value="${savers.blood_group}" required >
                        
                          <option value="">-select blodgroup-</option>
                       <!--   <option value="0">B+VE</option>
                         <option value="1">B-VE</option>  -->
                       </select>
                     </div> --%>

  				</div>
                       <div class="col-sm-6">

                         <div class="group input_form_sign " >
                       <%--   <input type="text" class="inputMaterial gender"  value="${savers.marital_status}" required  readonly="readonly"> --%>
                            
                        
                            <select name="marital_status" class="inputMaterial bloodgroup"  required >
                             <option value="">Marital Status</option>
                             <option value="0"<c:if test="${savers.getMarital_status()=='single'}">selected</c:if>>Single</option>
                             <option value="1"<c:if test="${savers.getMarital_status()=='married'}">selected</c:if>>Married</option>
                           </select> 
                         
                         </div>
                         <div class="group input_form_sign ">
                       <input type="text" class=" inputMaterial"  name="food_habit" id="" value="${savers.food_habit}" required>
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef"><label>Food habits</label></div>
                     </div>
                         <div class="group input_form_sign ">
                           <input type="text" class=" inputMaterial"  name="designation" id="" value="${savers.designation}" required>
                           <span class="highlight"></span>
                           <span class="bar"></span>
                           <div class="lef">  <label>Designation</label></div>
                         </div>
                     <div class="group input_form_sign ">
                       <input type="text" class=" inputMaterial"  name="address" id="" value="${savers.address}" required>
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef">  <label>ADDRESS</label></div>
                     </div>
                     
                      <div class="group input_form_sign " >
                       country:<input type="text" class=" inputMaterial"  name="country" id="country" value="${savers.country}" required readonly="readonly">
                      <%--  <select name="country" class="inputMaterial gender" id="country" value="${savers.country}" required >
                         <option value="">-select country-</option>
                         <option value="101">INDIA</option>
                        <!--  <option value="1">RUSSIA</option>  -->
                       </select> --%>
                     </div>
                     
                       <div class="group input_form_sign " >
                       state:<input type="text" class=" inputMaterial"  name="state" id="state" value="${savers.state}" required readonly="readonly">
                       <%-- <select name="state" class="inputMaterial gender" id="state" value="${savers.state}" required >
                         <option value="">-select state-</option>
                        <!--  <option value="0">TELANGANA</option>
                         <option value="1">ANDHRAPRADESH</option> -->
                       </select> --%>
                     </div>
                    
                     
                     <div class="group input_form_sign " >
                    city: <input type="text" class=" inputMaterial"  name="city" id="city" value="${savers.city}" required readonly="readonly">
                      
                       <%--  <select name="city" class="inputMaterial gender" id="city" value="${savers.city}" required >
                         <option value="">-select city-</option>
                        <!--  <option value="0">hyd</option>
                         <option value="1">kahammam</option> -->
                       </select>  --%>
                     </div>

                   
                     
                     
                     <div class="group input_form_sign ">
                       <input type="text" class=" inputMaterial" maxlength="6"  name="pincode" id="" value="${savers.pincode}" required><br>
                       <span class="highlight"></span>
                       <span class="bar"></span>
                       <div class="lef">  <label>PINCODE</label></div>
                     </div>
                   </div>

                   <div class="row">
                        <div class="col-sm-12">
                          <div class="group input_form_sign  ">
                            <input  class="inputMaterial dob" type="text" name="last_donated_date" id="" value="${savers.last_donated_date}" required>
                            <span class="highlight"></span>
                            <span class="bar"></span>
                            <div class="lef">  <label>Last Donate date</label></div>
                          </div>
                     <div class="group input_form_sign ">
                      <label>Willing To Donate Blood:</label>
                       <input type="radio" value="1"  name="willing_to_donate_blood" <c:if test="${savers.getWilling_to_donate_blood()=='1'}">checked</c:if>> Yes
                       <input type="radio"  value="0" name="willing_to_donate_blood" <c:if test="${savers.getWilling_to_donate_blood()=='0'}">checked</c:if>> No
                     </div>
                     <div class="group input_form_sign ">
                      <label>Notify Blood Request:</label>
                       <input type="radio" value="1" value="1"  name="notify_blood_request"  <c:if test="${savers.getNotify_blood_request()=='1'}">checked</c:if> > Yes
                       <input type="radio"  value="0" name="notify_blood_request"  <c:if test="${savers.getNotify_blood_request()=='0'}">checked</c:if> > No
                     </div>
                     <div class="group input_form_sign ">
                     <c:set  var="showdetails" value="1" />
                      <label>Willing To Donate Organs:</label>
                    <%--  <form:radiobutton path="varma" value="${savers. willing_to_donate_organs}"  name="willing_to_donate_organs"/>Yes 
                     <form:radiobutton path="varma" value="${savers.willing_to_donate_organs}"   name="willing_to_donate_organs"/>NO --%>
                  <%--  <form:checkboxes items="${showdetails}" path="savers"/> --%>
                       <input type="radio" value="1"  name="willing_to_donate_organs"   <c:if test="${savers.getWilling_to_donate_organs()=='1'}">checked</c:if> > Yes
                       <input type="radio"  value="0" name="willing_to_donate_organs"  <c:if test="${savers.getWilling_to_donate_organs()=='0'}">checked</c:if> > No 
                     
                     </div>
                   </div>
                   


                 </div>
                     <button class="btn btn-primary  pull-right" type="submit">Submit</button>
                 </div>
             </div>
             </div>
</form>
       </div>
       </c:forEach>
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