  <%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>

/*-- banner --*/
.banner {
    background:url(resources/images/bike2.png)no-repeat center 0px;
    background-size:cover;
	position: relative;	 
	margin-top:95px;
} 

/*-- banner-text --*/
.banner-text {
  /*   padding:14em 0 19em; */
        margin: 10% auto;
        color:white;
}


a.buy {
    font-size: 1em;
    color: #fff;
    padding: 0.7em 2em;
    margin: 2em auto 0;
    text-align: center;
    border-radius: 5px;
    border: 2px solid;
    position: relative;
    z-index: 1;
    -webkit-backface-visibility: hidden;
    -moz-osx-font-smoothing: grayscale;
    display: inline-block;
}
/* Individual button styles */
.btn-wayra {
	overflow: hidden;
	-webkit-transition: border-color 0.3s, color 0.3s;
	transition: border-color 0.3s, color 0.3s;
	-moz-transition: border-color 0.3s, color 0.3s;
	-webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
	transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
	-moz-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}
.btn-wayra::before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 150%;
	height: 100%;
	background:#ea7686;
	z-index: -1;
	-webkit-transform: rotate3d(0, 0, 1, -45deg) translate3d(0, -3em, 0);
	transform: rotate3d(0, 0, 1, -45deg) translate3d(0, -3em, 0);
	-moz-transform: rotate3d(0, 0, 1, -45deg) translate3d(0, -3em, 0);
	-o-transform: rotate3d(0, 0, 1, -45deg) translate3d(0, -3em, 0);
	-ms-transform: rotate3d(0, 0, 1, -45deg) translate3d(0, -3em, 0);
	-webkit-transform-origin: 0% 100%;
	transform-origin: 0% 100%;
	-moz-transform-origin: 0% 100%;
	-webkit-transition: -webkit-transform 0.3s, opacity 0.3s, background-color 0.3s;
	transition: transform 0.3s, opacity 0.3s, background-color 0.3s;
	-moz-transition: -moz-transform 0.3s, opacity 0.3s, background-color 0.3s;
}
.btn-wayra:hover {
	color: #fff;
	border-color:#ea7686;
}
.btn-wayra.button--inverted:hover {
	color:#ea7686;
	border-color: #fff;
}
.btn-wayra:hover::before {
	opacity: 1;
	background-color:#ea7686;
	-webkit-transform: rotate3d(0, 0, 1, 0deg);
	transform: rotate3d(0, 0, 1, 0deg);
	-moz-transform: rotate3d(0, 0, 1, 0deg);
	-o-transform: rotate3d(0, 0, 1, 0deg);
	-ms-transform: rotate3d(0, 0, 1, 0deg);
	-webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
	transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
	-moz-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}
.btn-wayra.button--inverted:hover::before {
	background-color: #fff;
}
/*-- //banner --*/
/*-- slid --*/
.slid  {
    background: url(resources/images/bike2.png)no-repeat center;
    background-size: cover;
    min-height: 458px;
	position:relative;
	overflow:hidden;
}
.bg_overlay{
background: #0e0d0d73;
    height: 500px;
    margin: -20px;
}
.slid-text {
   padding: 2em 2em;
    width: 65%;
    background: rgba(55, 60, 74, 0.63);
    position: absolute;
    top: 0;
    right: -65%;
    -webkit-transition: .5s all;
    -moz-transition: .5s all;
    transition: .5s all;
    height: 100%;
}
.slid:hover .slid-text {
    right:0%;
}
.slid h4 {
    font-size: 3em;
    color: #ffffff;
    font-weight: 300;
    margin-bottom: 0.8em;
}
.slid p {
    color: #fff;
    line-height: 2em;
    letter-spacing: 2px;
}
/*-- //slid --*/
/*-- services --*/
h3.agileits-title.w3title2 {
    text-align: center; 
}
.services-row-agileinfo { 
	text-align:center;
}
.services-w3grid:nth-child(3) {
    margin-bottom: 3em;
}
.services-w3grid h5 {
    font-size: 1.5em;
    margin: 0.8em 0 .5em;
    color:#222; 
}
.services-w3grid p {
    margin: 0 3em;
}  
/*-- Effect 1 --*/
.services-w3grid span {
    width: 70px;
    height: 70px;
    font-size: 1.5em;
    color: #d9534f;
    display: inline-block;
    text-decoration: none;
    z-index: 1;
    padding: 1.1em 0;
    background: #fff;
    border: 2px solid;
    -webkit-border-radius: 50%;
    -moz-border-radius: 50%;
    -o-border-radius: 50%;
    -ms-border-radius: 50%;
    border-radius: 50%;
    -webkit-transition: .5s all;
    -moz-transition: .5s all;
    -ms-transition: .5s all;
    -o-transition: .5s all;
    transition: .5s all;
    position: relative;
}
.hi-icon:after { 
    position: absolute;
    width: 100%;
    height: 100%;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	-o-border-radius: 50%;
	-ms-border-radius: 50%;
    border-radius: 50%;
    content: '';
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box;
	top: -8px;
    left: -8px;
    padding: 8px;
    z-index: -1;
    opacity: 0;
	-webkit-box-shadow:3px 3px #d9534f;
	-moz-box-shadow:3px 3px #d9534f;
	-ms-box-shadow:3px 3px #d9534f;
	-o-box-shadow:3px 3px #d9534f;
	box-shadow:3px 3px #d9534f;
    -webkit-transform: rotate(-90deg);
    -moz-transform: rotate(-90deg);
    -ms-transform: rotate(-90deg);
    transform: rotate(-90deg);
    -webkit-transition: opacity 0.2s, -webkit-transform 0.2s;
    -moz-transition: opacity 0.2s, -moz-transform 0.2s;
    transition: opacity 0.2s, transform 0.2s;
} 
.services-w3grid:hover .hi-icon:after {
    opacity: 1;
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    transform: rotate(0deg);
}
.services-w3grid  span.hi-icon:before { 
    -webkit-transition:.5s all;
	-moz-transition:.5s all;
	-ms-transition:.5s all;
	-o-transition:.5s all;
	transition:.5s all;
}
.services-w3grid:hover span.hi-icon:before {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1.2);
    opacity: 1;
    display: inline-block; 
}

