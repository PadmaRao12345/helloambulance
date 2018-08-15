
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Ambulance</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css"> -->
  <!-- <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css"> -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
  
  <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Felipa|Varela+Round" rel="stylesheet">
<link href="/resources/cssfiles/style.css" rel="stylesheet">
<link href="/resources/cssfiles/vendor.css" rel="stylesheet">
<link href="/resources/cssfiles/styl.css" rel="stylesheet">
<!-- google location script -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU"></script>
 <script src=/resources/jsfiles/registration.js/></script>
<!-- google location script -->

<script>
/* $(document).ready(function(){
	$("#reg").click(function(){
		
		var name = $("#name").val();
		var mobile_no = $("#mobile_number").val();
		var email_id = $("email_id").val();
		var password = $("#passwd").val();
		var date_of_birth = $("#dob").val();
		var gender = $("#gender").val();
		var blood_group = $("#Blood_group").val();
		var register_as = $("#register_as").val();
		
		$.ajax({
			
			method : "POST",
			url : "vendorRegistration",
			data :{
				
				name : name,
				mobile_no : mobile_no,
				email_id : email_id,
				password : password,
				date_of_birth : date_of_birth,
				gender : gender,
				blood_group : blood_group,
				register_as : register_as
			}
			
		});

	});
	
});
 */
 
 
 $(document).ready(function() {
		/*  $(document).ready(function() { */
			  $("#Register_as").focus(function(){
		 $.getJSON ('<c:url value="loadRegisterAsList/?${_csrf.parameterName}=${_csrf.token}"/>', {
			 /*  bloodGroupId : $(this).val(),
			 ajax : 'true'  */
		 }, function(data) {
		 var select = $('#Register_as');
		 select.find('option').remove();
		 $.each(data, function(index, value){
		 $('<option>').val(value.register_As_Id).text(value.register_type).appendTo(select);
		 });
		 });
		 });
			 });

 


 
