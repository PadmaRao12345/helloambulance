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
            <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">PARTNERS  <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#doctors">DOCTORS</a></li>
                <li><a href="#contact">HOSPITALS</a></li>
              </ul>
            </li>
          </ul>
                      <ul class="nav navbar-nav pull-right">
             <li><a href="javascript:formSubmit()">Logout</a></li>
             
             
            <!-- <li><a href="#"  data-toggle="modal" data-target="#signin" >LOGOUT</a></li> -->
           <%--  <li><form action='<c:url value="/vendor/logout"/>'    method='POST'> <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" /><button>LOGOUT</button></form></li> --%>
          </ul>
          <!-- <ul class="nav navbar-nav pull-right">
            <button href="#" class="btn btn-danger" style="border-radius:none;color:white; height:35px;margin:30px 0 0 0"  data-toggle="modal" data-target="#emergency" >EMERGENCY</button>
            <li><a href="#" class="" style="border-radius:none;color:red; line-height: 60px;"  data-toggle="modal" data-target="#emergency" >EMERGENCY</a></li>
            <li><a href="#" style=""  data-toggle="modal" data-target="#prebook" >PRE-BOOK</a></li>
            <li><a href="#"  data-toggle="modal" data-target="#signin" >Logout</a></li>
          </ul> -->
        </div>
      </div>
    </div>
  </nav>
  <div class="container-fluid" style="margin-top: 75px;" >
    <div class="row profile">
		<div class="col-md-3">
  	<!-- Contenedor -->
  	<ul id="accordion" class="accordion">
      <li>
  <div class="col col_4 iamgurdeep-pic">
 <span><label for="imageUpload" class="btn profile-button" style="position:absolute;"><a href="upload_profile_pic_Doctor">Edit</a></label></span>
    <c:if test="${image==null}"> 
 <c:if test="${gender=='Male'}">
 
  <img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="../resources/images/user_male_dummy.jpg" > 
  </c:if>
  <c:if test="${gender=='Female'}">
  <img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="../resources/images/user_female_dummy.png" > 
  </c:if>
  </c:if> 
<c:if test="${image!=null}"><img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="data:image/jpg;base64, <c:out value='${image}'/>" ></c:if>
 <%--  <img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="data:image/jpg;base64,<c:out value='${doctor}'/>">  --%> <div class="username">
      <h2><span class="profileName"></span>  <small><i class="fa fa-map-marker"></i> <span class="profileCountry"></span> <span class="profileState"></span></small></h2>
  </div>
  </div>
  		<li>
  			<div class="link"><i class="fa fa-code"></i>My Account<i class="fa fa-chevron-down"></i></div>
        <ul class="submenu">
  		  <li ><div class="link"><a  href="ambulancesviewprofileinhospital">My profile</a></div></li>
  			<li ><div class="link"><a  href="listof-Ambulances">Ambulance profile</a></div></li>
  		<li > <div class="link"><a  href="registration" >Ambulance Registration</a></div></li> 		
        </ul>
  		</li>

