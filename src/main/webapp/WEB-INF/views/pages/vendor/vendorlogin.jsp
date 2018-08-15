 <%@ page language="java" contentType="text/html; charset=UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 <style>
 

.video-part
{
	width: 100%;
	float: left;
	position: relative;
	overflow: hidden;
	height: 500px;
}
.video-part video
{
	margin-top: -15%;
	width: 100%;


}
.video-part-content
{
 position: absolute;
	top: 10%;
	left: 0%;
	width: 100%;
	height: 100%;
	padding-top: 8%;
	/* background:rgba(87, 117, 189, 0.5) ; */
}

.video-part-content .carousel-caption
{
	position: relative !important;
	left: 0%;
	right: 0%;
}
.video-part-content .carousel-indicators
{
	top: 316px;
}
.hader .nav.navbar-nav.pull-right
{
	margin-top: 2%;
}
.video-part-content .carousel-caption h1
{
font-size: 50px;
}
.video-part-content .carousel-caption p
{
font-size: 20px;
}
/* .affix
{
	width: 100%;
	transition: ease 0.5s;
	background: #fff !important;
  border-bottom: 2px solid #5775bd !important;
} */
/* .navbar-default.affix .navbar-nav > li > a {
  color: #333;
}  */
.carousel-caption img{
margin: 0px auto;
}

.full-width
{
	width: 100%;
	float: left;
}
.video-part-content .btn-info:hover {
  color: #fff;
  border: 1px solid #fff;
  transition: ease 0.5s;
  background: transparent;
}
.navbar-default {
    background-color: #52738d5c;
    border:none;
}
.navbar-default .navbar-nav>li>a {
    color: #ffffff;
    line-height: 60px;
}

.btn-info {
    background: #5674bc none repeat scroll 0 0;
    border: 1px solid #5674bc;
    border-radius: 0;
    color: #fff;
    transition: all 0.5s ease 0s;
}

@-webkit-keyframes fadeInDown {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }

  to {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }

  to {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
}

@-webkit-keyframes fadeInUp {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0);
  }

  to {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    -webkit-transform: translate3d(0, 100%, 0);
    transform: translate3d(0, 100%, 0);
  }

  to {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

.fadeInUp {
  -webkit-animation-name: fadeInUp;
  animation-name: fadeInUp;
  animation-delay:1s;
  animation-duration:2s;
}



.header {
  /* position: relative; */
  /* width: 100vw; */
  height: 600px;
}
.header .center {
	position: absolute;
	top: 50%;
	left: 50%;
	width: 90%;
	transform:translate(-50%,-50%);
	z-index: 5;
  padding: 1rem;
}
/* .header .left {
  position: absolute;
	top: 50%;
	left: 50%;
	width: 90%;
	transform:translate(-50%,-50%);
	z-index: 5;
  padding: 1rem;
}
.header .right {
  position: absolute;
	top: 50%;
	left: 50%;
	width: 90%;
	transform:translate(-50%,-50%);
	z-index: 5;
  padding: 1rem;
}
.header .scroll {
  position: absolute;
  top: 95%;
  left: 50%;
  transform:translate(-50%,-50%);
  color: #fff;
  font-size: 1.5rem;
} */
/*=== Large devices (desktops, 992px and up) ===*/
@media (min-width: 992px) {
/* .header .center {
  width: 50%;
}
.header .left {
  position: absolute;
  top: 20%;
  left: 10%;
  width: 40%;
  height: 60%;
  transform:translate(0, 0);
  padding: 1rem;
}
.header .right {
  position: absolute;
  top: 20%;
  left: 50%;
  width: 40%;
  height: 60%;
  transform:translate(0, 0);
  padding: 1rem;
} */
.delay {
  animation-delay: 0.6s;
}
}

#header4 {
	background: #355c7d;
  background:
    linear-gradient(
      rgba(53, 92, 125, 0.8), /* #355c7d */
      rgba(108, 91, 123, 0.8), /* #6c5b7b */
      rgba(192, 108, 123, 0.8) /* #c06c7b */
    ),
    url('https://cdn.stocksnap.io/img-thumbs/960w/Y01VDYAX63.jpg') no-repeat left top;
  background-size: cover;
	z-index: 0; /* bottom layout */
}