/*-- //Effect 1 --*/ 
/*-- //services --*/ 
/* bolgs */
#pricing{
  background: url(resources/images/bg_hsptl2.png)no-repeat center;
    background-size: cover;
    min-height: 458px;
	position:relative;
	overflow:hidden;
}
.bolg_overlay{
background:#0e0d0d73;
height:500px;
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
		 
		 
		 $(document).ready(function() {
			 $('#Blood_group').focus(function() {
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
		});
		 /* email*/
			
			$(document).ready(function() {
				$("#email_id").change(function() {
					$.ajax({
						url : 'check_avail',
						data : {
							emailId : $("#email_id").val()
						},
						success : function(data) {
//							$("#id_res_div").html(data);
							if(data==""){
								$("#id_res_div").html(data);
								  $("#submit").removeAttr("disabled");
								 
							}
							else{
								$("#id_res_div").html(data);
								 $("#submit").attr("disabled", "disabled");
							}	
						}
					});
				});
			});
		
			$(document).ready(function() {
				$("#mobile_number").change(function() {
					$.ajax({
						url : 'check_mobile_avail',
						data : {
							mobileNumber : $("#mobile_number").val()
						},
						success : function(data) {
							//$("#id_div").html(data);
							//$("#id_div").html(data);
							if(data==""){
								$("#id_div").html(data);
								  $("#submit").removeAttr("disabled");
								 
							}
							else{
								$("#id_div").html(data);
								 $("#submit").attr("disabled", "disabled");
							}	
						}
					});
				});
			});
 
 });
 
 $(document).ready(function() {
	 $("#btn-login").click(function() {
	 $.ajax({
	 url : 'user/Login_history'
	 
	 });
	 });
	 });
	 </script>
 
 
 
	

   <div class="modal fade" id="emergency" role="dialog">
    <div class="modal-dialog modal-sm" >
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> EMERGENCY BLOCK</h4>
        </div>
        <div class="modal-body" style="padding:20px">
          <form class="form emergency">
            <div class="group input_form_sign  ">
              <input class="inputMaterial"  type="text"  name="mbno" id="" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <div class="lef"><label>Mobile Number</label></div>
            </div>
            <div class="group input_form_sign  ">
              <input class="inputMaterial"  type="text"  name="cause" id="" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <div class="lef"><label>Cause</label></div>
            </div>
            <div class="group input_form_sign ">
              <input type="text" class=" inputMaterial address"  name="address" id="" required>
              <i class=" btn fa fa-map-marker map pull-right"></i>
              <span class="highlight"></span>
              <span class="bar"></span>
              <div class="lef"><label>Address</label></div>
            </div>
            <!-- <button class="btn btn-danger pull-right" style="border-radius:none;padding:10px;">SIGN IN</button> -->

            <!-- <button class="btn btn-danger pull-right" style="border-radius:none;">SHARE LOCATION <i class=" btn fa fa-map-marker"></i></button><br> -->
            <button class="btn btn-danger " style="border-radius:none;">Send</button>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="signin" role="dialog">
    <div class="modal-dialog modal-sm">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> SIGN IN</h4>
        </div>
        <div class="modal-body" style="padding:20px">
          <form class="form signin" method="POST"  action='<c:url value="/user/login"/>' >
            <div class="group input_form_sign  ">
              <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />		
              <input class="inputMaterial"  type="text"   name='j_username' id="j_username" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <div class="lef"><label>Username</label></div>
            </div>
            <div class="group input_form_sign  ">

              <input  class="inputMaterial"  type="password" id="password" name='j_password' required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <div class="lef"><label>Password</label></div>
              
            </div>
            <div class=" link_forgot_pass  ">
              <a href="forgotPassword" class="forgotPassword " >Forgot Password ?</a>
            </div>
            <div class=" link_forgot_pass  ">
            New user ? <a href="#" class=" " data-dismiss="modal" data-toggle="modal" data-target="#user_reg">click here </a>
            </div>

            <div class="cont_btn ">
              <button class=" btn btn-danger btn_sign" id="btn-login">SIGN IN</button>
            </div>
          </form>
          <!-- <form class="form signin">
            <input type="text" placeholder="Registered Mobile Number" style="">
            <input type="text" placeholder="Password" style=""><BR>
              <A HREF="#"  data-dismiss="modal" data-toggle="modal" data-target="#user_reg">Register as New User here>></A><br>
              <button class="btn btn-danger " style="border-radius:none;">SIGN IN</button>
            </form> -->
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="user_reg" role="dialog">
      <div class="modal-dialog" style="overflow-y: overlay;height:85%;">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title"> REGISTER</h4>
          </div>
          <div class="modal-body" style="padding:20px">
            <form class=" register"  method="POST"  action="usersuccess">
              <div class="row">
            <div class="col-sm-6" style="border-right: 1px solid #e5e5e5">
              <div class="group input_form_sign ">
                <input  class="inputMaterial"   type="text" name="name"id="name" minlength="3" maxlength="25" required>
                <span class="highlight"></span>
                <span class="bar"></span>
                <div class="lef"><label>Username</label></div>
              </div>
                <div class="group input_form_sign ">
                <input type="text" class=" inputMaterial"  name="mobile_number" maxlength="10" id="mobile_number" required>
                <span class="highlight"></span>
                <span class="bar"></span>
                <div class="lef">  <label>Mobile No.</label></div>
                 <div id="id_div" class="error"></div>
              </div>
              <div class="group input_form_sign  ">
                <input class="inputMaterial"  type="text"  name="email_id" id="email_id" required>
                <span class="highlight"></span>
                <span class="bar"></span>
                <div class="lef"><label>E-mail Id</label></div>
                 <div id="id_res_div" class="error"></div>
              </div>
              <div class="group input_form_sign  ">
                <input  class="inputMaterial"  type="password" id="password" name="password" minlength="8" maxlength="12" required>
                <span class="highlight"></span>
                <span class="bar"></span>
                <div class="lef"><label>Password</label></div>
              </div>
             
              <div class="group input_form_sign ">
                <input  class="inputMaterial dob " type="text" name="date_of_birth" id="date_of_birth" required>
                <span class="highlight"></span>
                <span class="bar"></span>
                <div class="lef">  <label>DateOfBirth</label></div>
              </div>
              <div class="group input_form_sign " >
                <select name="gender" class="inputMaterial gender" id="gender" required >
                  <option value="">choose Gender</option>
                  <option value="1"> Male</option>
                  <option value="2">Female </option>
                  <option value="3">Transgender </option>
                </select>
              </div>
              </div>
             <div class="col-sm-6">
            <div class="group input_form_sign ">
                <select name="blood_group" class="inputMaterial gender" id="Blood_group" required >
                      <option value="">-select Blood Group-</option>
                 <!--  <option value="1"> B+ve</option>
                  <option value="2">O+ve </option>
                  <option value="3">B-ve </option> -->
                </select>
              </div>
           
            <!--  <div class="group input_form_sign ">
                <input type="text" class=" inputMaterial"  name="address" id="" required>
                <span class="highlight"></span>
                <span class="bar"></span>
                <div class="lef">  <label>ADDRESS</label></div>
              </div> -->
              
             <div class="group input_form_sign " >
                <select name="country" class="inputMaterial gender" id="country" required >
                  <option value="">-select country-</option>
                  <option value="101">INDIA</option>
               
                </select>
              </div>
              
              <div class="group input_form_sign " >
                <select name="state" class="inputMaterial gender" id="state" required >
                  <option value="">-select state-</option>
                  <option value="36">TELANGANA</option>
                </select>
              </div>
               <div class="group input_form_sign ">
                <select name="city" class="inputMaterial gender" id="city" required >
                  <option value="">-select city-</option>
                 
                </select>               
              </div>                                 
              <!-- <div class="group input_form_sign ">
                <input type="text" class=" inputMaterial" maxlength="6" name="pincode" id="pincode" required>
                <div class="lef"><label>PINCODE</label></div>
              </div> -->
            <div class="group input_form_sign ">
                <input  class="inputMaterial"   type="text" name="pincode"id="pincode" maxlength="6" required>
                <span class="highlight"></span>
                <span class="bar"></span>
                <div class="lef"><label>pincode</label></div>
              </div>
	<div class="form-group">
 <input type="checkbox" name="checkbox" value="check" id="agree" required/> <P> I have read and agree to the Terms and Conditions and Privacy Policy </p>
    
 </div>
            </div>
          </div>
          
              <div class=" ">
             <a HREF="#"  data-dismiss="modal" data-toggle="modal" data-target="#signin">Already registered signin here>> </a><br>
             </div>
              <div class="cont_btn">
                <button class="btn btn-danger " style="border-radius:none;" id="submit">REGISTER</button>
              </div>
            </form>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="prebook" role="dialog">
        <div class="modal-dialog modal-sm">
          <!-- Modal content-->
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title"> PRE BOOKING</h4>
            </div>
            <div class="modal-body" style="padding:20px">
              <form class="form pre_book">

                <div class="group input_form_sign ">
                  <input type="text" class=" inputMaterial"  name="patient" id="" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef">  <label>Patient Name</label></div>
                </div>
                <div class="group input_form_sign ">
                  <input type="text" class=" inputMaterial"  name="mobile" id="" maxlength="10" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef">  <label>Mobile Number</label></div>
                </div>
                <div class="group input_form_sign ">
                  <input type="text" class=" inputMaterial"  name="blood_group" id="" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef">  <label>Blood Group</label></div>
                </div>
                <div class="group input_form_sign ">
                  <input type="text" class=" inputMaterial start"  name="start" id="start" required>
                  <a href=""><i class=" btn fa fa-map-marker map pull-right"></i></a>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef"><label>Start Point</label></div>
                </div>
                <div class="group input_form_sign ">
                  <input type="text" class=" inputMaterial end"  name="end" id="end" required>
                  <i class="btn fa fa-map-marker map pull-right"></i>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef">  <label>End Point</label></div>
                </div>
                <!-- <div class="group input_form_sign ">
                  <input type="text" class=" inputMaterial"  name="pincode" id="pincode" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef">  <label>Mobile Number</label></div>
                </div> -->
                <!-- <input type="text" placeholder="Patient Name" style="">
                <input type="text" placeholder="Mobile Number" style="">
                <input type="text" placeholder="Blood Group" style="">
                <input type="text" placeholder="Start Point" style=""><button class="btn btn-danger">Source <i class="fa fa-map-marker"></i></button>
                <input type="text" placeholder="End Point" style=""><button class="btn btn-danger">Destination <i class="fa fa-map-marker"></i></button>
                <input type="text" placeholder="Mobile Number" style=""> -->
                <button class="btn btn-danger " style="border-radius:none;">BOOK</button>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="banner jarallax">
              <div class="bg_overlay">
		 <div class="container">
                 <div class="row banner-text">
                  <div class="col-sm-9">
                <h2>24/7 Customer Service Support</h2>
			<p>Proin tincidunt sodales faucibus. Curabitur ut metus sed urna 
			dignissim sodales ac a tellus. Sed varius justo tellus, at convallis 
			libero cursus non. In malesuada accumsan felis, a imperdiet arcu blandit 
			sed. Ut id faucibus eros. Fusce sed vulputate dui, non consectetur felis.
			 Etiam id enim sem. Suspendisse commodo tempor magna </p>
			 <a href="#about" class="buy btn-wayra scroll"> More About</a>
                  </div>
                  <div class="col-sm-3">
                  </div>
                </div> 
		<div class="clearfix"> </div>
			</div>
	</div>
	</div>
      <!-- Container (About Section) -->
      <div id="about" class="about">
      <div class="container-fliud">
  
          <div class="how1" style="background:#fff;">
           
            <div class="container howitwork1 ">
              <div><h3  class="work_titles"> NEED HELP??</h3></div>
              <div class="col-sm-3">
              </div>
              <div class="col-sm-9">
                <div style="color: #282e34;text-align:center;padding:50px 80px;text-align: justify;">
                  <p>Scroll up and down to really get the feeling of how Parallax Scrolling works.
                    Scroll up and down to really get the feeling of how Parallax Scrolling works.
                    Scroll up and down to really get the feeling of how Parallax Scrolling works.</p>
                  </div>
                </div>
              </div>
            </div>
            <div class="how1" style="  background: #e7e7e7;">
              <div class="container howitwork2">
                <div>  <h3 class="work_titles"> AMBULANCE SERVICE</h3></div>
                <div class="col-sm-3">
                </div>
                <div class="col-sm-9">
                  <div style="color: #282e34;text-align:center;padding:50px 80px;text-align: justify;">
                    <p style="color:#2e5367;">Scroll up and down to really get the feeling of how Parallax Scrolling works.
                      Scroll up and down to really get the feeling of how Parallax Scrolling works.
                      Scroll up and down to really get the feeling of how Parallax Scrolling works.</p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="how1" style="  background: #fff;">
                <div class="container howitwork3">
                  <h3 class="work_titles">FIRST AID</h3>
                  <div class="col-sm-3">
                  </div>
                  <div class="col-sm-9">

                    <div style="color: #282e34;text-align:center;padding:50px 80px;text-align: justify;">
                      <p>Scroll up and down to really get the feeling of how Parallax Scrolling works.
                        Scroll up and down to really get the feeling of how Parallax Scrolling works.
                        Scroll up and down to really get the feeling of how Parallax Scrolling works.</p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="how1" style="  background:#e7e7e7; ">
                  <div class="container howitwork4">
                      <h3 class="work_titles">REACH HOSPITAL</h3>
                    <div class="col-sm-3">
                    </div>
                    <div class="col-sm-9">

                      <div style="color: #282e34;text-align:center;padding:50px 80px;text-align: justify;">
                        <p style="color:#2e5367;">Scroll up and down to really get the feeling of how Parallax Scrolling works.
                          Scroll up and down to really get the feeling of how Parallax Scrolling works.
                          Scroll up and down to really get the feeling of how Parallax Scrolling works.</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            
            
              <div class="slid jarallax">
              <div class="bg_overlay">
            
		<div class="slid-text">
		 <h2 >Our Values</h2>
			<h4>24/7 Customer Service Support</h4>
			<p>Proin tincidunt sodales faucibus. Curabitur ut metus sed urna dignissim sodales ac a tellus. Sed varius justo tellus, at convallis libero cursus non. In malesuada accumsan felis, a imperdiet arcu blandit sed. Ut id faucibus eros. Fusce sed vulputate dui, non consectetur felis. Etiam id enim sem. Suspendisse commodo tempor magna </p>
		</div>
		<div class="clearfix"> </div>
	</div>
	</div>
	
              
              <!-- Container (Services Section) -->
              
              <div id="services" class="services">
		<div class="container text-center"> 
		<h2>OUR SERVICES</h2>
			<!-- <h3 class="agileits-title w3title2"><span>S</span>ervices</h3> -->
			<div class="services-row-agileinfo">
				<div class="col-sm-4 col-xs-6 services-w3grid slideanim" >
					<span class="fa fa-ambulance logo-small hi-icon" aria-hidden="true"></span>
					<h5>Cum soluta nobis</h5>
					<p>Itaque earum rerum hic a sapiente delectus finibus gravida</p>
				</div>
				<div class="col-sm-4 col-xs-6 services-w3grid slideanim">
					<span class="fa fa-heartbeat hi-icon" aria-hidden="true"></span>
					<h5>Soluta vum nobis</h5>
					<p>Itaque earum rerum hic a sapiente delectus finibus gravida</p>
				</div>
				<div class="col-sm-4 col-xs-6 services-w3grid slideanim">
					<span class="fa fa-bell hi-icon" aria-hidden="true"></span>
					<h5>Nobis cum soluta</h5>
					<p>Itaque earum rerum hic a sapiente delectus finibus gravida</p>
				</div> 
				<div class="col-sm-4 col-xs-6 services-w3grid slideanim">
					<span class="fa fa-user-md hi-icon" aria-hidden="true"></span>
					<h5>Cum soluta nobis</h5>
					<p>Itaque earum rerum hic a sapiente delectus finibus gravida</p>
				</div>
				<div class="col-sm-4 col-xs-6 services-w3grid slideanim">
					<span class="fa fa-leaf hi-icon" aria-hidden="true"></span>
					<h5>Soluta vum nobis</h5>
					<p>Itaque earum rerum hic a sapiente delectus finibus gravida</p>
				</div>
				<div class="col-sm-4 col-xs-6 services-w3grid slideanim">
					<span class="fa fa-gears hi-icon" aria-hidden="true"></span>
					<h5>Nobis cum soluta</h5>
					<p>Itaque earum rerum hic a sapiente delectus finibus gravida</p>
				</div> 
				<div class="clearfix"> </div>
			</div> 
		 </div>
	</div>
              
           <!--    <div id="services" class="container-fluid text-center">
                <h2>OUR SERVICES</h2>
                <br>
                <div class="row slideanim">
                  <div class="col-sm-4">
                    <i class="fa fa-ambulance logo-small" ></i>
                    <h4>AMBULANCE</h4>
                    <p>We provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served. </p>
                  </div>
                  <div class="col-sm-4">
                    <i class="fa fa-heartbeat logo-small"></i>
                    <h4>CARE</h4>
                    <p>We provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served. </p>
                  </div>
                  <div class="col-sm-4">
                    <i class="fa fa-user-md logo-small" ></i>
                    <span class="glyphicon glyphicon-lock "></span>
                    <h4>JOB DONE</h4>
                    <p>We provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served. </p>
                  </div>
                </div>
                <br><br>
                <div class="row slideanim">
                  <div class="col-sm-4">
                    <span class="glyphicon glyphicon-leaf logo-small"></span>
                    <h4>GREEN</h4>
                    <p>We provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served. </p>
                  </div>
                  <div class="col-sm-4">
                    <span class="glyphicon glyphicon-certificate logo-small"></span>
                    <h4>CERTIFIED</h4>
                    <p>We provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served. </p>
                  </div>
                  <div class="col-sm-4">
                    <span class="glyphicon glyphicon-wrench logo-small"></span>
                    <h4 style="color:#303030;">HARD WORK</h4>
                    <p>We provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served. </p>
                  </div>
                </div>
              </div> -->

              <!-- Container (Portfolio Section) -->
              <div id="portfolio" class="bg-grey">
                   <div  class="container text-center ">
                <h2>MEDIA</h2>
                <h4>What we have created</h4>
                <div class="row text-center slideanim">
                  <div class="col-sm-4">
                    <div class="thumbnail overlay">
                    <iframe width="100%" height="250" src="https://www.youtube.com/embed/3RrRXmu_v8E" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    </div>
                  </div>
                  <div class="col-sm-4">
                    <div class="thumbnail overlay">
                    <iframe width="100%" height="250" src="https://www.youtube.com/embed/3RrRXmu_v8E" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    </div>
                  </div>
                  <div class="col-sm-4">
                    <div class="thumbnail overlay">
                    <iframe width="100%" height="250" src="https://www.youtube.com/embed/3RrRXmu_v8E" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    </div>
                  </div>
                </div>
                <div class="row text-center slideanim">
                  <div class="col-sm-4">
                    <div class="thumbnail overlay">
                    <iframe width="100%" height="250" src="https://www.youtube.com/embed/3RrRXmu_v8E" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    </div>
                  </div>
                  <div class="col-sm-4">
                    <div class="thumbnail overlay">
                      <iframe width="100%" height="250" src="https://www.youtube.com/embed/3RrRXmu_v8E" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    </div>
                  </div>
                  <div class="col-sm-4">
                    <div class="thumbnail overlay">
                      <iframe width="100%" height="250" src="https://www.youtube.com/embed/3RrRXmu_v8E" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    </div>
                  </div>
                </div>
                <br>

              </div>
              </div>
              <!-- Container (Contact Section) -->
          
              
              <div id="pricing" >
              <div class="container bolg_overlay ">
                <h2 class="text-center">BLOGS</h2>
                <div id="myCarousel" class="carousel slide slideanim text-center" data-ride="carousel">
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                  </ol>

                  <!-- Wrapper for slides -->
                  <div class="carousel-inner" role="listbox">
                    <div class="item active">
                      <h4>"This company is the best. I am so happy with the result!"<br><span>Michael Roe, Vice President, Comment Box</span></h4>
                    </div>
                    <div class="item">
                      <h4>"One word... WOW!!"<br><span>John Doe, Salesman, Rep Inc</span></h4>
                    </div>
                    <div class="item">
                      <h4>"Could I... BE any more happy with this company?"<br><span>Chandler Bing, Actor, FriendsAlot</span></h4>
                    </div>
                  </div>

                  <!-- Left and right controls -->
                  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
              </div>
              </div>
              <!-- Container (Pricing Section) -->
              <div id="doctors" class=" bg-grey">
                <div  class="container text-center">
              
                <h2>DOCTORS</h2>
                <h4>Our Specialized Doctors</h4>
                <div class="row text-center slideanim">
                        <!-- <div class="col-lg-3 col-sm-4 col-xs-6"><a title="Image 1" href="#"><img class="thumbnail img-responsive" src="//placehold.it/600x350"></a></div>
                        <div class="col-lg-3 col-sm-4 col-xs-6"><a title="Image 2" href="#"><img class="thumbnail img-responsive" src="//placehold.it/600x350/2255EE"></a></div>
                        <div class="col-lg-3 col-sm-4 col-xs-6"><a title="Image 3" href="#"><img class="thumbnail img-responsive" src="//placehold.it/600x350/449955/FFF"></a></div>
                        <div class="col-lg-3 col-sm-4 col-xs-6"><a title="Image 4" href="#"><img class="thumbnail img-responsive" src="//placehold.it/600x350/992233"></a></div>
                        <div class="col-lg-3 col-sm-4 col-xs-6"><a title="Image 5" href="#"><img class="thumbnail img-responsive" src="//placehold.it/600x350/2255EE"></a></div>
                        <div class="col-lg-3 col-sm-4 col-xs-6"><a title="Image 6" href="#"><img class="thumbnail img-responsive" src="//placehold.it/600x350/449955/FFF"></a></div>
                      <hr>
                      <hr> -->
                  <div tabindex="-1" class="modal fade" id="modalpopup" role="dialog">
                    <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                  		<button class="close" type="button" data-dismiss="modal">×</button>
                  		<h3 class="modal-title">Heading</h3>
                  	</div>
                  	<div class="modal-body">
                  <div class="row">
                  <div class="col-sm-4 view_doct">
                  </div>
                  <div class="col-sm-8 view_doct_inf">
                  </div>
                  </div>
                  </div>
                  	 <div class="modal-footer">
                  		<button class="btn btn-default" data-dismiss="modal">Close</button>
                  	</div>
                     </div>
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="thumbnail">
                      <img src="resources/images/d1.png" alt="Paris" width="400"  style="border-radius:50%; height:auto">
                      <p><strong>Paris</strong></p>
                      <p>Yes, we built Paris</p>
                        <div class="doct" style="display:none">
                           <div class="doct_inf" >
                             <h3>Working Hospitals</h3>
                             <p>We provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served.</p>
                           </div>
                         </div>
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="thumbnail">
                      <img src="resources/images/d2.png" alt="New York" width="400"  style="border-radius:50%;height:auto">
                      <p><strong>New York</strong></p>
                      <p>We built New York</p>
                      <div class="doct" style="display:none">
                         <div class="doct_inf" >
                           <h3>Working Hospitals</h3>
                           <p> ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served.</p>
                         </div>
                       </div>                    </div>
                     </div>
                  <div class="col-sm-3">
                    <div class="thumbnail">
                        <img src="resources/images/d3.png" alt="New York" width="400"  style="border-radius:50%;height:auto">
                      <p><strong>New York</strong></p>
                      <p>Yes, San Fran is ours</p>
                      <div class="doct" style="display:none">
                         <div class="doct_inf info" >
                           <h3>Working Hospitals</h3>
                           <p> private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served.</p>
                         </div>
                       </div>
                    </div>
                  </div>
                  <div class="col-sm-3">
                    <div class="thumbnail">
                      <img src="resources/images/d5.png" alt="San Francisco" width="400"  style="border-radius:50%;height:auto">
                      <p><strong>San Francisco</strong></p>
                      <p>Yes, San Fran is ours</p>
                      <div class="doct" style="display:none">
                         <div class="doct_inf" >
                           <h3>Working Hospitals</h3>
                           <p> provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served.</p>
                         </div>
                       </div>
                    </div>
                  </div>
                </div>
                <br>
              </div>
              </div>
              <div id="contact" class=" ">
                            <div class="slideanim container">
              
                <h2 class="patners text-center">Our Hospital Patners</h2>
                <div class="row">
                  <div class="col-sm-4 col-xs-6">
                    <div class="hsptl">
                      <img src="resources/images/h1.png" style="margin-bottom:10px;">
                    </div>
                    <div class="hsptl">
                      <img src="resources/images/h2.png" style="margin-bottom:10px;">
                    </div>
                    <div class="hsptl">
                      <img src="resources/images/h3.png" style="margin-bottom:10px;">
                    </div>
                    <div class="hsptl">
                      <img src="resources/images/h12.png" style="margin-bottom:10px;">
                    </div>
                  </div>
                  <div class="col-sm-4 col-xs-6">
                    <div class="hsptl">
                      <img src="resources/images/h4.png" style="margin-bottom:10px;">
                    </div>
                    <div class="hsptl">
                      <img src="resources/images/h5.png" style="margin-bottom:10px;">
                    </div>
                    <div class="hsptl">
                      <img src="resources/images/h6.png" style="margin-bottom:10px;">
                    </div>
                    <div class="hsptl">
                      <img src="resources/images/h11.png" style="margin-bottom:10px;">
                    </div>
                  </div>
                  <div class="col-sm-4 col-xs-6">
                    <div class="hsptl">
                      <img src="resources/images/h7.png" style="margin-bottom:10px;">
                    </div>
                    <div class="hsptl">
                      <img src="resources/images/h8.png" style="margin-bottom:10px;">
                    </div>
                    <div class="hsptl">
                      <img src="resources/images/h9.png" style="margin-bottom:10px;">
                    </div>
                    <div class="hsptl">
                      <img src="resources/images/h10.png" style="margin-bottom:10px;">
                    </div>
                  </div>
                </div>
              </div>
             </div>


<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){

        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });

  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;
      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
})
</script>

  	
<script>

