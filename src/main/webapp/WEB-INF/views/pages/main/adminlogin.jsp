 <%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>





<!DOCTYPE html>
<html lang="en">
<head>
  <title>Ambulance</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href='http://fonts.googleapis.com/css?family=Raleway:400,200' rel='stylesheet' type='text/css'>
<style>
body{
 background-color: #2B2B2B;
}

*{
    font-family: 'Raleway', sans-serif;
    color : #FFF;

}


div h3 span{
     color : #FFF;
     font-size:14px;
}

div span {
     font-weight: 200;
}

h1{
     font-weight: 200;
}

.login_box{
    background: #f32d27; /* Old browsers */
    /* IE9 SVG, needs conditional override of 'filter' to 'none' */
    /* background: url( */
    background: -moz-linear-gradient(45deg,  #f32d27 5%, #ff6b45 99%); /* FF3.6+ */
    background: -webkit-gradient(linear, left bottom, right top, color-stop(5%,#f32d27), color-stop(99%,#ff6b45)); /* Chrome,Safari4+ */
    background: -webkit-linear-gradient(45deg,  #f32d27 5%,#ff6b45 99%); /* Chrome10+,Safari5.1+ */
    background: -o-linear-gradient(45deg,  #f32d27 5%,#ff6b45 99%); /* Opera 11.10+ */
    background: -ms-linear-gradient(45deg,  #f32d27 5%,#ff6b45 99%); /* IE10+ */
    background: linear-gradient(45deg,  #f32d27 5%,#ff6b45 99%); /* W3C */
    width:35%;
   /* height:70%; */
    position:absolute;
    top:8%;
    left:32.5%;
    -webkit-box-shadow: 0px 0px 8px 0px rgba(50, 50, 50, 0.54);
    -moz-box-shadow:    0px 0px 8px 0px rgba(50, 50, 50, 0.54);
    box-shadow:         0px 0px 8px 0px rgba(50, 50, 50, 0.54);
}

@media (max-width: 767px) {
    .login_box{
        background: #f32d27; /* Old browsers */
        /* IE9 SVG, needs conditional override of 'filter' to 'none' */
        background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMTAwJSIgeDI9IjEwMCUiIHkyPSIwJSI+CiAgICA8c3RvcCBvZmZzZXQ9IjUlIiBzdG9wLWNvbG9yPSIjZjMyZDI3IiBzdG9wLW9wYWNpdHk9IjEiLz4KICAgIDxzdG9wIG9mZnNldD0iOTklIiBzdG9wLWNvbG9yPSIjZmY2YjQ1IiBzdG9wLW9wYWNpdHk9IjEiLz4KICA8L2xpbmVhckdyYWRpZW50PgogIDxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiIGZpbGw9InVybCgjZ3JhZC11Y2dnLWdlbmVyYXRlZCkiIC8+Cjwvc3ZnPg==);
        background: -moz-linear-gradient(45deg,  #f32d27 5%, #ff6b45 99%); /* FF3.6+ */
        background: -webkit-gradient(linear, left bottom, right top, color-stop(5%,#f32d27), color-stop(99%,#ff6b45)); /* Chrome,Safari4+ */
        background: -webkit-linear-gradient(45deg,  #f32d27 5%,#ff6b45 99%); /* Chrome10+,Safari5.1+ */
        background: -o-linear-gradient(45deg,  #f32d27 5%,#ff6b45 99%); /* Opera 11.10+ */
        background: -ms-linear-gradient(45deg,  #f32d27 5%,#ff6b45 99%); /* IE10+ */
        background: linear-gradient(45deg,  #f32d27 5%,#ff6b45 99%); /* W3C */
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f32d27', endColorstr='#ff6b45',GradientType=1 ); /* IE6-8 fallback on horizontal gradient */
        width:98%;
        /* height:80%; */
        position:absolute;
        top:2%; 
        left:5%;

        -webkit-box-shadow: 0px 0px 8px 0px rgba(50, 50, 50, 0.54);
        -moz-box-shadow:    0px 0px 8px 0px rgba(50, 50, 50, 0.54);
        box-shadow:         0px 0px 8px 0px rgba(50, 50, 50, 0.54);
    }
}

.image-circle{
    border-radius: 50%;
    width: 175px;
    height: 175px;
    border: 3px solid #d8c3c3;
    margin: 10px;
    padding: 10px;
}

.follow{
    background-color:#FC563B;
    height: 80px;
    cursor:pointer;
}

.follow:hover {
    background-color:#F22F26;
    height: 80px;
    cursor:pointer;
}

.login_control{
    background-color:#FFF;
    padding:10px;

}

.control {
    color:#000;
    margin:10px;
}

.label {
    color: #EB4F26;
    font-size: 18px;
    font-weight: 500;
}

.form-control{
    color: #000000 !important;
    font-size: 25px;
    border: none;
    padding: 25px;
    padding-left: 10px;
    border-bottom: 1px solid #CCC;
    margin-bottom: 10px;
    outline: none;
    -webkit-box-shadow: none !important;
    -moz-box-shadow: none !important;
    box-shadow: none !important;
}

.form-control:focus{
    border-radius: 0px;
    border-bottom: 1px solid #FC563B;
    margin-bottom: 10px;
    outline: none;
    -webkit-box-shadow: none !important;
    -moz-box-shadow: none !important;
    box-shadow: none !important;
}
.btn-orange{
    background-color: #FC563B;
    border-radius: 0px;
    margin: 5px;
    padding: 5px;
    width: 150px;
    font-size: 20px;
    font-weight: inherit;
}

.btn-orange:hover {
    background-color: #F22F26;
    border-radius: 0px;
    margin: 5px;
    padding: 5px;
    width: 150px;
    font-size: 20px;
    font-weight: inherit;
    color:#FFF !important;
}

.line{
    border-bottom : 2px solid #F32D27;
}
.outter{
    padding: 0px;
    border: 1px solid rgba(255, 255, 255, 0.29);
    border-radius: 50%;
    width: 200px;
    height: 200px;
}
.outter img:hover{
  transform: scale(1.13);
    transition: .5s;
}
</style>
</head>
<body>
<div class="container">
	<div class="row login_box">
	    <div class="col-md-12 col-xs-12" align="center">
            <div class="outter"><img src="../resources/images/key.png" class="image-circle"/></div>
            <h1>Admin Login</h1>
	    </div>
        <div class="col-md-12 col-xs-12 login_control">
          <form action='<c:url value="/admin/login"/>' class=""  method="POST">
          <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
                <div class="control">
                    <div class="label">Email Address</div>
                    <input type="email" name='j_username' class="form-control" placeholder="username" required/>
                </div>

                <div class="control">
                     <div class="label">Password</div>
                    <input type="password" name='j_password' class="form-control"  placeholder="password" required/>
                </div>
                <div align="center">
                     <button class="btn btn-orange">LOGIN</button><br>
                     <a href="../forgotPassword">forgotPassword</a>
                </div>
          </form>
        </div>
    </div>
</div>
</body>
</html>



























<%-- <!DOCTYPE html>
<html lang="en">
<head>
  <title>Ambulance</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet"	href='<c:url value="/resources/cssfiles/main.css"/>'> 
 <!--  <style>
 /*  body {
      font: 400 15px Lato, sans-serif;
      line-height: 1.8;
      color: #818181;
  }
  h2 {
      font-size: 24px;
      text-transform: uppercase;
      color: #303030;
      font-weight: 600;
      margin-bottom: 30px;
  }
  h4 {
      font-size: 19px;
      line-height: 1.375em;
      color: #303030;
      font-weight: 400;
      margin-bottom: 30px;
  }

  .bg-grey {
      background-color: #f6f6f6;
  }
  .logo-small {
      color: #ff0000;
      font-size: 50px;
  }
  .logo {
      color: #ff0000;
      font-size: 200px;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail img {
      width: 100%;
      height: 100%;
      margin-bottom: 10px;
  }
  .carousel-control.right, .carousel-control.left {
      background-image: none;
      color: #e40000;
  }
  .carousel-indicators li {
      border-color: #e40000;
  }
  .carousel-indicators li.active {
      background-color: #e40000;
  }
  .item h4 {
      font-size: 19px;
      line-height: 1.375em;
      font-weight: 400;
      font-style: italic;
      margin: 70px 0;
  }
  .item span {
      font-style: normal;
  }
  .panel {
      border: 1px solid #f4511e;
      border-radius:0 !important;
      transition: box-shadow 0.5s;
  }
  .panel:hover {
      box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
      border: 1px solid #f4511e;
      background-color: #fff !important;
      color: #f4511e;
  }
  .panel-heading {
      color: #fff !important;
      background-color: #f4511e !important;
      padding: 25px;
      border-bottom: 1px solid transparent;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
  }
  .panel-footer {
      background-color: white !important;
  }
  .panel-footer h3 {
      font-size: 32px;
  }
  .panel-footer h4 {
      color: #aaa;
      font-size: 14px;
  }
  .panel-footer .btn {
      margin: 15px 0;
      background-color: #f4511e;
      color: #fff;
  }
  @import url('https://fonts.googleapis.com/css?family=Mina');
  @import url('https://fonts.googleapis.com/css?family=Berkshire+Swash');

  body {
      position: relative;
      /* font-family: "Open Sans", Helvetica, Arial, sans-serif; */
      font-family: 'Mina', sans-serif;
  }
  p{
    font-family: 'Mina', sans-serif;
  }
  .carousel-control .control-icon {
    font-size: 30px !important;
    height: 40px  !important;
    margin-top: -15px;
    padding: 6px;
    width: 35px  !important;
    /* background: #383535; */
    display: inline-block;
    position: absolute;
    top: 50%;
    z-index: 5;
}
  .container-fluid {
 padding-right: 15px;
     padding-left: 15px;
    margin-right: auto;
}
 .navbar-default{
  /* background:#383535; */
  background: #fff;
}
.navbar-brand ,.patners{
  font-family: 'Berkshire Swash', cursive;
}
.patners{
  padding-bottom: 20px;
}
.navbar-default .navbar-nav>li>a:focus,
 .navbar-default .navbar-nav>li>a:hover {
    color: RED ;
  }
.navbar-default .navbar-nav>.active>a:focus,
 .navbar-default .navbar-nav>.active>a:hover {
    color: #303030;
    font-weight: bold;
  }
.navbar-default .navbar-nav>.active{
  border-bottom: 3px solid #c71b1b;
/* color:#e40000 !important; */
  font-weight: bold;
    /* transition: all 1.3s  */
}
  .navbar-default .navbar-nav>li>a {
    color:#383535;
    line-height: 60px;
}
.nav>li>a {
    position: relative;
    display: block;
    padding: 14px 13px;
}
.navbar-default .navbar-nav>.active>a {
    background-image:url("resources/images/amb1.jpg") ;
    background-color: #fff;
    color: #e40000;
    background-repeat:no-repeat;
    background-position: bottom center;
    background-size: 50px,0;
    animation: 1.3s ease-out 0s 1 slideInFromLeft;
  }
  @keyframes slideInFromLeft {
    0% {
      transform: translateX(-100%);
    }
    100% {
      transform: translateX(0);
    }
  }
  footer .glyphicon {
      font-size: 20px;
      margin-bottom: 20px;
      color: #f4511e;
  }
  .slideanim {visibility:hidden;}
  .slide {
      animation-name: slide;
      -webkit-animation-name: slide;
      animation-duration: 1s;
      -webkit-animation-duration: 1s;
      visibility: visible;
  }
  @keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    }
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    }
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
        width: 100%;
        margin-bottom: 35px;
    }
  }
  @media screen and (max-width: 480px) {
    .logo {
        font-size: 150px;
    }
  }
  .howitwork1 ,.howitwork2 ,.howitwork3 ,.howitwork4{
    /* background: url('/assets/64531/green_suburb.jpg') no-repeat  */
     -webkit-background-size: cover;
     -moz-background-size: cover;
     -o-background-size: cover;
     background-size: 300px ,400px;
   	color:#fff;
   	/* background-color:#333; */
   	font-family: 'Open Sans',Arial,Helvetica,Sans-Serif;
     background: url("resources/images/help.jpg") no-repeat center left fixed;
     min-height: 300px;
 }
  .howitwork2{
   background: url("resources/images/ambl.jpg") no-repeat center left fixed;

 }
 .howitwork3{
   background: url("resources/images/kit.jpg") no-repeat center left fixed;
 }
 .howitwork4{
   background: url("resources/images/PAT.jpg") no-repeat center left fixed;
 }
 .hsptl{
   min-width:100px;
   max-width: 240px;
 }
 .hsptl img {
     height: 75px;
     width: 100%;
 }
 .modal input ,.modal select{
 padding: 3px;
 border-radius:none;
 border:1px solid #1c1a1a;
 min-width: 300px;
 }
 .modal input ,.modal button ,.modal select{
   margin:10px;

 }
 .modal .modal-header h4{
color:red;
 }
 /* footer */
/* footer .section-title {
    text-align: center;
    color: #007b5e;
    margin-bottom: 50px;
    text-transform: uppercase;
} */
#footer {
    background: #383535!important;
}
#footer h4{
  text-align: center;
	padding-left: 10px;
    /* border-left: 3px solid #eeeeee; */
    padding-bottom: 6px;
    text-transform: uppercase;
    margin-bottom: 20px;
    color:#f6f6f6;
}
#footer a {
    color: #ffffff;
    text-decoration: none !important;
    background-color: transparent;
    -webkit-text-decoration-skip: objects;
}
#footer ul.social li{
	padding: 3px 0;
}
#footer ul.social li a i {
    margin-right: 5px;
	font-size:25px;
  padding: 13px;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}
#footer ul.social li:hover a i {
	font-size:30px;
	margin-top:-10px;
}
#footer ul.quick-links li a{
  margin: 0 0 0 100px;
}
#footer ul.social li a,
#footer ul.quick-links li a{
  /* margin: 0 0 0 100px; */
	color:#ffffff;
}
#footer ul.social li a:hover{
	color:red;
}
#footer ul.quick-links li{
	padding: 3px 0;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}
