  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
$(document).ready(function(){
	 $('#state').focus(function() {
		 $.getJSON('<c:url value="loadAllStates/?${_csrf.parameterName}=${_csrf.token}"/>', {	
		 }, function(data) {
		 var select = $('#state');
		 select.find('option').remove();
		 $.each(data, function(index, value) {
		 $('<option>').val(value.stateId).text(value.stateName).appendTo(select);
		 });
		 });
	});
	 
	 $('#state').change(function() {
			 $.getJSON ('<c:url value="/loadCities/?${_csrf.parameterName}=${_csrf.token}"/>', {
			 stateId : $(this).val(),
			 ajax : 'true'
			 }, function(data) {
			 var select = $('#city');
			 select.find('option').remove();
			 $.each(data, function(index, value){
			 $('<option>').val(value.cityId).text(value.cityName).appendTo(select);
			 });
			 });
			 
		});
	 $('#hospital_name').click(function() {
		 var cityId=$("#city").val();
		// alert(cityId);
		 $.getJSON ('<c:url value="loadHospitals/?cityId='+cityId+'"/>', {
	 	//cityId : $(this).val(),
		 ajax : 'true'
		 }, function(data) {
		 var select = $('#hospital_name');
		 select.find('option').remove();
		 $.each(data, function(index, value){
		 $('<option>').val(value.vendor_reg_id).text(value.hospital_name).appendTo(select);
		 });
		 });
	 });
	 
	/*  $('#city').change(function() {
		 var cityId=$("#city").val();
		 $.getJSON ('<c:url value="loadHospitals/?${_csrf.parameterName}=${_csrf.token}"/>', {
	 	cityId : $(this).val(),
		 ajax : 'true'
		 }, function(data) {
		 var select = $('#hospital_name');
		 select.find('option').remove();
		 $.each(data, function(index, value){
		 $('<option>').val(value.vendor_reg_id).text(value.hospital_name).appendTo(select);
		 });
		 });
		 
	}); */
});
			$(document).ready(function(){
		 $('#Doctor_Specialization').focus(function() {
					
							 $.getJSON ('<c:url value="loadSpecialization/?${_csrf.parameterName}=${_csrf.token}"/>', {				 
								
							 }, function(data) {
							 var select = $('#Doctor_Specialization');
							 select.find('option').remove();
							 $.each(data, function(index, value) {
							 $('<option>').val(value.doctor_specialization_id).text(value.doctor_specialization_type).appendTo(select);
							 });
							 });
						}); 
		});



</script>
     <!--  <div class="modal-dialog" style="overflow-y: overlay;  width: 100%; margin-top: 60px;
   margin-bottom: 80px;">
        Modal content
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Find Doctors</h4>
          </div>
          <div class="modal-body" style="padding:20px">
            
              <div class="row">
            <div class="col-sm-9" style="border-right: 1px solid #e5e5e5">
                 <form class=" register"  method="POST"  action="doctorsearch">   
               <div class="group input_form_sign " >
                <select name="state" class="inputMaterial gender" id="state" required >
                  <option value="">-select your current State-</option>
                </select>
              </div>
               <div class="group input_form_sign " >
                <select name="city" class="inputMaterial gender" id="city" required >
                  <option value="">-select your current city-</option>
                </select>
              </div>
               <div class="group input_form_sign " >
                <select name="hospitalId" class="inputMaterial gender" id="hospital_name"  >
                  <option value="">-select Hospital-</option>
                </select>
              </div>
              <div class="group input_form_sign ">
                <select name="Doctor_Specialization" class="inputMaterial gender" id="Doctor_Specialization">
                  <option value="">-select specialization-</option>
                </select>      
              </div>
              <div class="cont_btn">
                <button type="submit" class="btn btn-danger " style="border-radius:none;">Search</button>
              </div>
              </form>
                    </div>
                    </div>
                   
                    </div>
                       
                    </div>
                 
</div> -->

 <div class="modal-dialog" style="overflow-y: overlay;  width: 50%; margin-top: 60px;
   margin-bottom: 80px;">
        <!-- Modal content-->
        
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Find Doctors</h4>
          </div>
          <div class="modal-body" style="padding:20px">
            <form class=" register"  method="POST"  action="doctorsearch">
              <div class="row">
            <div class="col-sm-9" style="border-right: 1px solid #e5e5e5">
                    
          
               <div class="group input_form_sign " >
                <select name="state" class="inputMaterial gender" id="state" required >
                  <option value="">-select your current State-</option>
                </select>
              </div>
               <div class="group input_form_sign " >
                <select name="city" class="inputMaterial gender" id="city" required >
                  <option value="">-select your current city-</option>
                </select>
              </div>
               <div class="group input_form_sign " >
                <select name="hospitalId" class="inputMaterial gender" id="hospital_name"  >
                  <option value="">-select Hospital-</option>
                </select>
              </div>
               <div class="group input_form_sign ">
                <select name="Doctor_Specialization" class="inputMaterial gender" id="Doctor_Specialization" >
                  <option value="">-select specialization-</option>
                </select>      
              </div> 
              <div class="cont_btn">
                <button class="btn btn-danger " style="border-radius:none;">Search</button>
              </div>
                    </div>
                    </div>
                    </form>
                    </div>
                    </div>
</div>
            
            