.demo{ 
background: url(resources/images/steps_bg.png) no-repeat ;
 background-size:cover;

}
.main-timeline{
    overflow: hidden;
    position: relative;
     margin-bottom: 20px;
}
.main-timeline:before{
    content: "";
    width: 10px;
    height: 100%;
    background: #95a5a5;
    position: absolute;
    top: 140px;
    left: 50%;
    transform: translateX(-50%);
}
.main-timeline .timeline{
    width: 50%;
    padding: 0 60px 0 70px;
    float: right;
    text-align: center;
    position: relative;
}
.main-timeline .timeline-content{
    display: block;
    padding: 35px;
    background: #0c85e7;
    border-radius: 20px;
    position: relative;
}
.main-timeline .timeline-content:hover{ text-decoration: none; }
.main-timeline .timeline-content:before{
    content: "";
    width: 80px;
    height: 20px;
    background: #0c85e7;
    position: absolute;
    bottom: 0;
    left: -50px;
}
.main-timeline .timeline-content:after{
    content: "";
    width: 20px;
    height: 20px;
    border-radius: 50%;
    background: #2d3e50;
    position: absolute;
    bottom: 12px;
    left: -20px;
}
.main-timeline .icon{
    display: block;
    width: 100px;
    height: 100px;
    line-height: 100px;
    border-radius: 15px;
    background: #0c85e7;
    font-size: 35px;
    color: #fff;
    position: absolute;
    bottom: 0;
    left: -120px;
    z-index: 1;
}
.main-timeline .icon:after{
    content: "";
    border: 5px dotted #fff;
    border-radius: 50%;
    position: absolute;
    top: 10px;
    left: 10px;
    bottom: 10px;
    right: 10px;
}
.main-timeline .title{
    display: inline-block;
    padding-bottom: 7px;
    margin: 0 0 10px 0;
    border-bottom: 2px solid #fff;
    font-size: 20px;
    font-weight: 700;
    color: #fff;
    text-transform: uppercase;
}
.main-timeline .description{
    font-size: 14px;
    color: #fff;
    margin: 0 0 5px 0;
}
.main-timeline .timeline:nth-child(2n){ padding: 0 70px 0 60px; }
.main-timeline .timeline:nth-child(2n) .timeline-content:before{
    left: auto;
    right: -50px;
}
.main-timeline .timeline:nth-child(2n) .timeline-content:after{
    left: auto;
    right: -20px;
}
.main-timeline .timeline:nth-child(2n) .icon{
    left: auto;
    right: -120px;
}
.main-timeline .timeline:nth-child(2){ margin-top: 150px; }
.main-timeline .timeline:nth-child(odd){ margin: -150px 0 0 0; }
.main-timeline .timeline:nth-child(even){ margin-bottom: 120px; }

.main-timeline .timeline:first-child,
.main-timeline .timeline:last-child:nth-child(even){
 margin: 0; }
