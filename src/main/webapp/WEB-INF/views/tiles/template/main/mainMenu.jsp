<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
  <nav class="navbar navbar-default navbar-fixed-top">
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
            <li><a href="current_location">location</a></li>
            
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">PARTNERS  <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#doctors">DOCTORS</a></li>
                <li><a href="#contact">HOSPITALS</a></li>
                <li><a href="trielmap">map</a></li>
<!--                 <li><a href="google_map">map</a></li>
 -->                
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