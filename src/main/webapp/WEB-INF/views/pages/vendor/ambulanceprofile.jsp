<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

button {
  background-color: #4CAF50;
  color: #ffffff;
  border: none;
  padding: 5px 20px;
  font-size: 17px;
  font-family: Raleway;
  cursor: pointer;
  margin-left: 700px;
}
</style>

	<div>

	<div class="col-md-9">
	
		<div class="profile-content">
		<a href="ambulanceUpdatePage?register_ambulance_id=${ambulance.register_ambulance_id}"><button class="btn-success"> <h4 style="color: black;">Edit Profile</h4></button></a>
			<div class="row ">
				<div class="col-sm-4">
					
						<div class="panel-body">
				
<img class="img-responsive iamgurdeeposahan" alt="iamgurdeeposahan" src="../resources/images/user_male_dummy.jpg" > 
						</div>
					
				</div>
				<div class="col-sm-8" style="margin-top: 70px">
					<span class="title">Organization Name:</span> <span><c:out value="${ambulance.organization_name}"></c:out></span><br>
					<span class="title">Ambulance Type :</span><c:out value="${ambulance.type_of_ambulance}"></c:out><br>
					<span class="title">Vehicle Color  :</span> <span> <c:out value="${ambulance.vechicle_colour}"></c:out></span><br>
									<span class="title">vehicle Engine Number  :</span> <span> <c:out value="${ambulance.vechicle_engine_no}"></c:out></span><br>
									<span class="title">vehicle registration Number  :</span> <span> <c:out value="${ambulance.vechicle_reg_no}"></c:out></span><br>
									<span class="title">vehicle Model  :</span> <span> <c:out value="${ambulance.vechicle_model}"></c:out></span><br>
									<span class="title">Equipments   :</span> <span> <c:out value="${ambulance.equipments}"></c:out></span>
				
				
				
				
				
				</div>

			</div>
		</div>
	</div>
</div>