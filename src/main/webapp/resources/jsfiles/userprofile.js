  
      $(document).ready(function(){
$.getJSON("<c:url value='/user/getProfileDetails/'/>", {
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
      
      
      $(document).ready(function() {
    	  $("#logouttime").click(function() {
    	  $.ajax({
    	  url : 'timelogout'

    	  });
    	  });
    	  });
 

    