/**
 * 
 */
/**
 * 
 */

        var autocomplete = new google.maps.places.Autocomplete($(".start")[0], {});
        var autocomplete1 = new google.maps.places.Autocomplete($(".end")[0], {});
          var autocomplete2 = new google.maps.places.Autocomplete($(".address")[0], {});

        google.maps.event.addListener(autocomplete, 'place_changed', function() {
            var place = autocomplete.getPlace();
            // console.log(place.address_components);
        });
        google.maps.event.addListener(autocomplete1, 'place_changed', function() {
            var place = autocomplete1.getPlace();
            // console.log(place.address_components);
        });
        google.maps.event.addListener(autocomplete2, 'place_changed', function() {
            var place = autocomplete2.getPlace();
            // console.log(place.address_components);
        });
   

          $(document).ready(function(){
            $('.carousel').carousel({
              interval: 1500
            })
            // Add smooth scrolling to all links in navbar + footer link
            $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
              // Make sure this.hash has a value before overriding default behavior
              if (this.hash !== "") {
                // Prevent default anchor click behavior
                event.preventDefault();

                // Store hash
                var hash = this.hash;

                // Using jQuery's animate() method to add smooth page scroll
                // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                $('html, body').animate({
                  scrollTop: $(hash).offset().top
                }, 900, function(){

                  // Add hash (#) to URL when done scrolling (default click behavior)
                  window.location.hash = hash;
                });
              } // End if
            });

            $(window).scroll(function() {
              $(".slideanim").each(function(){
                var pos = $(this).offset().top;
                var winTop = $(window).scrollTop();
                if (pos < winTop + 600) {
                  $(this).addClass("slide");
                }
              });
            });
            // image popup
            $('.thumbnail').click(function(){
                  $('.modal-body .view_doct').empty();
                  $('.modal-body .view_doct_inf').empty();
                   // $(".doct").css("display","block");
              	var title = $(this).parent('a').attr("title");
              	$('.modal-title').html(title);
              	$($(this).parents('div').html()).appendTo('.modal-body .view_doct');
                $($(".doct_inf").parents('div').html()).appendTo('.modal-body .view_doct_inf');
              	$('#modalpopup').modal({show:true});
            });
            // image popup

          })

       // </script>
      //  <!--starts links for date of birth validation -->
    //  <!--end links for date of birth validation -->
     // <script type="text/javascript">
      //validation for date of birth
      $(document).ready(function () {
      $(".dob").datepicker({
        minDate: '-50Y',
        maxDate: "-18Y",
        changeMonth: true,
        changeYear: true,
        defaultDate: new Date(),
        dateFormat: 'dd/mm/yy'
      }).attr("readonly", "readonly"); //prevent manual changes
      //validation for date of birth
      //validation for login form
      $( ".signin" ).validate({
        rules: {
          username: {
            required: true,
            minlength: 4,
            user:true,

          },

          pass: {
            required: true,
            /*password : true,*/
            minlength: 8,
          }
        },
        messages : {
          username: {
            required : "Please enter user Username or phone number",
            minlength: "please enter minimum 4 chars",
          },
          pass: {
            required : "Please enter your password (min8 max 12)",
            minlength: "Must contain at least one number and one uppercase and lowercase letter and one special charecter, and at least 8 or more characters and Maximum 12 ",
            password: "please fill required format (eg:Praveen@123)",
          },
        }
      });
      //validation for login form
      //validation for registeration form
      jQuery.validator.addMethod("password", function(value, element) {
        return this.optional( element ) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!,%,&,@,#,$,^,*,?,_,~]).{8,}$/.test( value );
      } );
      jQuery.validator.addMethod("user", function(value, element) {
    	  return this.optional( element ) || /^[a-zA-Z\s-, ]+$/.test( value );
    	 });
      jQuery.validator.addMethod("email", function(value, element) {
    	  return this.optional( element ) || /^[A-z].{1}(?!.*?[.,_]{2}[!,%,\^,&,@,#,$,*,?,~,+,-]{0})[A-z0-9._]+@[A-z0-9]+\.[A-z]{2,4}$/.test( value );
    	 }); 
      jQuery.validator.addMethod("phone", function (value, element) {
    	    return this.optional(element) || /^[6-9]{1}[0-9]{9}$/.test(value);
    	});
      $(".register").validate({
        rules: {
          name:{
            required: true,
            user:true,
          },
          email_id: {
            required: true,
            email: true,
            minlength: 4,
          },
          mobile_number: {
            required: true,
            digits:true,
            phone:true,
            minlength: 10,
            maxlength: 10,
          },
          date_of_birth:{
            required:true,
            date:true,
          },
          password: {
            required: true,
            minlength: 8,
            password:true,

          },
          /*confirm_password: {
            required: true,
            minlength: 8,
            password:true,
            equalTo:'#password',
          },*/

          pincode: {
            required: true,
            minlength: 6,
            maxlength: 6,
            digits:true,
          }
        },
        messages : {
        	email_id: {
            required : "Please specify your valid mail id",
            minlength: "Minimum 3 and Maximum 50",
          },
          mobile_number:  {
            required : "Please enter your mobile number",
            minlength: "Minimum 10 and Maximum 10",
            phone:"please enter valid mobile number",
            digits:"please enter number only",
          },
          date_of_birth:{
            required : "Please enter date of birth",
            date:"please enter valid date",
          },
          name:  {
            required: "Please enter name",
            user:"please enter proper user name",
          },
          pincode:  {
        	  required : "Please enter your pincode",
              minlength: " length should be 6 numbers ",
              
              digits:"please enter number only",
            },
          password: {
            required : "Please enter your password (min8 max 12)",
            minlength: "Must contain at least one number and one uppercase and lowercase letter and one special charecter, and at least 8 or more characters and Maximum 12 ",
            password: "please fill required format (eg:Praveen@123)",
          }
    /*      confirm_password: {
            required : "Please  confirm your password (min8 max 12)",
            password: "Please enter the same password as above",
            equalTo:"Please enter the same password as above",*/
            // notEqual: "Please enter the same password as above",
         /* }*/

        },
      });
      $(".vendor_register").validate({
        rules: {
          hsptl_name:{
            required: true,
            user : true,
            lettersonly:true,
          },
          email: {
            required: true,
            email: true,
            minlength: 4,
          },
          mobile: {
            required: true,
            digits:true,
            minlength: 10,
            maxlength: 10,
          },
          dob:{
            required:true,
          },

          passwd: {
            required: true,
            minlength: 8,
            password:true,

          },
          confirm_passwd: {
            required: true,
            minlength: 8,
            password:true,
            equalTo:'#passwd'
          },
          pincode: {
            required: true,
            minlength: 6,
            digits:true,
          }
        },
        messages : {
          email: {
            required : "Please specify your valid mail id",
            minlength: "Minimum 3 and Maximum 50",
          },
          mobile:  {
            required : "Please enter your mobile number",
            minlength: "Minimum 10 and Maximum 10",
            digits:"please enter number only",
          },
          dob:{
            required : "Please enter date of birth",
          },
          name:  {
            required: "Please enter name",
            user:"please enter proper user name",
          },

          passwd: {
            required : "Please enter your password (min8 max 12)",
            minlength: "Must contain at least one number and one uppercase and lowercase letter and one special charecter, and at least 8 or more characters and Maximum 12 ",
            password: "please fill required format (eg:Praveen@123)",
          },
          confirm_passwd: {
            required : "Please  confirm your password (min8 max 12)",
            password: "Please enter the same password as above",
            equalTo:"Please enter the same password as above",
            // notEqual: "Please enter the same password as above",
          }
        },
      });
      $(".pre_book").validate({
        rules: {
          patient:{
            required: true,
            user : true,
            lettersonly:true,
          },

          mobile: {
            required: true,
            digits:true,
            minlength: 10,
            maxlength: 10,
          },
          blood_group:{
            required:true,
          },
          start: {
            required: true,

          },
          end: {
            required: true,

          },
          pincode: {
            required: true,
            minlength: 6,
            digits:true,
          }
        },
        messages : {
          email: {
            required : "Please specify your valid mail id",
            minlength: "Minimum 3 and Maximum 50",
          },
          mobile:  {
            required : "Please enter your mobile number",
            minlength: "Minimum 10 and Maximum 10",
            digits:"please enter number only",
          },
          blood_group:{
            required : "Please enter date of birth",
          },
          start:  {
            required: "Please enter start location",

          },
          end: {
            required : "Please enter your destination",

          }

        },
      });

      });
    
      // validation for registeration form -->
</script>
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  <%-- 
  
  
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

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
		 
		 
		 $(document).ready(function() {
			 $.getJSON ('<c:url value="/loadBloodGroup/?${_csrf.parameterName}=${_csrf.token}"/>', {
				  bloodGroupId : $(this).val(),
				 ajax : 'true' 
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
						url : 'check_avail',
						data : {
							emailId : $("#email_id").val()
						},
						success : function(data) {
							$("#id_res_div").html(data);
						}
					});
				});
			});
		
			$(document).ready(function() {
				$("#mobile_number").change(function() {
					$.ajax({
						url : 'check_mobile_avail',
						data : {
							mobileNumber : $("#mobile_number").val()
						},
						success : function(data) {
							$("#id_div").html(data);
						}
					});
				});
			});
 
 });
 
 
 
 
   $(document).ready(function() {
 $("#btn-login").click(function() {
 $.ajax({
 url : 'user/Login_history'
 
 });
 });
 }); 
 </script>

 


  <div class="modal fade" id="emergency" role="dialog">
    <div class="modal-dialog">
      Modal content
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> EMERGENCY BLOCK</h4>
        </div>
        <div class="modal-body" style="padding:20px">
          <form class="form emergency">
        <input type="text" placeholder="Mobile Number" style="">
        <button class="btn btn-danger pull-right" style="border-radius:none;padding:10px;">SIGN IN</button>
        <input type="text" placeholder="Address" style="">
        <button class="btn btn-danger pull-right" style="border-radius:none;">SHARE LOCATION <i class="fa fa-map-marker"></i></button><br>
        <button class="btn btn-danger " style="border-radius:none;">Send</button>
      </form>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="signin" role="dialog">
    <div class="modal-dialog"> 
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> SIGN IN</h4>
        </div>
        <div class="modal-body" style="padding:20px">
        <form name="login"  action="<c:url value='/j_spring_security_check'/>"  class="form signin" method="POST">
         <form name="loginForm"
		   action='<c:url value="/user/login"/>'  class="form signin"  method='POST'>
		    <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />			
        <input  type="text" placeholder="Email" name='j_username'  style=""  id="login-username">
          <input type="password" placeholder="Password" name='j_password'   style=""><BR>
          <A HREF="#"  data-dismiss="modal" data-toggle="modal" data-target="#user_reg">Register as New User here>></A><br>
        <button id="btn-login" class="btn btn-danger " style="border-radius:none;">SIGN IN</button>
      
      </form>
        </div>
      </div>
    </div>
  </div>
   <div class="modal fade" id="user_reg" role="dialog">
    <div class="modal-dialog" style="overflow-y:scroll;max-height:85%;max-width:85; ">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> SIGN IN</h4>
        </div>
        <div class="modal-body" style="padding:20px">
        <form class="form signin" action="main-page" method="POST">
         <label for="Name">Name</label>
				<div>
