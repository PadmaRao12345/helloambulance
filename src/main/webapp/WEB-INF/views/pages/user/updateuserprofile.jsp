<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript">

	$(document).ready(function() {
		$('#country').change(function() {
		$.getJSON('<c:url value="/loadStates/?${_csrf.parameterName}=${_csrf.token}"/>',
				{
				countryId : $(this).val(),
				ajax : 'true'
				},
				function(data) {
					var select = $('#state');
						select.find('option').remove();
																$
																		.each(
																				data,
																				function(
																						index,
																						value) {
																					$(
																							'<option>')
																							.val(
																									value.stateId)
																							.text(
																									value.stateName)
																							.appendTo(
																									select);
																				});
															});
										});
						$('#state')
								.change(
										function() {
											$
													.getJSON(
															'<c:url value="/loadCities/?${_csrf.parameterName}=${_csrf.token}"/>',
															{
																stateId : $(
																		this)
																		.val(),
																ajax : 'true'
															},
															function(data) {
																var select = $('#city');
																select
																		.find(
																				'option')
																		.remove();
																$
																		.each(
																				data,
																				function(
																						index,
																						value) {
																					$(
																							'<option>')
																							.val(
																									value.cityId)
																							.text(
																									value.cityName)
																							.appendTo(
																									select);
																				});
															});

										});

						$(document)
								.ready(
										function() {
											$('#Blood_group')
													.focus(
															function() {
																$
																		.getJSON(
																				'<c:url value="/loadBloodGroup/?${_csrf.parameterName}=${_csrf.token}"/>',
																				{
																				/*  bloodGroupId : $(this).val(),
																				ajax : 'true'  */
																				},
																				function(
																						data) {
																					var select = $('#Blood_group');
																					select
																							.find(
																									'option')
																							.remove();
																					$
																							.each(
																									data,
																									function(
																											index,
																											value) {
																										$(
																												'<option>')
																												.val(
																														value.bloodGroupId)
																												.text(
																														value.bloodGroupName)
																												.appendTo(
																														select);
																									});
																				});
															});
										});

					});
</script>
		<div>
			<div class="col-md-9">
				<div class="profile-content">

					<div class="row ">
						<div class="col-sm-9">
							<div class="panel panel-primary setup-content">
								<div class="panel-heading">
									<h2 class="panel-title">UPDATE PROFILE:</h2>
								</div>
								<div class="panel-body">
									<form action='<c:url value="updateUser"/>' method="POST">

										<div class="group input_form_sign ">
											<label>Username</label> <input class="inputMaterial"
												type="text" name="name" value="${user.name}" id="name"
												required>
										</div>
										<div class="group input_form_sign ">
											<label>Mobile Number</label> <input class="inputMaterial"
												type="text" name="mobile_number"
												value="${user.mobile_number}" readonly="readonly"
												id="mobile_number" required>
											<div id="id_div" class="error"></div>
										</div>

										<div class="group input_form_sign ">
											<label>E-mail Id</label> <input class="inputMaterial"
												type="text" name="email_id" value="${user.email_id}"
												readonly="readonly" id="email_id" required>
											<div id="id_res_div" class="error"></div>
										</div>


										<div class="group input_form_sign ">
											<label>DateOfBirth</label> <input class="inputMaterial"
												type="text" name="date_of_birth"
												value="${user.date_of_birth}" id="date_of_birth" required>

										</div>

										<div class="group input_form_sign ">
											<label> Gender</label> <input class="inputMaterial"
												type="text" name="gender" value="${user.gender}"
												readonly="readonly" id="gender" required>

										</div>

										<div class="group input_form_sign ">
											<label>Blood Group</label> 
												<select name="blood_group" class="inputMaterial gender" id="Blood_group" value="${user.blood_group}">
                      <option value="">-select Blood Group-</option>
                 <!--  <option value="1"> B+ve</option>
                  <option value="2">O+ve </option>
                  <option value="3">B-ve </option> -->
                </select>

										</div>


										<div class="group input_form_sign ">
											<label>Country</label> <input class="inputMaterial"
												type="text" name="country" value="${user.country}"
												readonly="readonly" id="country" required>

										</div>
										<div class="group input_form_sign ">
											<label>State</label> <input class="inputMaterial" type="text"
												name="state" value="${user.state}" readonly="readonly"
												id="state" required>
										</div>

										<div class="group input_form_sign ">
											<label>City</label> <input class="inputMaterial" type="text"
												name="city" value="${user.city}" readonly="readonly"
												id="city" required>

										</div>

										
										<div class="group input_form_sign ">
											<label>Pincode</label> <input class="inputMaterial" type="text"
												name="pincode" value="${user.pincode}" readonly="readonly"
												id="pincode" required>

										</div>
								</div>
								<div class="cont_btn">
									<button type="submit" class="btn btn-danger "
										style="border-radius: none;">Update Details</button>
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
		<div class="col-sm-6" style="border-right: 1px solid #e5e5e5"></div>
	</div>