<li>
  			<div class="link"><i class="fa fa-code"></i>Account Update<i class="fa fa-chevron-down"></i></div>
        <ul class="submenu">
                <li ><div class="link"><a href='<c:url value="ambulanceUpdatePage"/>'>Update Ambulance Profile</a></div></li>
  		  		 <li ><div class="link"><a  href="changevendorPassword">Change Password</a></div></li>
        </ul>
  		</li>


  			
      <!-- class="default open" -->
  		<%-- <li>
  		 <li ><div class="link"><a href='<c:url value="addNewEquipments"/>'>Add Equipments</a></div></li> --%>
      <!-- class="default open" -->
  			<li>
  			<div class="link"><i class="fa fa-code"> </i>Add Equipments<i class="fa fa-chevron-down"></i></div>
  		  		        <ul class="submenu">
  		  		 <li ><div class="link"><a href='<c:url value="addNewAmbulanceEquipments"/>'>Equipments</a></div></li> 
  		</ul>
  		<li>
  			<div class="link"><i class="fa fa-code"></i>Add Services<i class="fa fa-chevron-down"></i></div>
        
        <ul class="submenu">
        
          <li class="link" ><a href="ambreg" > Ambulance Services</a> </li>
        </ul>
  		</li>
  		
  			
      <!-- Hospital -->
      <div class="modal fade" id="add_hsptl" role="dialog">
    <div class="modal-dialog">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Add hospital services</h4>
        </div>
        <div class="modal-body">
          <form id="hsptlForm" action="/action_page.php">
    <h1>Register:</h1>
    <input type="text" class="" placeholder="HOSPITAL NAME">
    <input type="text" class="" placeholder="REGISTRATION NO">
    <input type="date" class="" placeholder="DATE OF INCORPORATION">
    <select >
      <option value="">-select status-</option>
      <option value="0">private limited</option>
      <option value="1">public limited</option>
      <option value="2">others</option>
    </select>

    <!-- Circles which indicates the steps of the form: -->
    <div class="modal-footer">
      <div style="overflow:auto;">
        <div style="float:right;">
          <button type="button" data-dismiss="modal" data-toggle="modal" data-target="#hsptl2" id="nextBtn" >Next</button>
        </div>
      </div>
    </div>
  </form>

        </div>

      </div>

    </div>
  </div>
  <div class="modal fade" id="hsptl2" role="dialog">
<div class="modal-dialog">

  <!-- Modal content-->
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
      <h4 class="modal-title">Add hospital address</h4>
    </div>
    <div class="modal-body">
      <form id="ambForm" action="/action_page.php">
  <h1>Register:</h1>
  <!-- One "tab" for each step in the form: -->
  <input type="email" class="" placeholder="EMAIL ID">
  <input type="text" class="" placeholder="TELEPHONE">
  <input type="text" class="" placeholder="FAX. NO.">
  <input type="text" class="" placeholder="H.NO. STREET">
  <input type="text" class="" placeholder="CITY">
  <select >
    <option value="">--select State--</option>
    <option value="0">TELANGANA</option>
    <option value="1">ANDHRAPRADESH</option>
    <option value="2">TAMILNADU</option>
  </select>
  <select >
    <option value="">--select Country--</option>
    <option value="0">INDIA</option>
    <option value="1">ANDHRAPRADESH</option>
    <option value="2">TAMILNADU</option>
  </select>
  <!-- Circles which indicates the steps of the form: -->
    </div>
    <div class="modal-footer">
      <div style="overflow:auto;">
        <div style="float:right;">
          <button type="button" id="prevBtn" data-dismiss="modal" data-toggle="modal" data-target="#add_hsptl">Previous</button>
          <button type="button" id="nextBtn" data-dismiss="modal" data-toggle="modal" data-target="#hsptl3">Next</button>
        </div>
      </div>
    </div>
    </form>
  </div>
</div>
</div>
<div class="modal fade" id="hsptl3" role="dialog">
<div class="modal-dialog">
<!-- Modal content-->
<div class="modal-content">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title">TAXATION DETAILS</h4>
  </div>
  <div class="modal-body">
    <form id="hsptlForm" action="/action_page.php">
<h1>Register:</h1>
<input type="text" class="" placeholder="PAN NUMBER">
<input type="text" class="" placeholder="TIN NUMBER">
<input type="text" class="" placeholder="VAT/CST NUMBER">
<input type="text" class="" placeholder="GSTIN NUMBER">
<!-- Circles which indicates the steps of the form: -->
<!-- <div style="text-align:center;margin-top:40px;">
<span class="step"></span>
<span class="step"></span>
<span class="step"></span>
<span class="step"></span>
</div> -->
<div class="modal-footer">
  <div style="overflow:auto;">
  <div style="float:right;">
    <button type="button" id="prevBtn" data-dismiss="modal" data-toggle="modal" data-target="#hsptl2">Previous</button>
    <button type="button" id="nextBtn" data-dismiss="modal" data-toggle="modal" data-target="#hsptl4">Next</button>

  </div>
  </div>