<input type="text" name="name" id="name" tabindex="1"
class="form-control" placeholder="Name" value="" class="form-control input-md">
</div>
           <label for="mobilenumber">Mobilenumber</label>
				<div>
			<input type="number" name="mobile_number" id="mobile_number"
				tabindex="1" class="form-control" maxlength="10"
					placeholder="Mobilenumber" value="" class="form-control input-md">
					<div id="id_div" class="error"></div>
					</div>
          <label for="EmailId">EmailId</label>
				<div>
			<input type="email" name="email_id" id="email_id" tabindex="1"
			class="form-control" placeholder="EmailId" value="" class="form-control input-md">
			 <div id="id_res_div" class="error"></div>
		</div>
		 <label for="Password">Password</label>
				<div>
			<input type="password" name="password" id="password"
			tabindex="2" class="form-control" placeholder="Password" class="form-control input-md">
		</div>
       		 <label for="DateOfBirth">DateOfBirth</label>
				<div>
				<input type="date" name="date_of_birth" id="date_of_birth" tabindex="2"
				class="form-control" placeholder="DateOfBirth" class="form-control input-md">
		</div><br>
        <label for="Gender">Gender</label>
			<div>
		<select id="gender" name="gender" class="form-control">
          <option value="Male">Male</option>
          <option value="Female">Female</option>
          <option value="Other">Other</option>
        </select>
        </div>
       	 <!-- <div class="form-group row"> -->
