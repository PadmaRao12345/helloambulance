<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %> --%>

 <!-- validation links -->
  <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
  <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
  <!-- validation links -->


<style>


body {font-family: Arial, Helvetica, sans-serif;}
.welcome input[type=password]{
   width: 100%;
   padding: 8px;
   border: 1px solid Gray;

   box-sizing: Margin-box;
   margin-top: 6px;
   margin-bottom: 8px;
   resize: vertical;
}



.welcome input[type=submit] {
   background-color: white;
   color: black;
   padding: 8px 30px;
   border: none;
   border-radius: 8px;
   cursor: pointer;
}



.welcome {
margin:0  25% auto;
width: 50%;
   border-radius: 10px;
   background-color:red;
   padding: 50px;
}

.error ,.man{
  color:#650303 !important;
}

</style>
<body>
<br>
<script type="text/javascript">
$(document).ready(function() {
	$("#oldpassword").change(function() {
		$.ajax({
			url : 'check_oldpassword_admin',
			data : {
				old_password : $("#oldpassword").val()
			},
			success : function(data) {
				if(data==""){
					$("#id_res_div").html(data);
					  $("input[type=Submit]").removeAttr("disabled");
					  $("#password").removeAttr("readonly");
						 $("#rpassword").removeAttr("readonly");
					 
				}
				else{
					$("#id_res_div").html(data);
					 $("#password").attr("readonly", "readonly");
					 $("#rpassword").attr("readonly", "readonly");
					 password
				}
			}
		});
	});
});
/* 
 $(document).ready(function() {
	 $("input[type=Submit]").attr("disabled", "disabled");
	
	$("#oldpassword").change(function() {
		$.ajax({
			url : 'check_oldpassword_user',
			data : {
				password : $("#oldpassword").val()
			},
			success : function(data) {
				if(data=="passwordmatch"){
					$("#id_res_div").html(data);
					  $("input[type=Submit]").removeAttr("disabled");
					 
				}
				else{
					$("#id_res_div").html(data);
					 $("input[type=Submit]").attr("disabled", "disabled");
				}
			}
		});
	});
});  */

$(document).ready(function() {
	 jQuery.validator.addMethod("cpassword", function(value, element) {
		    return this.optional( element ) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!,%,&,@,#,$,^,*,?,_,~]).{8,}$/.test( value );
		  } ); 
	 $(".change").validate({
		 rules: {
			 old_password:{
				 required: true,	               	                
			 },
			 password: {
	                required: true,
	                minlength: 8,
	                cpassword:true,
	              },
	              rpassword: {
	                required: true,
	                minlength: 8,
	                cpassword:true,
	                equalTo:'#password',
	              }
		 },
		 messages : {
			 old_password:{
				 required: "Please enter your password (min8 max 12)",	               	                
			 },
		 password: {
                required : "Please enter your password (min8 max 12)",
                minlength: "Must contain at least one number and one uppercase and lowercase letter and one special charecter, and at least 8 or more characters and Maximum 12 ",
                password: "please fill required format (eg:Praveen@123)",
              },
              rpassword: {
                required : "Please  confirm your password (min8 max 12)",
                password: "Please enter the same password ",
                equalTo:"Please match password",
              }
		 },
	 });


$(document).ready(function(){
$.getJSON("<c:url value='/user/getProfileDetails/'/>", {
ajax : "true"
}, function(data) {
var profileDetails =  data;
$(".profileFirstName").html(data.profileDetails[0].first_name);
$(".profileLastName").html(data.profileDetails[0].last_name);
$(".profileEmailId").html(data.profileDetails[0].email_id);
$(".profileMobileNumber").html(data.profileDetails[0].mobile_no);
$(".profileGender").html(data.profileDetails[0].gender);
$(".profileDateOfBirth").html(data.profileDetails[0].date_of_birth);
$(".profileCity").html(data.profileDetails[0].city);
$(".profileState").html(data.profileDetails[0].state);
$(".profileCountry").html(data.profileDetails[0].country);
$(".profilePinCode").html(data.profileDetails[0].pincode);
$(".profileProfileImage").append("<img src='" + data.profileDetails[0].profile_pic + "'/>");
$(".profileWallet").html(data.profileDetails[0].wallet);
$("#profileProfileImage").append("<img src='" + data.profileDetails[0].profile_pic + "'/>");
});
});


});
 </script>

  </br>
<section class="welcome">



<br>	
<form class="change" action='<c:url value="adminpasswordchangesuccess" />' method="POST" id="change" >


 <input type="hidden" name="emailId" /> 
 
  <!-- <span class="title">FirstName:</span> <span class="profileFirstName">  </span><br>
                 <span class="title">LastName:</span> <span class="profileLastName">  </span><br>
        -->     
  	<!-- <input  class="title">emailId:</input> <span class="profileEmailId"> </span><br> --> 
  
  <!-- <span class="title"></span> <span class="profileEmailId"> </span><br> -->  
<table>
<tr>
<td> Old Password</td>
<td>
<input type="password" name="old_password" id="oldpassword">
                    <div id="id_res_div" class="error" style="max-width: 200px"></div>
 
 </td>

</tr>
<tr>
<td>New-Password</td>
<td><input type="password" name="password" id="password" > </td>
</tr>
<tr>
<td>Re-Enter-New-Password</td>
<td><input type="password" name="rpassword" id="rpassword" > </td>
</tr>


<tr>

<td colspan="2"><center><input type="Submit" value="Save" id="Submit"> </center> </td>

</tr>

</table>

</form>
</section>

<br>
</body>