.main-timeline .timeline:nth-child(2n) .timeline-content,
.main-timeline .timeline:nth-child(2n) .timeline-content:before,
.main-timeline .timeline:nth-child(2n) .icon{
 background: #ffab07; }
.main-timeline .timeline:nth-child(3n) .timeline-content,
.main-timeline .timeline:nth-child(3n) .timeline-content:before,
.main-timeline .timeline:nth-child(3n) .icon{ 
background: #f73757; }
.main-timeline .timeline:nth-child(4n) .timeline-content,
.main-timeline .timeline:nth-child(4n) 
.timeline-content:before,
.main-timeline .timeline:nth-child(4n)
 .icon{ background: #0cbe2d; }

@media only screen and (max-width: 990px){
    .main-timeline .timeline{ padding-right: 0; }
    .main-timeline .timeline:nth-child(2n){ padding-left: 0; }
}
@media only screen and (max-width: 767px){
    .main-timeline:before{ display: none; }
    .main-timeline .timeline,
    .main-timeline .timeline:nth-child(even),
    .main-timeline .timeline:nth-child(odd){
        width: 100%;
        float: none;
        padding: 0 0 0 120px;
        margin: 0 0 30px 0;
    }
    .main-timeline .timeline-content{ padding: 12px; }
    .main-timeline .timeline:nth-child(2n) .timeline-content:before{
        right: auto;
        left: -50px;
    }
    .main-timeline .timeline:nth-child(2n) .timeline-content:after{
        right: auto;
        left: -20px;
    }
    .main-timeline .timeline:nth-child(2n) .icon{
        right: auto;
        left: -120px;
    }
}
@media only screen and (max-width: 480px){
    .main-timeline .title{ font-size: 16px; }
}

 
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


  <div class="modal fade" id="signin" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> SIGN IN</h4>
        </div>
        <div class="modal-body" style="padding:20px">
         <form name="loginForm"
		   action='<c:url value="/vendor/login"/>'  class="form signin"  method='POST'>
		   <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
        <input type="text" placeholder="username" name='j_username' style="">
          <input type="password" placeholder="Password" name='j_password'style=""><BR>
             <div class=" link_forgot_pass  ">
   <a href="forgotPasswordforvendor" class="forgotPassword " >Forgot Password ?</a>
            </div>
            
         <a href="registration">Register as New vendor here>></a><br> 
<!--           <A HREF="#"  data-dismiss="modal" data-toggle="modal" data-target="#user_reg">Register as New vendor here>></A><br> 
 -->        <button class="btn btn-danger " style="border-radius:none;">SIGN IN</button>
      </form>
        </div>
      </div>
    </div>
  </div>


 
 

<!-- Container (About Section) -->
<div id="about" class="container-fluid">
  <div class="row">
     <div class="video-part">
<div class="vendor_login_form pull-right" style="width:300px ;background:red;margin: 15% 20px auto;position: relative;
    z-index: 999;
    background: #0000009e; padding:20px">
    <h2 style="color:red">Login Form</h2>
    <form name="loginForm"
		   action='<c:url value="/vendor/login"/>'  class="form signin"  method='POST'>
		   <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
				<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="j_username"
										id="" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>username</label>
									</div>

								</div>
									<div class="group input_form_sign ">
									<input class="inputMaterial" type="password" name="j_password"
										id="" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Password</label>
									</div>

								</div>
								<div class=" link_forgot_pass  ">
   <a href="forgotPasswordforvendor" class="forgotPassword " >Forgot Password ?</a>

            </div>
       <!--  <input type="text" placeholder="username" name='j_username' style="">
          <input type="password" placeholder="Password" name='j_password'style=""><BR> -->
         <a href="registration">Register as New vendor here>></a><br> 
         
<!--           <A HREF="#"  data-dismiss="modal" data-toggle="modal" data-target="#user_reg">Register as New vendor here>></A><br> 
 -->        <button class="btn btn-danger " style="border-radius:none;">SIGN IN</button>
      </form>
 </div>

      <div class="container">
      <div class="video-part-content">
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <div class="carousel-caption ">
           
            <img src="http://lightofweb.com/zanzo-website/img/light-bulb.png" class="img-responsive animated fadeInDown">
          
            <div class="full-width animated fadeInUp">
              <h1>Racing your ideas to reality</h1>
              <p>Transforming ideas to successful business goal,
      with your extended IT team. </p>
      <a href="#" class="btn btn-info">Read More</a>
      </div>
            </div>
          </div>
          <div class="item">
           <div class="carousel-caption ">
          
            <img src="http://lightofweb.com/zanzo-website/img/light-bulb.png" class="img-responsive  animated fadeInDown">
         
            <div class="full-width animated fadeInUp">
              <h1>Racing your ideas to reality</h1>
              <p>Transforming ideas to successful business goal,
      with your extended IT team. </p>
      <a href="#" class="btn btn-info">Read More</a>
      </div>
            </div>
          </div>
          <div class="item">
           <div class="carousel-caption">
           
            <img src="http://lightofweb.com/zanzo-website/img/light-bulb.png" class="img-responsive animated fadeInDown">
           
            <div class="full-width animated fadeInUp">
              <h1>Racing your ideas to reality</h1>
              <p>Transforming ideas to successful business goal,
      with your extended IT team. </p>
      <a href="#" class="btn btn-info">Read More</a>
      </div>
            </div>
          </div>
        </div>
        <!-- Controls -->
      </div>
      </div>
      </div>
      </div>
  
  <header class="header" id="header4">
  
      </header>

  </div>
 
  
</div>



<!-- Container (Services Section) -->
<div  >


<div class="demo">
<div class="container text-center">
<h2> Steps To Follow</h2>
    <div class="main-timeline">
        <div class="timeline">
            <a href="#" class="timeline-content">
                <span class="icon fa fa-globe"></span>
                <h3 class="title">Web Designer</h3>
                <p class="description">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada tellus lorem, et condimentum neque commodo quis.
                </p>
            </a>
        </div>
        <div class="timeline">
            <a href="#" class="timeline-content">
                <span class="icon fa fa-rocket"></span>
                <h3 class="title">Web Developer</h3>
                <p class="description">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada tellus lorem, et condimentum neque commodo quis.
                </p>
            </a>
        </div>
        <div class="timeline">
            <a href="#" class="timeline-content">
                <span class="icon fa fa-rocket"></span>
                <h3 class="title">Web Developer</h3>
                <p class="description">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada tellus lorem, et condimentum neque commodo quis.
                </p>
            </a>
        </div>
        <div class="timeline">
            <a href="#" class="timeline-content">
                <span class="icon fa fa-rocket"></span>
                <h3 class="title">Web Developer</h3>
                <p class="description">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer malesuada tellus lorem, et condimentum neque commodo quis.
                </p>
            </a>
        </div>
    </div>
    
</div>
  </div>
</div>

<!-- Container (Portfolio Section) -->
<div id="portfolio" class="container-fluid text-center bg-grey">

</div>
<!-- Container (Contact Section) -->
<div id="pricing" class="container-fluid ">

</div>
<!-- Container (Pricing Section) -->

<div id="doctors" class="container-fluid text-center bg-grey">
 
</div>
<div id="contact" class="slideanim container-fluid ">

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