<label for="BloodGroup" class="col-sm-4 col-form-label">BloodGroup</label>
<div class="col-sm-8">
<select name="Blood_group" class="form-control" id="Blood_group" required >
<option value="">Select BloodGroup</option>
</select>
               </div>
<!-- </div> -->
          <!-- <option value="1">O+ve</option>
          <option value="2">O-ve</option>
          <option value="3">A+ve</option>
          <option value="4">A-ve</option>
          <option value="5">B+ve</option>
          <option value="6">B-ve</option>
          <option value="7">AB+ve</option>
          <option value="8">AB-ve</option>
          <option value="9">Rh-</option> -->
		 </select> 
		</div>
 
		<!-- <div class="form-group row"> -->
<label for="country" class="col-sm-4 col-form-label">Country</label>
<div class="col-sm-8">
               <select name="country" class="form-control" id="country" required>
<option value="">Select Country</option>
<option value="101">INDIA</option>
</select>
               </div>

<!-- <div class="form-group row"> -->
   <label for="state" class="col-sm-4 col-form-label">State</label>
<div class="col-sm-8">
<select name="state" class="form-control" id="state" required>
<option value="">Select State</option>
<option value="36">Telangana</option>
</select>	
               </div>
           <!-- </div> -->
          <!--  <div class="form-group row"> -->
