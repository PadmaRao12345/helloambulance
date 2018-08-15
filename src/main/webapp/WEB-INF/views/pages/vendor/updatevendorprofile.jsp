<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

  <div class="container"  style="margin-top:100px;">
    <h2>Update Profile </h2>

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




