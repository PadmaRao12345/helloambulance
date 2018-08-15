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
});
</script>

 <div class="modal-dialog" style="overflow-y: overlay;  width: 50%; margin-top: 60px;
   margin-bottom: 80px;">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title">Find Hospitals</h4>
          </div>
          <div class="modal-body" style="padding:20px">
            <form class=" register"  method="POST"  action="hospitalsearch">
              <div class="row">
            <div class="col-sm-6" style="border-right: 1px solid #e5e5e5">
                    
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
                <select name="city" class="inputMaterial gender" id="city"  >
                  <option value="">-select Hospital-</option>
                </select>
              </div> 
              <div class="clont_btn">
                <button class="btn btn-danger " style="border-radius:none;">Search</button>
              </div>
                    </div>
                    </div>
                    </form>
                    </div>
                    </div>
</div>
        
        