<label for="city" class="col-sm-4 col-form-label">City</label>
<div class="col-sm-8">
<select name="city" class="form-control" id="city" required>
<option value="">Select City</option>
<option value="4460">Hyderabad</option>
</select>
               </div>
<!-- </div> --> 


      
        <div class="form-group">
				<label for="zip">Pincode</label>
				<div>
			<input id="pincode" name="pincode" type="text"
			placeholder="PinCode" class="form-control input-md">
			</div>
			</div>
        
          <BR>
          <A HREF="#"  data-dismiss="modal" data-toggle="modal" data-target="#signin">Already registered signin here>> </A><br>
        <button class="btn btn-danger " style="border-radius:none;">REGISTER</button>
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
        </div>
      </div>
    </div>
  </div>
 
 

<!-- Container (About Section) -->
<div id="about" class="container-fluid">
  <div class="row">
    <section class="main-slider">
    <div id="myCarousel" class="carousel slide carousel-fade" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
      </ol>
      <!-- Carousel items -->
      <div class="carousel-inner">
        <!-- Slide 1 : Active -->
        <div class="item active">
          <img src="https://cl.ly/image/3J45082V2c1L/banner_01.jpg" alt="">
          <div class="carousel-caption">
            <h3>Slide 1</h3>
            <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</p>
          </div><!-- /.carousel-caption -->
        </div><!-- /Slide1 -->
        <!-- Slide 2 -->
        <div class="item ">
          <img src="https://cl.ly/image/2J0z1t033B25/banner_02.jpg" alt="">
          <div class="carousel-caption">
            <h3>Slide 2</h3>
            <p>Etiam porta sem malesuada magna mollis euismod.</p>
          </div><!-- /.carousel-caption -->
        </div><!-- /Slide2 -->

        <!-- Slide 3 -->
        <div class="item ">
          <img src="https://cl.ly/image/1a3i3k0F3B3h/banner_03.jpg" alt="">
          <div class="carousel-caption">
            <h3>Slide 3</h3>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>
          </div><!-- /.carousel-caption -->
        </div><!-- /Slide3 -->

        <!-- Slide 4 -->
        <div class="item ">
          <img src="https://cl.ly/image/1n0A2k0Z111n/banner_04.jpg" alt="">
          <div class="carousel-caption">
            <h3>Slide 4</h3>
            <p>Pellentesque ornare sem lacinia quam venenatis vestibulum.</p>
          </div><!-- /.carousel-caption -->
        </div><!-- /Slide4 -->

      </div><!-- /.carousel-inner -->


      <!-- Controls -->
      <div class="control-box">
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
          <span class="control-icon prev fa fa-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>

        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
          <span class="control-icon next fa fa-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div><!-- /.control-box -->

    </div><!-- /#myCarousel -->
  </section>
  <div class="how1" style="  background:#e7e7e7;">
 <div class="howitwork1 ">
   <div class="col-sm-4">
   </div>
  <div class="col-sm-8">
