<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <script src='<c:url value="/resources/jsfiles/doctr.js"/>' ></script>

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
    <h3>Add Details </h3>

    <div class="stepwizard">
        <div class="stepwizard-row setup-panel">
            <div class="stepwizard-step col-xs-3">
                <a href="#step-1" type="button" class="btn btn-danger btn-circle">1</a>
                <p><small>STEP1</small></p>
            </div>
            <div class="stepwizard-step col-xs-3">
                <a href="#step-2" type="button" class="btn btn-default btn-circle" disabled>2</a>
                <p><small>STEP2</small></p>
            </div>
            <div class="stepwizard-step col-xs-3">
                <a href="#step-3" type="button" class="btn btn-default btn-circle" disabled>3</a>
                <p><small>STEP3</small></p>
            </div>
            <div class="stepwizard-step col-xs-3">
                <a href="#step-4" type="button" class="btn btn-default btn-circle" disabled>4</a>
                <p><small>STEP4</small></p>
            </div>
        </div>
    </div>

    <form role="form">
        <div class="panel panel-primary setup-content" id="step-1">
            <div class="panel-heading">
                 <h3 class="panel-title">Research and Publications</h3>
            </div>
            <div class="panel-body">
                   <div class="form-group">
                    <label class="control-label">Research</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Research" />
                </div>
                <div class="form-group">
                    <label class="control-label">Publications</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Publications" />
                </div>

                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>

              </div>
           </div>      
        <div class="panel panel-primary setup-content" id="step-2">
          <div class="panel-heading">
               <h3 class="panel-title">Work Experience</h3>
          </div>
 <div class="panel-body">
                   <div class="form-group">
                    <label class="control-label">Hospital Name</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Your HospitalName" />
                </div>
                <div class="form-group">
                    <label class="control-label">Experiences</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Your Experience Details" />
                </div>
                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
<button class="btn btn-primary  pull-right" type="button">Previous</button>
            </div>
</div>
        <div class="panel panel-primary setup-content" id="step-3">
            <div class="panel-heading">
                 <h3 class="panel-title">Certification & Professional Membership</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">Certification</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Your Certification" />
                </div>
                <div class="form-group">
                    <label class="control-label">Professional Membership</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Your Professional Membership Details" />
                </div>

                <button class="btn btn-primary nextBtn pull-right" type="button">Next</button>
      <button class="btn btn-primary  pull-right" type="button">Previous</button>
            </div>
        </div>

        <div class="panel panel-primary setup-content" id="step-4">
            <div class="panel-heading">
                 <h3 class="panel-title">Achivements & Awards</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label class="control-label">Achivements</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Your Achivements" />
                </div>
                <div class="form-group">
                    <label class="control-label">Awards</label>
                    <input maxlength="200" type="text" required="required" class="form-control" placeholder="Enter Your Awards" />
                </div>
                <button class="btn btn-success pull-right" type="submit">Finish!</button>
            </div>
        </div>
    </form>
    </div>
    </body>
    <html>
    </html>
    