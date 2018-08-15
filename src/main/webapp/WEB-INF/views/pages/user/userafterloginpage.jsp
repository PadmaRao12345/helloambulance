<%@page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#" style="color:#e40000"><i class="fa fa-ambulance"style="font-size: 38px;    "></i><span> Ambulance</span></a>
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
           <button href="#" class="btn btn-danger" style="border-radius:none;color:white; height:35px;margin:30px 0 0 0"  data-toggle="modal" data-target="#emergency" >EMERGENCY</button>
           
          <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> <div  style="height:30px"> Hi <span class="profileName"></span></a>
             <ul class="dropdown-menu">
          <li class="link"> <a  href="user-page"> My Profile </a></li>
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
  <div style="margin-top: 100px; min-height: 500px" align="center">     
                <h1 style="color: green;">
                    <span class="small-text">Welcome to the Hello Ambulance of</span>
                    <span class="big-text">24/7 care!</span>
      </h1>
      </div>