<h3  style="color:red;"> NEED HELP??</h3>
      <div style="color: #282e34;text-align:center;padding:50px 80px;text-align: justify;">
        <p>Scroll up and down to really get the feeling of how Parallax Scrolling works.
    Scroll up and down to really get the feeling of how Parallax Scrolling works.
        Scroll up and down to really get the feeling of how Parallax Scrolling works.</p>
      </div>
    </div>
  </div>
</div>
<div class="how1" style="  background: #fff;">
  <div class="howitwork2">
    <div class="col-sm-4">
    </div>
<div class="col-sm-8">
  <h3  style="color:red;"> AMBULANCE SERVICE</h3>
  <div style="color: #282e34;text-align:center;padding:50px 80px;text-align: justify;">
    <p style="color:#2e5367;">Scroll up and down to really get the feeling of how Parallax Scrolling works.
Scroll up and down to really get the feeling of how Parallax Scrolling works.
    Scroll up and down to really get the feeling of how Parallax Scrolling works.</p>
  </div>
      </div>
  </div>
</div>
<div class="how1" style="  background: #e7e7e7;">
  <div class="howitwork3">
    <div class="col-sm-4">
    </div>
  <div class="col-sm-8">
    <h3  style="color:red;">FIRST AID</h3>
    <div style="color: #282e34;text-align:center;padding:50px 80px;text-align: justify;">
      <p>Scroll up and down to really get the feeling of how Parallax Scrolling works.
  Scroll up and down to really get the feeling of how Parallax Scrolling works.
      Scroll up and down to really get the feeling of how Parallax Scrolling works.</p>
    </div>
      </div>
  </div>
