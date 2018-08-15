<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet"  	href='<c:url value="../resources/cssfiles/style.css"/>'>
<link rel="stylesheet"  	href='<c:url value="../resources/cssfiles/user.css"/>'>

<!--  <div class="col-md-9">
            <div class="profile-content">
			   <div class="row ">
         <div class="col-sm-6 ">
            <div class="profile-inf">
           <span class="title">Name:</span> <span class="profileName"> GURDEEP OSAHAN </span><br>
            <span class="title">Mobile No:</span> <span class="profileMobileNumber">12345678912 </span><br>
             <span class="title">E-Mail ID:</span> <span class="profileEmailId">GURDEEPOSAHAN@GMAIL.COM </span><br>
             <span class="title">DOB:</span> <span class="profileDateOfBirth">07/08/1992 </span><br>
             <span class="title">Gender:</span> <span class="profileGender">Male</span><br>
             <span class="title">BloodGroup:</span> <span class="profileBloodGroup">O+ve </span><br>
             <span class="title">Country:</span> <span class="profileCountry">India</span><br>
             <span class="title">State:</span> <span class="profileState">Telangana </span><br>
              <span class="title">City:</span> <span class="profileCity">hyd</span><br>
               <span class="title">PinCode:</span> <span class="profilePinCode">507001 </span><br>
                           <h4>Name:</h4><span class="inf">praveen</span><br>
               <h4>Name:</h4><span class="inf">praveen</span>
             </div>
         </div>
         <div class="col-sm-6 ">
            <div class="profile-inf">
            </div>
         </div>
       </div>
            </div>
		</div> --> -->
		 <script type="text/javascript">
      $(document).ready(function(){
$.getJSON("<c:url value='/helloambulance/admin/view/'/>", {
ajax : "true"
}, function(data) {
var profileDetails =  data;
$(".profileName").html(data.profileDetails[0].name);
$(".profileMobileNumber").html(data.profileDetails[0].mobile_number);
$(".profileEmailId").html(data.profileDetails[0].email_id);
$(".profileDateOfBirth").html(data.profileDetails[0].date_of_birth);
$(".profileGender").html(data.profileDetails[0].gender);
$(".profileBloodGroup").html(data.profileDetails[0].blood_group);
$(".profileCountry").html(data.profileDetails[0].country);
$(".profileState").html(data.profileDetails[0].state);
$(".profileCity").html(data.profileDetails[0].city);
$(".profilePinCode").html(data.profileDetails[0].pincode);
$(".profileProfileImage").append("<img src='" + data.profileDetails[0].profile_pic + "'/>");
$(".profileWallet").html(data.profileDetails[0].wallet);
$("#profileProfileImage").append("<img src='" + data.profileDetails[0].profile_pic + "'/>");
});
}); 
      </script> 