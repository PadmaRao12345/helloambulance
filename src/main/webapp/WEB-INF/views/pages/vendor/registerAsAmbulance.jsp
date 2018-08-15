<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html; charset=ISO-8859-1" language="java"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<div class="col-md-9">
	<div class="profile-content">
		<h3 class="padding:10px">Profile</h3>
		<div class="row ">
			<div class="col-sm-9 ">
				<div>
					<span class="title">Name:</span> <span class="profileName"></span><br>
					<span class="title">E-Mail ID:</span> <span class="profileEmailId"></span><br>
					<span class="title">Mobile No:</span> <span class="profileMobileNumber"> </span><br>
						<span class="title">Date Of Birth:</span> <span class="profileDateOfBirth"> </span><br> <span
						class="title">Gender:</span> <span class="profileGender"></span><br>
					<span class="title">BloodGroup:</span> <span
						class="profileBloodGroup"> </span><br> <span class="title">Register As:</span> <span class="profileRegisterAs"></span><br>
				</div>
			</div>
		</div>
	</div>
</div>
 
<script type="text/javascript">
      $(document).ready(function(){
$.getJSON("<c:url value='/vendor/getProfileDetails/'/>", {
ajax : "true"
}, function(data) {
var profileDetails =  data;
$(".profileName").html(data.profileDetails[0].name);
$(".profileMobileNumber").html(data.profileDetails[0].mobile_no);
$(".profileEmailId").html(data.profileDetails[0].email_id);
$(".profileDateOfBirth").html(data.profileDetails[0].date_of_birth);
$(".profileGender").html(data.profileDetails[0].gender);
$(".profileBloodGroup").html(data.profileDetails[0].blood_group);
$(".profileRegisterAs").html(data.profileDetails[0].register_as);
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
<!--  -->
</html>



