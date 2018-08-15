<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

 <div>
	<div class="col-md-9">
		<div class="profile-content">

			<div class="row ">
				<div class="col-sm-9">
					<div class="panel panel-primary setup-content">
						<div class="panel-heading">
							<h2 class="panel-title">Update Ambulance Profile:</h2>
						</div>
						<div class="panel-body">
							<form  action='<c:url value="updateAmbulance"/>'  method="POST" >
							<input type="text" name="register_ambulance_id" value="${ambulance.register_ambulance_id}" hidden="true">
							
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="organization_name" value="${ambulance.organization_name}"
										id="organization_name" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>NAME OF THE ORGANIZATION</label>
									</div>
								</div>
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="vechicle_reg_no" value="${ambulance.vechicle_reg_no}"
										id="vechicle_reg_no" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Vehicle Reg.No</label>
									</div>
								</div>
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="vechicle_model" value="${ambulance.vechicle_model}"
										id="vechicle_model" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Vehicle Model</label>
									</div>
								</div>
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="vechicle_engine_no" value="${ambulance.vechicle_engine_no}"
										id="vechicle_engine_no" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Engine.No</label>
									</div>
								</div>
								<div class="group input_form_sign  ">
									<input class="inputMaterial" type="text"
										name="vechicle_colour" id="vechicle_colour"  value="${ambulance.vechicle_colour}" required> <span
										class="highlight"></span> <span class="bar"></span>
									<div class="lef">
										<label>Vehicle Colour</label>
									</div>
								</div>
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="purchesed_from" value="${ambulance.purchesed_from}"
										id="purchesed_from" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Purchsed From</label>

									</div>
								</div>
								
								<!-- <div class="group input_form_sign ">
									<select name="type_of_ambulance" class="inputMaterial gender"
										id="type_of_ambulance" required>
										<option value="">-Select Ambulance Type-</option>
										<option value="1">ALS</option>
										<option value="2">BLS</option>
									</select>
								</div> -->
								<!-- 
								<div class="group input_form_sign ">
									<input class="inputMaterial" type="text" name="equipments"
										id="" required> <span class="highlight"></span> <span
										class="bar"></span>
									<div class="lef">
										<label>Medical Equipments</label>
									</div>
								</div> -->
								
									<!--  <div class="group input_form_sign ">
                      <label>Medical Equipments:</label>
                       <input type="radio"   name=""equipments"" value="1" id="" required>Oxygen
                       <input type="radio"   name=""equipments"" value="0" required> Ventilater
                     </div> -->
                    
                   <!--   <div class="group input_form_sign ">
                      <label>Equipments:</label>
                         <div class="cols-sm-10">
                 <div class="input-group equipments " style="width:100%">
               
                 </div>
               </div>
                      <span class="input-group equipment" style="width: 100%">
               
                 </span>
                      
                     </div>  -->
								
								<div class="group input_form_sign ">
										<label>Address</label>
										<input class="inputMaterial" type="text" name="hospital_address" value="${ambulance.address}"
											id="hospital_address" required readonly="readonly"> 
									</div>
									
									
									<div class="group input_form_sign ">
									<label>Country</label>
									<input class="inputMaterial" type="text" name="country" value="${ambulance.country}" readonly="readonly"
										id="country" required>

								</div>
								<div class="group input_form_sign ">
								<label>State</label>
									<input class="inputMaterial" type="text" name="state" value="${ambulance.state}" readonly="readonly"
										id="state" required> 
								</div>

									<div class="group input_form_sign ">
									<label>City</label>
									<input class="inputMaterial" type="text" name="city" value="${ambulance.city}" readonly="readonly"
										id="city" required> 

								</div>
								

									<div class="group input_form_sign ">
									<label>pincode</label>
										<input class="inputMaterial" type="text" name="pincode" value="${ambulance.pincode}" readonly="readonly"
											id="pincode" required> <span class="highlight"></span>
										
										
									</div>
								<div class="cont_btn">
									<button type="submit" class="btn btn-danger " 
										style="border-radius: none;" >Update Details</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- <div class="col-sm-3">
					<ul class="">
						<h3>Add your</h3>
						<li><a href="doctor1.html">Education</a></li>
						<li><a href="doctor2.html">Experience</a></li>
						<li><a href="doctor3.html">Practice location</a></li>
						<li><a href="doctor4.html">membership</a></li>
						<li><a href="doctor5.html">Awards</a></li>
						<li><a href="doctor6.html">Achievements</a></li>
						<li><a href="doctor7.html">Publication/Presentation</a></li>
						<li><a href="doctor8.html">Courses</a></li>
						<li><a href="doctor9.html">Profile Picture</a></li>
						<li><a href="doctor10.html">Upload identity</a></li>
					</ul>
				</div> -->

			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-sm-6" style="border-right: 1px solid #e5e5e5">

		
	</div>
</div>