</div>
</form>
  </div>
</div>
</div>
</div>
<div class="modal fade" id="hsptl4" role="dialog">
<div class="modal-dialog">
<!-- Modal content-->
<div class="modal-content">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title">BANK DETAILS</h4>
  </div>
  <div class="modal-body">
    <form id="hsptlForm" action="/action_page.php">
<h1>Register:</h1>
<input type="text" class="" placeholder="BANK NAME">
<input type="text" class="" placeholder="BRANCH">
<input type="text" class="" placeholder="ACCOUNT NO.">
<input type="text" class="" placeholder="IFSC CODE">
<input type="text" class="" placeholder="CITY">
<select >
  <option value="">--select State--</option>
  <option value="0">TELANGANA</option>
  <option value="1">ANDHRAPRADESH</option>
  <option value="2">TAMILNADU</option>
</select>
<select >
  <option value="">--select Country--</option>
  <option value="0">INDIA</option>
  <option value="1">ANDHRAPRADESH</option>
  <option value="2">TAMILNADU</option>
</select>
<input type="text" class="" placeholder="POSTAL CODE">
<div class="modal-footer">
  <div style="overflow:auto;">
  <div style="float:right;">
    <button type="button" id="prevBtn" data-dismiss="modal" data-toggle="modal" data-target="#hsptl3">Previous</button>
    <button type="button" id="nextBtn" data-dismiss="modal" >Submit</button>

  </div>
  </div>
</div>
</form>
  </div>
</div>
</div>
</div>
  <!-- Hospital -->

  <!-- ambulance -->

<div class="modal fade" id="add_amb" role="dialog">
<div class="modal-dialog">

<!-- Modal content-->
<div class="modal-content">
<div class="modal-header">
  <button type="button" class="close" data-dismiss="modal">&times;</button>
  <h4 class="modal-title">Add hospital address</h4>
</div>
<div class="modal-body">
  <form id="ambForm" action="/action_page.php">
<h1>Register:</h1>
<!-- One "tab" for each step in the form: -->

<input type="text" class="" placeholder="AMBULANCE HOLDER NAME">
<input type="text" class="" placeholder="DRIVER NAME">
<input type="text" class="" placeholder="DRIVING LICENCE NO.">
<input type="text" class="" placeholder="VEHICLE REGISTRATION NO.">
<input type="DATE" class="" placeholder="SERVICE DATE">
<select >
  <option value="">-select status-</option>
  <option value="0">private limited</option>
  <option value="1">public limited</option>
  <option value="2">others</option>
</select>
<!-- <select >
<option value="">--select State--</option>
<option value="0">TELANGANA</option>
<option value="1">ANDHRAPRADESH</option>
<option value="2">TAMILNADU</option>
</select>
<select >
<option value="">--select Country--</option>
<option value="0">INDIA</option>
<option value="1">ANDHRAPRADESH</option>
<option value="2">TAMILNADU</option>
</select> -->
<!-- Circles which indicates the steps of the form: -->
</div>
<div class="modal-footer">
  <div class="modal-footer">
    <div style="overflow:auto;">
      <div style="float:right;">
        <button type="button" data-dismiss="modal" data-toggle="modal" data-target="#amb2" id="nextBtn" >Next</button>
      </div>
    </div>
  </div>
</div>
</form>
</div>
</div>
</div>

<div class="modal fade" id="amb2" role="dialog">
<div class="modal-dialog">

  <!-- Modal content-->
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal">&times;</button>
      <h4 class="modal-title">Add AMBULANCE services</h4>
    </div>
    <div class="modal-body">
      <form id="ambForm" action="/action_page.php">
