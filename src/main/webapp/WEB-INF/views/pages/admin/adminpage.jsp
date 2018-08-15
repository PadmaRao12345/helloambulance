
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


	<script>
    function openNavi() {
        $("#mySide").css("width","230px");
        $("#main").css("margin-left","230px");
				$(".nav-header").show();
        $("#menu>li>a>span").show();
    }
    function closeNavi() {
        $("#mySide").css("width","50px");
        $("#main").css("margin-left","50px");
				$(".nav-header").hide();
        $("#menu>li>a>span ").hide();
    }
	</script>

<body>
	
<div class="container-fluid " id="main" onmouseover="closeNavi()">
			 <div class="page-content">
	<div class="details">
		<div class="row">
		<div class="col-sm-12 col-xs-12">
<div class="page-head">
	<h3>ambulance Dashboard</h3>
</div>
<div class="row">
	<div class="col-lg-12 col-sm-12">
	<div class="col-lg-6 col-sm-6">
<div class="row">
<div class="col-lg-6 col-sm-6 col-xs-12">
	<div class="card">
			<div class="content">
					<div class="row">
							<div class="col-xs-5">
									<div class="icon-big icon-warning text-center">
											<img src="../resources/images/emer.png"  />
									</div>
							</div>
							<div class="col-xs-7">
									<div class="numbers">
											<p>emergency patient list</p>
											1,053
									</div>
							</div>
					</div>
					<div class="footer">

							<div class="stats">
									<i class="fa fa-refresh" aria-hidden="true"></i> Updated now
							</div>
					</div>
			</div>
	</div>
</div>
<div class="col-lg-6 col-sm-6 col-xs-12">
	<div class="card">
			<div class="content">
					<div class="row">
							<div class="col-xs-5">
                <div class="icon-big icon-warning text-center">
                    <img src="../resources/images/pre.png" />
                </div>
            </div>
							<div class="col-xs-7">
									<div class="numbers">
											<p>Pre book patients list</p>
											45
									</div>
							</div>
					</div>
					<div class="footer">

							<div class="stats">
									<i class="fa fa-calendar"></i> Last day
							</div>
					</div>
			</div>
	</div>
</div>
<div class="col-lg-6 col-sm-6 col-xs-12">
	<div class="card">
			<div class="content">
					<div class="row">
            <div class="col-xs-5">
              <div class="icon-big icon-warning text-center">
                  <img src="../resources/images/hos.png" />
              </div>
          </div>
							<div class="col-xs-7">
									<div class="numbers">
											<p>add hospital</p>
											23
									</div>
							</div>
					</div>
					<div class="footer">

							<div class="stats">
									<i class="fa fa-clock-o"></i> In the last hour
							</div>
					</div>
			</div>
	</div>
</div>
<div class="col-lg-6 col-sm-6 col-xs-12">
	<div class="card">
			<div class="content">
					<div class="row">
            <div class="col-xs-5">
              <div class="icon-big icon-warning text-center">
                  <img src="../resources/images/add.png" />
              </div>
          </div>
							<div class="col-xs-7">
									<div class="numbers">
											<p>add ambulance</p>
											45
									</div>
							</div>
					</div>
					<div class="footer">

							<div class="stats">
									<i class="fa fa-refresh"></i> Updated now
							</div>
					</div>
			</div>
	</div>
</div>




</div>
</div>

</div>
</div>

</div>
									</div><br>
								</div>
						</div>
						
						</div>
<!-- <!-- <div class="col-md-9">
            <div class="profile-content">
			   <div class="col-md-9">
            <div class="profile-content">
			   <div class="row ">
         <div class="col-sm-6 ">
            <div class="profile-inf">
           <span class="title">Name:</span> <span class="profileName"> GURDEEP OSAHAN </span><br>
            <span class="title">Mobile No:</span> <span class="profileMobileNumber">12345678912 </span><br>
             <span class="title">E-Mail ID:</span> <span class="profileEmailId">GURDEEPOSAHAN@GMAIL.COM </span><br>
             <span class="title">DOB:</span> <span class="profileDateOfBirth">07/08/1992 </span><br>
             <span class="title">Gender:</span> <span class="profileGender">Male</span><br>
             <span class="title">BloodGroup:</span> <span class="profileBloodGroup">O+ve </span><br>
             <span class="title">Country:</span> <span class="profileCountry">India</span><br>
             <span class="title">State:</span> <span class="profileState">Telangana </span><br>
              <span class="title">City:</span> <span class="profileCity">hyd</span><br>
               <span class="title">PinCode:</span> <span class="profilePinCode">507001 </span><br>
                           <h4>Name:</h4><span class="inf">praveen</span><br>
               <h4>Name:</h4><span class="inf">praveen</span>
             </div>
         
         <div class="col-sm-6 ">
            <div class="profile-inf">
            </div>
         </div>
       </div>
            </div>
		</div>
	</div>
</div>
 -->
      </body>
      </html>
    