$(document).ready(function() {
	/*  $(document).ready(function() { */
		  $("#Blood_group").focus(function(){
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
	
	});


	$(document).ready(function() {
		$("#email_id").change(function() {
			$.ajax({
				url : 'check_availEmail_vendor',
				data : {
					email_id : $("#email_id").val()
				},
				success : function(data) {
					//$("#id_res_div").html(data);
					if(data==""){
						$("#id_res_div").html(data);
						  $("#reg").removeAttr("disabled");
						 
					}
					else{
						$("#id_res_div").html(data);
						 $("#reg").attr("disabled", "disabled");
					}	
				
				}
			});
		});
	});

	$(document).ready(function() {
		$("#mobile_number").change(function() {
			$.ajax({
				url : 'check_mobile_avail_vendor',
				data : {
					mobile_no : $("#mobile_number").val()
				},
				success : function(data) {
					//$("#id_div").html(data);
					if(data==""){
						$("#id_div").html(data);
						  $("#reg").removeAttr("disabled");
						 
					}
					else{
						$("#id_div").html(data);
						 $("#reg").attr("disabled", "disabled");
					}	
				}
			});
		});
	});


</script>

<style>

.ui-datepicker .ui-datepicker-title select{color: #000;}
.ui-helper-clearfix { display:none; } 
.navbar-default {
    background-color: #52738d5c;
    border:none;
}
.navbar-default .navbar-nav>li>a {
    color: #ffffff;
    line-height: 60px;
}
.panel-heading {
    color: #fff !important;
    background-color: #d9534f !important;
  }
  .panel {
    border: 1px solid #d9534f;
  }

.btn-info {
    background: #5674bc none repeat scroll 0 0;
    border: 1px solid #5674bc;
    border-radius: 0;
    color: #fff;
    transition: all 0.5s ease 0s;
}
.stepwizard-step p {
    margin-top: 0px;
    color:#666;
}
.stepwizard-row {
    display: table-row;
}
.stepwizard {
    display: table;
    width: 100%;
    position: relative;
}
.stepwizard-step button[disabled] {
    /*opacity: 1 !important;
    filter: alpha(opacity=100) !important;*/
}
.stepwizard .btn.disabled, .stepwizard .btn[disabled], .stepwizard fieldset[disabled] .btn {
    opacity:1 !important;
    color:#bbb;
}
.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content:" ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-index: 0;
}
.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}
.btn-circle {
    width: 30px;
    height: 30px;
    text-align: center;
    padding: 6px 0;
    font-size: 12px;
    line-height: 1.428571429;
    border-radius: 15px;
}
</style>
<script>
</script>


</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

  <div class="container"  style="margin-top:100px;">
    <h2>Vendor Registration </h2>




        <div class="panel panel-primary setup-content" >
            <div class="panel-heading">
                 <h2 class="panel-title">Step1</h2>
            </div>
            <div class="panel-body">
          <form role="form"  class="step1" action="vendorRegistration" method="post">
              <div class="col-sm-6">
                <div class="group input_form_sign  ">
                  <input class="inputMaterial"  type="text"  name="name" id="name" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef"><label>First Name</label></div>
                </div>
                <div class="group input_form_sign  ">
                  <input class="inputMaterial"  type="email"  name="email_id" id="email_id" required>
                   <div id="id_res_div" class="error" style="max-width: 200px"></div>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef"><label>E-mail Id</label></div>
                </div>
                <div class="group input_form_sign ">
                  <input type="text" class=" inputMaterial"  name="mobile_no" id="mobile_number" required>
                     <div id="id_div" class="error" style="max-width: 200px"></div>
                  
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef">  <label>Contact No.</label></div>
                </div>
                <div class="group input_form_sign  ">
                  <input  class="inputMaterial"  type="password" id="passwd" name="password" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef"><label>Password</label></div>
                </div>
              </div>
                  <div class="col-sm-6">
                <div class="group input_form_sign ">
                  <input  class="inputMaterial dob" type="text" name="date_of_birth" id="dob" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef">  <label>Date of Birth</label></div>
                </div>
                <div class="group input_form_sign " >
                  <select name="gender" class="inputMaterial gender" id="gender"  required >
                    <option value="">-select Gender-</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Others">Others</option>
                  </select>
                </div>
                <div class="group input_form_sign " >
                  <select name="blood_group" id="Blood_group" class="inputMaterial bloodgroup" required >
                    <option value="">Select BloodGroup</option>
                   <!--  <option value="0">B+VE</option>
                    <option value="1">B-VE</option> -->
                  </select>
                </div>
                <div class="group input_form_sign " >
                  <select name="register_as" class="inputMaterial type_reg"  id="Register_as" required >
                    <option value="">-Register_As-</option>
                  <!--   <option value="0">DOCTOR</option>
                    <option value="1">AMBULANCE</option>
                    <option value="2">HOSPITAL</option> -->
                  </select>
                </div>
                
              </div>
                <button class="btn btn-primary pull-right" type="Submit" id="reg">REGISTER</button>
    </form>
            </div>
        </div>




</div>

        </footer>
        <!-- vendorlogin popup -->
        <div class="modal fade" id="vendorlogin" role="dialog">
          <div class="modal-dialog modal-sm">
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"> VENDOR LOGIN</h4>
              </div>
              <div class="modal-body" style="padding:20px">
                <form class="form vendor_login">
                  <div class="group input_form_sign  ">
                    <input class="inputMaterial"  type="text"  name="username" id="" required>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <div class="lef"><label>Username</label></div>
                  </div>
                  <div class="group input_form_sign  ">
                    <input  class="inputMaterial"  type="password" id="" name="pass" required>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <div class="lef"><label>Password</label></div>
                  </div>
                  
                 <!--    <div class=" link_forgot_pass  ">
              <a href="forgotPassword" class="forgotPassword " >Forgot Password ?</a>
            </div>  -->
                  <button class="btn btn-danger " style="border-radius:none;">Login</button>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- vendorlogin popup -->
        <!-- vendorregister popup -->
        <div class="modal fade" id="vendorregister" role="dialog">
          <div class="modal-dialog" style="overflow-y: overlay;height:90%;">
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"> VENDOR REGISTERATION</h4>
              </div>
              <div class="modal-body" style="padding:20px">

              </div>
            </div>
          </div>
        </div>
              <script>
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
    </script>
        <!-- vendorregister popup -->
        <script>

          $(document).ready(function(){
            $('.carousel').carousel({
              interval: 3000
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


          })

        </script>
        <!--starts links for date of birth validation -->
      <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
      <!--end links for date of birth validation -->
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
      }).attr("readonly", "readonly"); //prevent manual changes
      //validation for date of birth
      //validation for login form
      $( ".signin" ).validate({
        rules: {
          name: {
            required: true,
            minlength: 4,
            user:true,

          },

          pass: {
            required: true,
            password : true,
            minlength: 8,
          }
        },
        messages : {
          name: {
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
      });
      jQuery.validator.addMethod("user", function(value, element) {
        return this.optional( element ) || /^[a-z].{3,}$/.test( value );
      });
      jQuery.validator.addMethod("email_id", function(value, element) {
    	  return this.optional( element ) || /^[A-z].{1}[a-z0-9._%+-]+@[a-z.-]+\.[a-z]{2,4}$/.test( value );
      } );
      $( ".step1" ).validate({
        rules: {
        	name:{
            required: true,
           //user : true,
            lettersonly:true,
          },
          email_id: {
            required: true,
            email: true,
            minlength: 4,
          },
          mobile_no: {
            required: true,
            digits:true,
            minlength: 10,
            maxlength: 10,
          },
          date_of_birth:{
            required:true,
          },
          password: {
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
          name:  {
              required: "Please enter name",
              user:"please enter proper user name",
            },

          email_id: {
            required : "Please specify your valid mail id",
            minlength: "Minimum 3 and Maximum 50",
          },
          mobile_no:  {
            required : "Please enter your mobile number",
            minlength: "Minimum 10 and Maximum 10",
            digits:"please enter number only",
          },
          date_of_birth:{
            required : "Please enter date of birth",
          },

          password: {
            required : "Please enter your password (min8 max 12)",
            minlength: "Must contain at least one number and one uppercase and lowercase letter and one special charecter, and at least 8 or more characters and Maximum 12 ",
            password: "please fill required format (eg:Praveen@123)",
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

          mobile_no: {
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
          email_id: {
            required : "Please specify your valid mail id",
            minlength: "Minimum 3 and Maximum 50",
          },
          mobile_no:  {
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
      </script>
      <!-- validation for registeration form -->
      </body>
      </html>



<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

 <title>Ambulance</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css"> -->
  <!-- <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css"> -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script> -->
  <!-- <script src=" http://jqueryvalidation.org/validate.js"></script> -->
  <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
  <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Felipa|Varela+Round" rel="stylesheet">
<link href="resources/cssfiles/style.css" rel="stylesheet">
<!-- google location script -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU"></script>
 <script src='<c:url value="/resources/jsfiles/registration.js"/>' ></script>
<!-- google location script -->
 <style>
.title{
  font-size: 20px;
}
.profile-inf{
    padding: 10px;
    min-height: 250px;
    margin-bottom: 18px;
    background: #e7e7e7;
    color: #595959;
}
.userinf{
    color: #c59d9c;
    font-size: 20px;
    /* padding: 30px 15px 4px; */
    /* position: absolute; */
    width: 100%;
    text-shadow: 1px 1px 2px #000000;
}
/* form */
* {
  box-sizing: border-box;
}

body {
  background-color: #f1f1f1;
}

#hsptlForm,#ambForm {
    /* background-color: #ffffff; */
    margin: -50px auto;
    font-family: Raleway;
    /* padding: 9px; */
    width: 70%;
    /* min-width: 300px; */
}

h1 {
  text-align: center;
}

input {
  padding: 10px;
  width: 100%;
  font-size: 17px;
  font-family: Raleway;
  border: 1px solid #aaaaaa;
}

/* Mark input boxes that gets an error on validation: */
input.invalid {
  background-color: #ffdddd;
}

/* Hide all steps by default: */
.tab {
  display: none;
}

button {
  background-color: #4CAF50;
  color: #ffffff;
  border: none;
  padding: 10px 20px;
  font-size: 17px;
  font-family: Raleway;
  cursor: pointer;
}

button:hover {
  opacity: 0.8;
}

#prevBtn {
  background-color: #bbbbbb;
}

/* Make circles that indicate the steps of the form: */
.step {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbbbbb;
  border: none;
  border-radius: 50%;
  display: inline-block;
  opacity: 0.5;
}

.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
  background-color: #4CAF50;
}
.modal input ,.modal select{
padding: 3px;
border-radius:none;
border:1px solid #aaaaaa;
min-width: 300px;
}
.modal input ,.modal button ,.modal select{
  margin:10px;

}
.modal .modal-header h4{
color:red;
}
/* form */
</style> 

<script>
$(document).ready(function(){
	

$('#Blood_group').click(function() {
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
	 
});
</script>

<script>
 $(document).ready(function(){

	$(".tostep2").click(function(){
   // if (form.valid() == true){
   // 			current_fs = $('.step2');
   // 			next_fs = $('.step1');
   // 			next_fs.show();
   // 			current_fs.hide();
   // 		}

  // if ($(".step1 input").valid()){
  // $(".step2").show(500);
  // $(".step1").hide(500);
 });
 });
// if ($(".active_inp").valid()) {
//  $('.form1').hide();
//  $('.form2').show();
//       }
// function validate() {
//     var isValid = true;
//     var form1 = document.getElementById('step1');
//
//     if (form1.input.value == '') {
//         isValid = false;
//     }
//     if (isValid) {
//         document.getElementById('step2').style.display='block';
//         return false;
//     }
// }


$(document).ready(function () {

    var navListItems = $('div.setup-panel div a'),
        allWells = $('.setup-content'),
        allNextBtn = $('.nextBtn');

    allWells.hide();

    navListItems.click(function (e) {
        e.preventDefault();
        var $target = $($(this).attr('href')),
            $item = $(this);

        if (!$item.hasClass('disabled')) {
            navListItems.removeClass('btn-success').addClass('btn-default');
            $item.addClass('btn-success');
            allWells.hide();
            $target.show();
            $target.find('input:eq(0)').focus();
        }
    });

    allNextBtn.click(function () {
        var curStep = $(this).closest(".setup-content"),
            curStepBtn = curStep.attr("id"),
            nextStepWizard = $('div.setup-panel div a[href="#' + curStepBtn + '"]').parent().next().children("a"),
            curInputs = curStep.find("input[type='text'],input[type='url']"),
            isValid = true;

        $(".form-group").removeClass("has-error");
        for (var i = 0; i < curInputs.length; i++) {
            if (!curInputs[i].validity.valid) {
                isValid = false;
                $(curInputs[i]).closest(".form-group").addClass("has-error");
            }
        }

        if (isValid) nextStepWizard.removeAttr('disabled').trigger('click');
    });

    $('div.setup-panel div a.btn-success').trigger('click');
});
</script>

<!-- <script>
	$(document).ready(function() {
		$("#next1").click(function() {
alert("hii");
			var name = $("firstname").val();
			var mobile_no = $("mobile").val();
			var email_id = $("email").val();
			var password = $("passwd").val();
			var date_of_birth = $("dob").val();
			var gender = $("gender").val();
			var blood_group = $("blood_group").val();
			var register_as = $($("register_as").val());
			$.ajax({

				method : "POST",
				url : "vendorregistration",
				data : {
					name : name,
					mobile_no : mobile_no,
					emaol_id : email_id,
					password : password,
					date_of_birth : date_of_birth,
					gender : gender,
					blood_group : blood_group,
					register_as : register_as

				}
			});

		});

	});
</script> -->

</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
  <nav class="navbar navbar-default navbar-fixed-top" >
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#" style="color: #d9534f;"><i class="fa fa-ambulance"style="font-size: 38px;    "></i></span><span> Ambulance</span></a>
      </div>
      <div>
        <div class="collapse navbar-collapse" id="myNavbar">
          <ul class="nav navbar-nav">
            <li><a href="#about"> HOW IT WORKS</a></li>
            <li><a href="#services"> SERVICES</a></li>
            <li><a href="#portfolio"> MEDIA </a></li>
            <li><a href="#pricing"> BLOGS</a></li>
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">PARTNERS  <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#doctors">DOCTORS</a></li>
                <li><a href="#contact">HOSPITALS</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav pull-right">
            <button href="#" class="btn btn-danger" style="border-radius:none;color:white; height:35px;margin:30px 0 0 0"  data-toggle="modal" data-target="#emergency" >EMERGENCY</button>
            <!-- <li><a href="#" class="" style="border-radius:none;color:red; line-height: 60px;"  data-toggle="modal" data-target="#emergency" >EMERGENCY</a></li> -->
            <li><a href="#" style=""  data-toggle="modal" data-target="#prebook" >PRE-BOOK</a></li>
            <li><a href="#"  data-toggle="modal" data-target="#signin" >SIGN IN</a></li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
  <div class="container"  style="margin-top:100px;">
    <h2>Vendor Registration </h2>

    <div class="stepwizard">
        <div class="stepwizard-row setup-panel">
            <div class="stepwizard-step col-xs-3">
                <a href="#step-1" type="button" class="btn btn-success btn-circle">1</a>
                <p><small>Basic Information</small></p>
            </div>
            <div class="stepwizard-step col-xs-3">
                <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled="disabled">2</a>
                <p><small>Specilization</small></p>
            </div>
            <div class="stepwizard-step col-xs-3">
                <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled="disabled">3</a>
                <p><small>Schedule</small></p>
            </div>
            <div class="stepwizard-step col-xs-3">
                <a href="#step-4" type="button" class="btn btn-default btn-circle" disabled="disabled">4</a>
                <p><small>Cargo</small></p>
            </div>
        </div>
    </div>

    <form role="form" action="vendorregistration" method="post">
        <div class="panel panel-primary setup-content" id="step-1">
            <div class="panel-heading">
                 <h2 class="panel-title">Step1</h2>
            </div>
            <div class="panel-body">
              <div class="col-sm-6">
                <div class="group input_form_sign  ">
                  <input class="inputMaterial"  type="text"  name="name" id="name" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef"><label>First Name</label></div>
                </div>
                <div class="group input_form_sign  ">
                  <input class="inputMaterial"  type="text"  name="email_id" id="email" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef"><label>E-mail Id</label></div>
                </div>
                <div class="group input_form_sign ">
                  <input type="text" class=" inputMaterial"  name="mobile_no" id="mobile" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef">  <label>Contact No.</label></div>
                </div>
                <div class="group input_form_sign  ">
                  <input  class="inputMaterial"  type="password" id="passwd" name="password" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef"><label>Password</label></div>
                </div>
              </div>
                  <div class="col-sm-6">
                <div class="group input_form_sign ">
                  <input  class="inputMaterial dob" type="text" name="date_of_birth" id="dob" required>
                  <span class="highlight"></span>
                  <span class="bar"></span>
                  <div class="lef">  <label>Date of Birth</label></div>
                </div>
                <div class="group input_form_sign " >
                  <select name="gender" class="inputMaterial gender"  required id="gender" name="gender" >
                    <option value="">-select state-</option>
                    <option value="0">Male</option>
                    <option value="1">Female</option>
                    <option value="2">Others</option>
                  </select>
                </div>
                <label for="BloodGroup" class="col-sm-4 col-form-label">BloodGroup</label>
<div class="col-sm-8">
<select name="Blood_group" class="form-control" id="Blood_group"  >
<option value="">Select BloodGroup</option>
</select>
               </div>
                <div class="group input_form_sign " >
                  <select class="inputMaterial type_reg"  required  id="register_as" name="register_as">
                    <option value="">-select state-</option>
                    <option value="0">DOCTOR</option>
                    <option value="1">AMBULANCE</option>
                    <option value="1">HOSPITAL</option>
                  </select>
                </div>
              </div>
              
              
              <button  type="submit" id="next1">Next</button>
             <!--    <button class="btn btn-primary nextBtn pull-right" type="button" id="next1">Next</button> -->
            </div>
        </div>

       <!--  <div class="panel panel-primary setup-content" id="step-2">
          <div class="panel-heading">
               <h2 class="panel-title">Doctor Specilization</h2>
          </div>
          <div class="panel-body">
            <div class="col-sm-6">
            <div class="group input_form_sign ">
              <input type="text" class=" inputMaterial"  name="Degree" id="" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <div class="lef">  <label>Degree</label></div>
            </div>
            <div class="group input_form_sign ">
              <input type="text" class=" inputMaterial"  name="Specilization" id="" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <div class="lef">  <label>Specilization</label></div>
            </div>
            <div class="group input_form_sign ">
              <input type="text" class=" inputMaterial"  name="Experience" id="" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <div class="lef">  <label>Years of Experience</label></div>
            </div>
            <div class="group input_form_sign ">
              <input type="text" class=" inputMaterial"  name="HospitalName" id="" required>
              <span class="highlight"></span>
              <span class="bar"></span>
              <div class="lef">  <label>Hospital Name</label></div>
            </div>
          <div class="group input_form_sign ">
            <input type="text" class=" inputMaterial"  name="address" id="" required>
            <span class="highlight"></span>
            <span class="bar"></span>
            <div class="lef">  <label>ADDRESS</label></div>
          </div>
        </div>

          <div class="col-sm-6">
          <div class="group input_form_sign ">
            <input type="text" class=" inputMaterial"  name="city" id="" required>
            <span class="highlight"></span>
            <span class="bar"></span>
            <div class="lef">  <label>CITY</label></div>
          </div>

          <div class="group input_form_sign " >
            <select name="state" class="inputMaterial gender"  required >
              <option value="">-select state-</option>
              <option value="0">TELANGANA</option>
              <option value="1">ANDHRAPRADESH</option>
            </select>
          </div>
          <div class="group input_form_sign " >
            <select name="country" class="inputMaterial gender"  required >
              <option value="">-select country-</option>
              <option value="0">INDIA</option>
              <option value="1">RUSSIA</option>
            </select>
          </div>
          <div class="group input_form_sign ">
            <input type="text" class=" inputMaterial" maxlength="6"  name="pincode" id="" required>
            <span class="highlight"></span>
            <span class="bar"></span>
            <div class="lef">  <label>PINCODE</label></div>
          </div>
        </div>
                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
            </div>

        </div>

        <div class="panel panel-primary setup-content" id="step-3">
            <div class="panel-heading">
                 <h3 class="panel-title">Schedule</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">Company Name</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Name" />
                </div>
                <div class="form-group">
                    <label class="control-label">Company Address</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Address" />
                </div>
                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
            </div>
        </div>

        <div class="panel panel-primary setup-content" id="step-4">
            <div class="panel-heading">
                 <h3 class="panel-title">Cargo</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">Company Name</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Name" />
                </div>
                <div class="form-group">
                    <label class="control-label">Company Address</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Company Address" />
                </div>
                <button class="btn btn-success pull-right" type="submit">Finish!</button>
            </div>
        </div> -->
    </form>
  <!-- <form class=" step1 vendor_register" id="step1" >
    <div class="row">
    <div class="col-sm-6" style="border-right: 1px solid #e5e5e5">
      <div class="group input_form_sign ">
        <input  class="inputMaterial"   type="text" name="hsptl_name" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <div class="lef"><label>Hospital Name</label></div>
      </div>
      <div class="group input_form_sign  ">
        <input class="inputMaterial"  type="text"  name="email" id="" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <div class="lef"><label>E-mail Id</label></div>
      </div>
      <div class="group input_form_sign ">
        <input type="text" class=" inputMaterial"  name="mobile" id="" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <div class="lef">  <label>Contact No.</label></div>
      </div>
      <div class="group input_form_sign  ">
        <input  class="inputMaterial"  type="password" id="passwd" name="passwd" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <div class="lef"><label>Password</label></div>
      </div>
      <div class="group input_form_sign ">
        <input  class="inputMaterial " type="password" id="confirm_passwd" name="confirm_passwd" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <div class="lef"> <label>Confirm Password</label></div>
        <p id="confirm_password-error"></p>
      </div>

    </div>
    <div class="col-sm-6">
      <div class="group input_form_sign ">
        <input  class="inputMaterial dob" type="text" name="dob" id="dob" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <div class="lef">  <label>Managing Director</label></div>
      </div>
      <div class="group input_form_sign ">
        <input type="text" class=" inputMaterial"  name="address" id="" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <div class="lef">  <label>ADDRESS</label></div>
      </div>
      <div class="group input_form_sign ">
        <input type="text" class=" inputMaterial"  name="city" id="" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <div class="lef">  <label>CITY</label></div>
      </div>

      <div class="group input_form_sign " >
        <select name="state" class="inputMaterial gender"  required >
          <option value="">-select state-</option>
          <option value="0">TELANGANA</option>
          <option value="1">ANDHRAPRADESH</option>
        </select>
      </div>
      <div class="group input_form_sign " >
        <select name="country" class="inputMaterial gender"  required >
          <option value="">-select country-</option>
          <option value="0">INDIA</option>
          <option value="1">RUSSIA</option>
        </select>
      </div>
      <div class="group input_form_sign ">
        <input type="text" class=" inputMaterial" maxlength="6"  name="pincode" id="" required>
        <span class="highlight"></span>
        <span class="bar"></span>
        <div class="lef">  <label>PINCODE</label></div>
      </div>
    </div>
  </div>
   <a HREF="#"  data-dismiss="modal" data-toggle="modal" data-target="#vendorlogin">Already registered signin here>> </a><br>
      <div class="pull-right ">
     <button class="btn btn-danger tostep2" onClick="return validate();" style="border-radius:none;">Save and Continue</button>  <br>
   </div>
  </form> -->
  <!-- <form style="display:none" class="step2" id="step2" method="POST"  action=""   enctype="multipart/form-data">
    <div class="group input_form_sign  ">
      <input class="inputMaterial"  type="text"  name="username" id="" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <div class="lef"><label>Username</label></div>
    </div>
    <div class="group input_form_sign  ">
      <input  class="inputMaterial"  type="password" id="" name="pass" required>
      <span class="highlight"></span>
      <span class="bar"></span>
      <div class="lef"><label>Password</label></div>
    </div>
    <div class=" link_forgot_pass  ">
      <a href="#" class=" " >Forgot Password ?</a>
    </div>
    <div class=" link_forgot_pass  ">
    New user ? <a href="#" class=" " data-dismiss="modal" data-toggle="modal" data-target="#user_reg">click here </a>
    </div>

    <div class="cont_btn ">
      <button class=" btn btn-danger btn_sign" >SIGN IN</button>
    </div>
  </form> -->

</div>
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






        </footer>
        <!-- vendorlogin popup -->
        <div class="modal fade" id="vendorlogin" role="dialog">
          <div class="modal-dialog modal-sm">
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"> VENDOR LOGIN</h4>
              </div>
              <div class="modal-body" style="padding:20px">
                <form class="form vendor_login">
                  <div class="group input_form_sign  ">
                    <input class="inputMaterial"  type="text"  name="username" id="" required>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <div class="lef"><label>Username</label></div>
                  </div>
                  <div class="group input_form_sign  ">
                    <input  class="inputMaterial"  type="password" id="" name="pass" required>
                    <span class="highlight"></span>
                    <span class="bar"></span>
                    <div class="lef"><label>Password</label></div>
                  </div>
                  <div class=" link_forgot_pass  ">
                    <a href="#" class=" " >Forgot Password ?</a>
                  </div>
                  <button class="btn btn-danger " style="border-radius:none;">Login</button>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- vendorlogin popup -->
        <!-- vendorregister popup -->
        <div class="modal fade" id="vendorregister" role="dialog">
          <div class="modal-dialog" style="overflow-y: overlay;height:90%;">
            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"> VENDOR REGISTERATION</h4>
              </div>
              <div class="modal-body" style="padding:20px">

              </div>
            </div>
          </div>
        </div>
        <footer  id="footer" class="container-fluid " style="background:#383535">
          <div class="text-center"><a   href="#myPage" title="To Top">
            <span class="glyphicon glyphicon-chevron-up "></span>
          </a>
        </div>
        <!-- text-xs-center text-sm-left text-md-left -->
        <div class="row">
          <div class="col-xs-12 col-sm-4 col-md-4">
            <h4>Useful links</h4>
            <ul class="list-unstyled quick-links">
              <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Home</a></li>
              <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>About</a></li>
              <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
              <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Get Started</a></li>
              <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Videos</a></li>
            </ul>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4">
            <h4> Contact us</h4>
            <ul class="list-unstyled quick-links">
              <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Home</a></li>
              <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>About</a></li>
              <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
              <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Get Started</a></li>
              <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Videos</a></li>
            </ul>
          </div>
          <div class="col-xs-12 col-sm-4 col-md-4">
            <h4>Link with us</h4>
            <ul class="list-unstyled quick-links">
              <li data-toggle="modal" data-target="#vendorlogin" ><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Login</a></li>
              <li data-toggle="modal" data-target="#vendorregister"><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Register</a></li>
              <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Help</a></li>
              <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
              <li><a href="#" ><i class="fa fa-angle-double-right"></i>About us</a></li>
            </ul>
          </div>
        </div>

        <div class="row" style="margin-top: 10px;background:#443e3e">
          <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
            <ul class="list-unstyled list-inline social text-center">
              <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-facebook"></i></a></li>
              <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-twitter"></i></a></li>
              <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-instagram"></i></a></li>
              <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-google-plus"></i></a></li>
              <li class="list-inline-item"><a href="javascript:void();" target="_blank"><i class="fa fa-envelope"></i></a></li>
            </ul>
          </div>
        </hr>
      </div>
      <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
          <p>National Transaction Corporation </p>
          <p>@Copyright2018-2019 realcom infocom pvt.ltd.<a href="#" title=""></a></p>
        </div>
      </hr>
    </div>


</html>
 --%>