<h1>Register:</h1>
<input type="text" class="" placeholder="PROVIDER NAME">
<input type="email" class="" placeholder="EMAIL">
<input type="text" class="" placeholder="MOBILE NO.">
<input type="text" class="" placeholder="CITY">
<select >
  <option value="">--select State--</option>
  <option value="0">TELANGANA</option>
  <option value="1">ANDHRAPRADESH</option>
  <option value="2">TAMILNADU</option>
</select>
<select >
  <option value="">--select Country--</option>
  <option value="0">INDIA</option>
  <option value="1">ANDHRAPRADESH</option>
  <option value="2">TAMILNADU</option>
</select>
<input type="text" class="" placeholder="POSTAL CODE">
<!-- Circles which indicates the steps of the form: -->
<div class="modal-footer">
  <div class="modal-footer">
  </div>
  <div style="overflow:auto;">
    <div style="float:right;">
      <button type="button" id="prevBtn" data-dismiss="modal" data-toggle="modal" data-target="#add_amb">Previous</button>
      <button type="button" id="nextBtn" data-dismiss="modal"  data-toggle="modal" data-target="#amb3">Next</button>
    </div>
  </div>
</div>
</form>

    </div>

  </div>

</div>
</div>
<div class="modal fade" id="amb3" role="dialog">
<div class="modal-dialog">
<!-- Modal content-->
<div class="modal-content">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal">&times;</button>
    <h4 class="modal-title">BANK DETAILS</h4>
  </div>
  <div class="modal-body">
    <form id="hsptlForm" action="/action_page.php">
<h1>Register:</h1>
<input type="text" class="" placeholder="BANK NAME">
<input type="text" class="" placeholder="BRANCH">
<input type="text" class="" placeholder="ACCOUNT NO.">
<input type="text" class="" placeholder="IFSC CODE">
<input type="text" class="" placeholder="PAN NUMBER">
<input type="text" class="" placeholder="CITY">
<select >
  <option value="">--select State--</option>
  <option value="0">TELANGANA</option>
  <option value="1">ANDHRAPRADESH</option>
  <option value="2">TAMILNADU</option>
</select>
<select >
  <option value="">--select Country--</option>
  <option value="0">INDIA</option>
  <option value="1">ANDHRAPRADESH</option>
  <option value="2">TAMILNADU</option>
</select>
<input type="text" class="" placeholder="POSTAL CODE">
<div class="modal-footer">
  <div style="overflow:auto;">
  <div style="float:right;">
    <button type="button" id="prevBtn" data-dismiss="modal" data-toggle="modal" data-target="#amb2">Previous</button>
    <button type="button" id="nextBtn" data-dismiss="modal" >Submit</button>

  </div>
  </div>
</div>
</form>
  </div>
</div>
</div>
</div>
<!-- ambulance -->
  		<li>
  			<div class="link"><i class="fa fa-exchange"></i>Transations <i class="fa fa-chevron-down"></i></div>
  			<ul class="submenu">
  				<li class="">  <a href="#">dropdown1</a> </li>
          <li class="">  <a href="#">dropdown1</a> </li>
          <li class="">  <a href="#">dropdown1</a> </li>
          <li class="">  <a href="#">dropdown1</a> </li>
  			</ul>
  		</li>
  		<li><div class="link"><i class="fa fa-users"></i>Friends <i class="fa fa-chevron-down"></i></div>
  			<ul class="submenu">
      			<li class="photosgurdeep"><a href="#"><img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="http://webncc.in/img/user/gurdeep-singh-osahan.jpg">
  				</a>
                  <a href="#"><img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="http://webncc.in/img/user/gurdeep-singh-osahan.jpg">
      			</a>
                  <a href="#"><img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="http://webncc.in/img/user/gurdeep-singh-osahan.jpg">
      			</a>
                  <a href="#"><img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="http://webncc.in/img/user/gurdeep-singh-osahan.jpg">
      			</a>
  				</li>
  			</ul>
  		</li>
  	</ul>
  	</div>