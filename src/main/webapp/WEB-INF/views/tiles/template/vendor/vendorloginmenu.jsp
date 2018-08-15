<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
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
			value="${_csrf.token}" /><br>
        <input type="text" placeholder="username" name='j_username' style="">
          <input type="password" placeholder="Password" name='j_password'style=""><BR>
            <div class=" link_forgot_pass  ">
   <a href="forgotPasswordforvendor" class="forgotPassword " >Forgot Password ?</a>

            </div>
         <a href='<c:url value="registration"/>'>Register as New vendor here>></a><br> 
<!--           <A HREF="#"  data-dismiss="modal" data-toggle="modal" data-target="#user_reg">Register as New vendor here>></A><br> 
 -->        <button class="btn btn-danger " style="border-radius:none;">SIGN IN</button>
      </form>
        </div>
      </div>
    </div>
  </div>

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
            <li><a href="#"  data-toggle="modal" data-target="#signin" >VENDOR LOGIN</a></li>
          </ul>
        </div>
      </div>
    </div>
  </nav>
  </body>