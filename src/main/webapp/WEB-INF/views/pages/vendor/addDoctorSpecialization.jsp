<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
$(document).ready(function() {
	  $("#specialization").focus(function(){
	// $("button[type=submit]").attr("disabled", "disabled");
	 $.getJSON('<c:url value="/vendor/loadDoctorSpecializationbydegree"/>', {
	 //countryId : $(this).val(),
	 ajax : 'true'
	 }, function(data) {
	//alert(data);	 
	
	 var select = $('#specialization');
	//select.find('option').remove();
	 $.each(data, function(index, value) {
		 //alert(value.art_name);
		 $('<option>').val(value.doctor_specialization_id).text(value.doctor_specialization_type).appendTo(select);
		// $("<input type='checkbox' name="+value.equipment_name+" >"+value.equipment_name+"</input>").appendTo(select);
	 });
	 });
	 });
});


$(document).ready(function() {
	$("#specialization").change(function() {
		$.ajax({
			url : 'check_specialization_avail_doctor',
			data : {
				specialization : $("#specialization").val()
			},
			success : function(data) {
				if(data==""){
					$("#id_div").html(data);
					  $("#submit").removeAttr("disabled");
					 
				}
				else{
					$("#id_div").html(data);
					 $("#submit").attr("disabled", "disabled");
				}			
			}
		});
	});
});

</script>
<div class="container" style="margin-top: 100px; min-height: 150px">
<div>
 <form action="addDoctorSpecialization" method="POST">
 <div class="group input_form_sign col-sm-2 " style="margin-left: 50%">

 
                  <select name="specialization" class="inputMaterial type_reg valid" id="specialization" required aria-required="true" aria-invalid="false">
                    
                   <option value="">select Specialization</option>
                  <!--    <option value="1">AMBULANCE</option>
                    <option value="2">HOSPITAL</option> -->
<!--                   <option value="12">Hospital</option>
                  <option value="14">Doctor</option>
                  <option value="17">Ambulance</option> -->
                  </select>
                  
                   <div id="id_div" class="error" style="max-width: 300px;color: red;"></div>
                </div>
                <div> <button type="submit" id="submit" class="btn btn-default" >Add</button></div>
                </form>
                </div>
                
<div class="container col-sm-8">
              
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Sno</th>
        <th>Specialization Name</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${specializationsList}" var="specialization" varStatus="status">
      <tr class="active">
    
      <td>${status.count}</td>
      <td>${specialization}</td>
      
      </tr>
           </c:forEach>
    </tbody>
  </table>
  
 
</div>

 
</div>