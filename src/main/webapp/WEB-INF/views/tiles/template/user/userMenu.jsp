 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- <link rel="stylesheet"	href="resources/cssfiles/style.css"/> -->

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<div>
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#" style="color:#e40000"><i class="fa fa-ambulance"style="font-size: 38px;    "></i></span><span> Ambulance</span></a>
      </div>
      <div>
        <div class="collapse navbar-collapse" id="myNavbar">
         <ul class="nav navbar-nav">
            <li><a  href="user-page"> My Profile </a></li>
            <li><a href="Blogs"> Blogs</a></li>
           <li class="dropdown" ><a  data-toggle="dropdown" >Services</a>
       			 <ul class="dropdown-menu">
                <li><a href="Doctors">Find Doctors</a></li>
                <li><a href="Hospitals">Find Hospitals</a></li>
                </ul>
                   <li><a href="Addmembers">Family Members</a></li>
                <!--  <li><a href="upload_image">upload</a></li>-->
<!--                 <li><a href="google_map">google-map</a></li> 
 -->                
              </ul>
         <ul class="nav navbar-nav pull-right">
           <a href="Emergency_Book" style="border-radius:none;color:green; height:35px;margin:30px 0 0 0"   >EMERGENCY</a>
           
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> <div  style="height:30px"> Hi <span class="profileName"></span></a>
             <ul class="dropdown-menu">
          <li class="link"><a  href="user-page">My Profile </a></li>
               <li><a href="changePassword">Change password</a></li>
           <li><a href="friendslist">friends</a></li>
<!--            <li><a href="upload_image">upload Profile</a></li>
 --><!--                  <li><a href="changePassword">Change Password</a></li> -->
                <li ><a  href="javascript:formSubmit()" id="logouttime">logout</a></li>            
             </ul>
           </li>
         
          </ul>
        </div>
      </div>
    </div>
  </nav>
  <div class="container-fluid" style="margin-top: 75px;" >
      <div class="row profile">
		<div class="col-md-3">
  	
	<ul id="accordion" class="accordion">
      <li>
   <div class="col col_4 iamgurdeep-pic">
<!--      <span><label for="imageUpload" class="btn profile-button" style="position:relative;"><a href="upload_image">Edit</a></label></span>
 --> 
 <c:if test="${PIC==null}"> 
 <c:if test="${gender=='Male'}">
 
  <img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="../resources/images/user_male_dummy.jpg" > 
  </c:if>
  <c:if test="${gender=='Female'}">
  <img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="../resources/images/user_female_dummy.png" > 
  </c:if>
  </c:if> 
<c:if test="${PIC!=null}"><img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="data:image/jpg;base64, <c:out value='${PIC}'/>" ></c:if>


  <div class="username">
   <span style="position:relative;"><label for="imageUpload" class="btn profile-button" style="position:relative;"><a href="upload_image">Edit</a></label></span>
      <h2><span class="profileName"></span>  <small><i class="fa fa-map-marker"></i> <span class="profileCountry"></span> <span class="profileState"></span></small></h2>
  </div>

  </div> 

      </li>
  		
  		
  		<li>
  			<div class="link"><i class="fa fa-code"></i>My Account<i class="fa fa-chevron-down"></i></div>
        <ul class="submenu">
          <li class="link"><a  href="user-page">My Profile </a></li>
  			<li class="link"><a href="changePassword">Account Settings</a></li>
  			<li class="link"><a  href='Addmembers'/>Add Members</a></li>
        </ul>
  		</li>
  		
  		
  		
  		<li>
  			<div class="link"><i class="fa fa-code"></i>Bookings<i class="fa fa-chevron-down"></i></div>
        <ul class="submenu">
          <li class="">  <a href="#">dropdown1</a> </li>
          <li class="">  <a href="#">dropdown1</a> </li>
          <li class="">  <a href="#">dropdown1</a> </li>
          <li class="">  <a href="#">dropdown1</a> </li>
        </ul>
  		</li>
  		<li>
  			<div class="link"><i class="fa fa-exchange"></i>Transations <i class="fa fa-chevron-down"></i></div>
  			<ul class="submenu">
  				<li class="">  <a href="#">dropdown1</a> </li>
          <li class="">  <a href="#">dropdown1</a> </li>
          <li class="">  <a href="#">dropdown1</a> </li>
          <li class="">  <a href="#">dropdown1</a> </li>
  			</ul>
  		</li>
  		<li><div class="link"><i class="fa fa-users"></i>Friends<a></a> <i class="fa fa-chevron-down"></i></div>
  			<ul class="submenu">
      			<!-- <li class="photosgurdeep"><a href="#"><img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="http://webncc.in/img/user/gurdeep-singh-osahan.jpg">
  				</a>
                  <a href="#"><img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="http://webncc.in/img/user/gurdeep-singh-osahan.jpg">
      			</a>
                  <a href="#"><img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="http://webncc.in/img/user/gurdeep-singh-osahan.jpg">
      			</a>
                  <a href="#"><img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="http://webncc.in/img/user/gurdeep-singh-osahan.jpg">
      			</a> -->
      			 <c:forEach items="${members}" var="family">
        <li class=""> <a href="profiledetailsAddMembers/ <c:out value="${family.family_member_id}"></c:out>"><img src="../resources/images/Pj.jpg" width="100" height="100" ></a> <c:out value="${family.name}"></c:out> </li><br>
        <a href="deletemember/<c:out value="${frienddetails.getFamily_member_id()}"></c:out>" ><button>delete</button></a>
        <a href="../user/updatemember/${frienddetails.getFamily_member_id()}"><button>update</button></a>
        </c:forEach>
  				</li>
  			</ul>
  		
  <div class="modal fade" id="emergency" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> EMERGENCY BOOK</h4>
        </div>
        <div class="modal-body" style="padding:20px">
          <form class="form emergency">
        <input type="text" placeholder="Mobile Number" style="">
        <!-- <button class="btn btn-danger pull-right" style="border-radius:none;padding:10px;">SIGN IN</button> -->
        <input type="text" placeholder="Address" style="">
        <button class="btn btn-danger pull-right" style="border-radius:none;">SHARE LOCATION <i class="fa fa-map-marker"></i></button><br>
        <button class="btn btn-danger " style="border-radius:none;">Send</button>
      </form>
        </div>
      </div>
    </div>
  </div>
  
  <div class="modal fade" id="prebook" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> PRE BOOKING</h4>
        </div>
        <div class="modal-body" style="padding:20px">
          <form class="form emergency">
            <input type="text" placeholder="Patient Name" style="">
              <input type="text" placeholder="Mobile Number" style="">
                <input type="text" placeholder="Blood Group" style="">
                <input type="text" placeholder="Start Point" style=""><button class="btn btn-danger">Source <i class="fa fa-map-marker"></i></button>
                  <input type="text" placeholder="End Point" style=""><button class="btn btn-danger">Destination <i class="fa fa-map-marker"></i></button>
        <input type="text" placeholder="Mobile Number" style="">
        <button class="btn btn-danger " style="border-radius:none;">BOOK</button>
        
        
        
      </form>
      <script type="text/javascript">
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

      </script>
    
         </div>
      </div>
    </div>
  </div>
  </div>
  </body>
  
   