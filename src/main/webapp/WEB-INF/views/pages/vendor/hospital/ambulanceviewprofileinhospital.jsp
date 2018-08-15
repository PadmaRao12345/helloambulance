<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <div class="col-md-9">
	<div class="profile-content">
		<h3 class="padding:10px">Profile</h3>
		<div class="row ">
			<div class="col-sm-6 ">
				<div>
				<img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="data:image/jpg;base64,<c:out value='${doctor.image}'/>" >
					<span class="title">Name:</span> <span><c:out value="${doctor.doctor_name }"></c:out></span><br>
					<span class="title">Specializations :</span><c:out value="${doctor.doctor_specialization }"></c:out><br>
					<span class="title">Experience :</span> <span> <c:out value="${doctor.experience}"></c:out>Years</span>
				</div>
			</div>
		</div>
	</div>
</div>
 --%>

	<div>

	<div class="col-md-9">
		<div class="profile-content">
			<div class="row ">
				<div class="col-sm-4">
					
						<div class="panel-body">
				<c:if test="${ambulance.image==null}"> 
  <img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="../resources/images/ambulance_Img-1.jpg" > 
  </c:if>
<c:if test="${ambulance.image!=null}"><img class="img-responsive iamgurdeeposahan" alt="image not found" src="data:image/jpg;base64,<c:out value='${ambulance.image}'/>" ></c:if>
				

						</div>
					
				</div>
				<div class="col-sm-8" style="margin-top: 70px">
					<span class="title">Name:</span> <span><c:out value="${ambulance.name }"></c:out></span><br>
					<span class="title">Email_id:</span> <span><c:out value="${ambulance.email_id }"></c:out></span><br>
					<span class="title">Type of Ambulance :</span><c:out value="${ambulance.type_of_ambulance }"></c:out><br>
					<span class="title">Vechicle Reg.no :</span> <span> <c:out value="${ambulance.vechicle_reg_no}"></c:out></span><br>
					<span class="title">Vechicle Engine.no :</span> <span> <c:out value="${ambulance.vechicle_engine_no}"></c:out></span><br>
					<span class="title">Vechicle Colour :</span> <span> <c:out value="${ambulance.vechicle_colour}"></c:out></span><br>
					<span class="title">Equipments:</span> <span> <c:out value="${ambulance.equipments}"></c:out></span><br>
					<span class="title">Address :</span> <span> <c:out value="${ambulance.address}"></c:out></span><br>
					<span class="title">city :</span> <span> <c:out value="${ambulance.city}"></c:out></span>				
				</div>

			</div>
		</div>
	</div>
</div>