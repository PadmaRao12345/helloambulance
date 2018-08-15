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
				<c:if test="${doctor.image==null}"> 
 <c:if test="${doctor.gender=='Male'}">
  <img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="../resources/images/male_dummy.jpg" > 
  </c:if>
  <c:if test="${doctor.gender=='Female'}">
  <img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="../resources/images/female_dummy.jpg" > 
  </c:if>
  </c:if> 
<c:if test="${doctor.image!=null}"><img class="img-responsive iamgurdeeposahan" alt="image not found" src="data:image/jpg;base64,<c:out value='${doctor.image}'/>" ></c:if>
				

						</div>
					
				</div>
				<div class="col-sm-8" style="margin-top: 70px">
					<span class="title">Name:</span> <span><c:out value="${doctor.doctor_name }"></c:out></span><br>
					<span class="title">Specializations :</span><c:out value="${doctor.doctor_specialization }"></c:out><br>
					<span class="title">Experience :</span> <span> <c:out value="${doctor.experience}"></c:out>Years</span>
				</div>

			</div>
		</div>
	</div>
</div>