</div>
<div class="how1" style="  background:#fff; ">
 <div class="howitwork4">
   <div class="col-sm-4">
   </div>
  <div class="col-sm-8">
    <h3  style="color:red;">REACH HOSPITAL</h3>
    <div style="color: #282e34;text-align:center;padding:50px 80px;text-align: justify;">
      <p style="color:#2e5367;">Scroll up and down to really get the feeling of how Parallax Scrolling works.
  Scroll up and down to really get the feeling of how Parallax Scrolling works.
      Scroll up and down to really get the feeling of how Parallax Scrolling works.</p>
    </div>
      </div>
  </div>
</div>
  </div>
</div>

<div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
<i class="fa fa-medkit logo slideanim"></i>
      <!-- <i class="fa fa-medkit "></i> -->
    </div>
    <div class="col-sm-8">
      <h2>Our Values</h2><br>
      <h4><strong>MISSION:</strong> Our mission lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</h4><br>
    </div>
  </div>
</div>

<!-- Container (Services Section) -->
<div id="services" class="container-fluid text-center">
  <h2>OUR SERVICES</h2>
  <br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <i class="fa fa-ambulance logo-small" ></i>
      <h4>AMBULANCE</h4>
      <p>We provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served. </p>
    </div>
    <div class="col-sm-4">
      <i class="fa fa-heartbeat logo-small"></i>
      <h4>CARE</h4>
    <p>We provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served. </p>
    </div>
    <div class="col-sm-4">
      <i class="fa fa-user-md logo-small" ></i>
      <!-- <span class="glyphicon glyphicon-lock "></span> -->
      <h4>JOB DONE</h4>
      <p>We provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served. </p>
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-leaf logo-small"></span>
      <h4>GREEN</h4>
      <p>We provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served. </p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-certificate logo-small"></span>
      <h4>CERTIFIED</h4>
      <p>We provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served. </p>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-wrench logo-small"></span>
      <h4 style="color:#303030;">HARD WORK</h4>
        <p>We provide private ambulances with an efficient, intuitive fleet management system. By expanding capacity for service more patients can be served. </p>
    </div>
  </div>
</div>

<!-- Container (Portfolio Section) -->
<div id="portfolio" class="container-fluid text-center bg-grey">
  <h2>MEDIA</h2><br>
  <h4>What we have created</h4>
  <div class="row text-center slideanim">
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="resources/images/paris.jpg" alt="Paris" width="400" height="300">
        <p><strong>Paris</strong></p>
        <p>Yes, we built Paris</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="resources/images/america.jpg" alt="New York" width="400" height="300">
        <p><strong>New York</strong></p>
        <p>We built New York</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="resources/images/pakisthan.jpg" alt="San Francisco" width="400" height="300">
        <p><strong>San Francisco</strong></p>
        <p>Yes, San Fran is ours</p>
      </div>
    </div>
  </div>
  <div class="row text-center slideanim">
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="resources/images/paris.jpg" alt="Paris" width="400" height="300">
        <p><strong>Paris</strong></p>
        <p>Yes, we built Paris</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="resources/images/america.jpg" alt="New York" width="400" height="300">
        <p><strong>New York</strong></p>
        <p>We built New York</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="resources/images/pakisthan.jpg" alt="San Francisco" width="400" height="300">
        <p><strong>San Francisco</strong></p>
        <p>Yes, San Fran is ours</p>
      </div>
    </div>
  </div>
  <br>

</div>
<!-- Container (Contact Section) -->
<div id="pricing" class="container-fluid ">
  <h2 class="text-center">BLOGS</h2>
    <div id="myCarousel" class="carousel slide slideanim text-center" data-ride="carousel">
      <!-- Indicators -->
      <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
      </ol>

      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <div class="item active">
          <h4>"This company is the best. I am so happy with the result!"<br><span>Michael Roe, Vice President, Comment Box</span></h4>
        </div>
        <div class="item">
          <h4>"One word... WOW!!"<br><span>John Doe, Salesman, Rep Inc</span></h4>
        </div>
        <div class="item">
          <h4>"Could I... BE any more happy with this company?"<br><span>Chandler Bing, Actor, FriendsAlot</span></h4>
        </div>
      </div>

      <!-- Left and right controls -->
      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
</div>
<!-- Container (Pricing Section) -->

<div id="doctors" class="container-fluid text-center bg-grey">
  <h2>DOCTORS</h2>
  <h4>Our Specialized Doctors</h4>
  <div class="row text-center slideanim">
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="resources/images/d1.jpg" alt="Paris" width="400"  style="border-radius:50%; height:auto">
        <p><strong>Paris</strong></p>
        <p>Yes, we built Paris</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="resources/images/d2.jpg" alt="New York" width="400"  style="border-radius:50%;height:auto">
        <p><strong>New York</strong></p>
        <p>We built New York</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="resources/images/d3.jpg" alt="San Francisco" width="400"  style="border-radius:50%;height:auto">
        <p><strong>San Francisco</strong></p>
        <p>Yes, San Fran is ours</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="resources/images/d5.jpg" alt="San Francisco" width="400"  style="border-radius:50%;height:auto">
        <p><strong>San Francisco</strong></p>
        <p>Yes, San Fran is ours</p>
      </div>
    </div>
  </div>
  <br>
</div>
<div id="contact" class="slideanim container-fluid ">
  <h2 class="patners text-center">Our Hospital Patners</h2>
  <div class="row">
    <div class="col-sm-4 col-xs-6">
        <div class="hsptl">
          <img src="resources/images/h1.jpg" style="margin-bottom:10px;">
      </div>
      <div class="hsptl">
        <img src="resources/images/h2.jpg" style="margin-bottom:10px;">
    </div>
    <div class="hsptl">
      <img src="resources/images/h3.jpg" style="margin-bottom:10px;">
  </div>
  <div class="hsptl">
    <img src="resources/images/h12.jpg" style="margin-bottom:10px;">
</div>
    </div>
    <div class="col-sm-4 col-xs-6">
        <div class="hsptl">
          <img src="resources/images/h4.jpg" style="margin-bottom:10px;">
      </div>
      <div class="hsptl">
        <img src="resources/images/h5.jpg" style="margin-bottom:10px;">
    </div>
    <div class="hsptl">
      <img src="resources/images/h6.jpg" style="margin-bottom:10px;">
  </div>
  <div class="hsptl">
    <img src="resources/images/h11.jpg" style="margin-bottom:10px;">
  </div>
    </div>
    <div class="col-sm-4 col-xs-6">
        <div class="hsptl">
          <img src="resources/images/h7.jpg" style="margin-bottom:10px;">
      </div>
      <div class="hsptl">
        <img src="resources/images/h8.jpg" style="margin-bottom:10px;">
    </div>
    <div class="hsptl">
      <img src="resources/images/h9.jpg" style="margin-bottom:10px;">
  </div>
  <div class="hsptl">
    <img src="resources/images/h10.jpg" style="margin-bottom:10px;">
</div>
    </div>
</div>
</div>

<script>
$(document).ready(function(){
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){

        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });

  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;
      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  });
})
</script> --%>