#footer ul.quick-links li:hover{
	padding: 3px 0;
	margin-left:5px;
	font-weight:700;
}
#footer ul.quick-links li a i{
	margin-right: 5px;

}
#footer ul.quick-links li:hover a i {
    font-weight: 700;
    color:#e40000;
}

@media (max-width:767px){
	#footer h5 {
    padding-left: 0;
    border-left: transparent;
    padding-bottom: 0px;
    margin-bottom: 10px;
}
}
/* footer */ */
  </style>
</head>
 -->
 





  <div class="modal fade" id="emergency" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> EMERGENCY BLOCK</h4>
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
  <div class="modal fade" id="signin" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> LOG IN</h4>
        </div>
        <div class="modal-body" style="padding:20px">
         <form name="loginForm"
		   action='<c:url value="/admin/login"/>'  class="form signin"  method='POST'>
		    <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
        <input type="text" placeholder="username" name='j_username' style="">
          <input type="text" placeholder="Password" name='j_password' style=""><BR>
          <A HREF="#"  data-dismiss="modal" data-toggle="modal" data-target="#user_reg">Register as New admin here>></A><br>
        <button class="btn btn-danger " style="border-radius:none;">LOG IN</button>
      </form>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="user_reg" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> SIGN UP</h4>
        </div>
        <div class="modal-body" style="padding:20px">
        <form class="form signin">
          <input type="text" placeholder="NAME" style="">
          <input type="email" placeholder="EMAIL" style="">
        <input type="text" placeholder="Mobile Number" style="">
        <input type="date" placeholder="DATE OF BIRTH" style="">
        <select>
          <option value="0">Male</option>
          <option value="1">Female</option>
          <option value="2">Other</option>
        </select>
          <input type="text" placeholder="Password" style="">
         <input type="text" placeholder="Confirm Password" style="">
         <input type="text" placeholder="ADDRESS" style="">
         <input type="text" placeholder="CITY" style="">
         <select>
           <option value="">-select state-</option>
           <option value="0">TELANGANA</option>
           <option value="1">ANDHRAPRADESH</option>
         </select>
         <select>
           <option value="">-select country-</option>
           <option value="0">INDIA</option>
           <option value="1">RUSSIA</option>
         </select>
        <input type="text" placeholder="PINCODE" style="">
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
 
 
 
  <div class="modal fade" id="emergency" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> EMERGENCY BLOCK</h4>
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
  <div class="modal fade" id="signin" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> SIGN IN</h4>
        </div>
        <div class="modal-body" style="padding:20px">
        <form class="form signin">
        <input type="text" placeholder="Registered Mobile Number" style="">
          <input type="text" placeholder="Password" style=""><BR>
          <A HREF="#"  data-dismiss="modal" data-toggle="modal" data-target="#user_reg">Register as New User here>></A><br>
        <button class="btn btn-danger " style="border-radius:none;">SIGN IN</button>
      </form>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="user_reg" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"> SIGN IN</h4>
        </div>
        <div class="modal-body" style="padding:20px">
        <form class="form signin">
          <input type="text" placeholder="NAME" style="">
          <input type="email" placeholder="EMAIL" style="">
        <input type="text" placeholder="Mobile Number" style="">
        <input type="date" placeholder="DATE OF BIRTH" style="">
        <select>
          <option value="0">Male</option>
          <option value="1">Female</option>
          <option value="2">Other</option>
        </select>
          <input type="text" placeholder="Password" style="">
         <input type="text" placeholder="Confirm Password" style="">
         <input type="text" placeholder="ADDRESS" style="">
         <input type="text" placeholder="CITY" style="">
         <select>
           <option value="">-select state-</option>
           <option value="0">TELANGANA</option>
           <option value="1">ANDHRAPRADESH</option>
         </select>
         <select>
           <option value="">-select country-</option>
           <option value="0">INDIA</option>
           <option value="1">RUSSIA</option>
         </select>
        <input type="text" placeholder="PINCODE" style="">
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
        <img src="../resources/images/paris.jpg" alt="Paris" width="400" height="300">
        <p><strong>Paris</strong></p>
        <p>Yes, we built Paris</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="../resources/images/america.jpg" alt="New York" width="400" height="300">
        <p><strong>New York</strong></p>
        <p>We built New York</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="../resources/images/pakisthan.jpg" alt="San Francisco" width="400" height="300">
        <p><strong>San Francisco</strong></p>
        <p>Yes, San Fran is ours</p>
      </div>
    </div>
  </div>
  <div class="row text-center slideanim">
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="../resources/images/paris.jpg" alt="Paris" width="400" height="300">
        <p><strong>Paris</strong></p>
        <p>Yes, we built Paris</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="../resources/images/america.jpg" alt="New York" width="400" height="300">
        <p><strong>New York</strong></p>
        <p>We built New York</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="../resources/images/pakisthan.jpg" alt="San Francisco" width="400" height="300">
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
        <img src="../resources/images/d1.jpg" alt="Paris" width="400"  style="border-radius:50%; height:auto">
        <p><strong>Paris</strong></p>
        <p>Yes, we built Paris</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="../resources/images/d2.jpg" alt="New York" width="400"  style="border-radius:50%;height:auto">
        <p><strong>New York</strong></p>
        <p>We built New York</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="../resources/images/d3.jpg" alt="San Francisco" width="400"  style="border-radius:50%;height:auto">
        <p><strong>San Francisco</strong></p>
        <p>Yes, San Fran is ours</p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="../resources/images/d5.jpg" alt="San Francisco" width="400"  style="border-radius:50%;height:auto">
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
          <img src="../resources/images/h1.jpg" style="margin-bottom:10px;">
      </div>
      <div class="hsptl">
        <img src="../resources/images/h2.jpg" style="margin-bottom:10px;">
    </div>
    <div class="hsptl">
      <img src="../resources/images/h3.jpg" style="margin-bottom:10px;">
  </div>
  <div class="hsptl">
    <img src="../resources/images/h12.jpg" style="margin-bottom:10px;">
</div>
    </div>
    <div class="col-sm-4 col-xs-6">
        <div class="hsptl">
          <img src="../resources/images/h4.jpg" style="margin-bottom:10px;">
      </div>
      <div class="hsptl">
        <img src="../resources/images/h5.jpg" style="margin-bottom:10px;">
    </div>
    <div class="hsptl">
      <img src="../resources/images/h6.jpg" style="margin-bottom:10px;">
  </div>
  <div class="hsptl">
    <img src="../resources/images/h11.jpg" style="margin-bottom:10px;">
  </div>
    </div>
    <div class="col-sm-4 col-xs-6">
        <div class="hsptl">
          <img src="../resources/images/h7.jpg" style="margin-bottom:10px;">
      </div>
      <div class="hsptl">
        <img src="../resources/images/h8.jpg" style="margin-bottom:10px;">
    </div>
    <div class="hsptl">
      <img src="../resources/images/h9.jpg" style="margin-bottom:10px;">
  </div>
  <div class="hsptl">
    <img src="../resources/images/h10.jpg" style="margin-bottom:10px;">
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

