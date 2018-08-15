
 <%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-md-9">
		<div class="profile-content">

		<h3 class="padding:10px">Hospital Profile</h3>
		<div class="row ">
			<div class="col-sm-9 ">
				<div>
				 <c:forEach items="${Hospitaldetails}" var="hosdetails">
			
			
			 
					
		<span class="title">Hospital Name:</span> 		<c:out value="${hosdetails. getHospital_name()}"></c:out> <br>
		<span class="title">Hospital Reg.No:</span>	<c:out value="${hosdetails.getHospital_reg_no()}"></c:out> <br>
		<span class="title">Hospital Type:</span>	<c:out value="${hosdetails.getHospital_type()}"></c:out> <br>
		<span class="title">Hospital Website:</span><c:out value="${hosdetails.getHospital_website()}"></c:out> <br>
		<span class="title">No.of.Doctors:</span>	<c:out value="${hosdetails.getNo_of_doctors()}"></c:out><br>
		<span class="title">Equipments:</span>		<c:out value="${hosdetails.getEquipments()}"></c:out> <br>
		<span class="title">HospitalAddress</span>	<c:out value="${hosdetails.getHospital_address()}"></c:out> <br>
		<span class="title">Country :</span>		<c:out value="${hosdetails.getCountry()}"></c:out> <br>
		<span class="title">State:</span>			<c:out value="${hosdetails.getState()}"></c:out> <br>
		<span class="title">City:</span>			<c:out value="${hosdetails.getCity()}"></c:out> <br>
		<span class="title">Pincode:</span>			<c:out value="${hosdetails.getPincode()}"></c:out> <br>
		<span class="title">From_Time:</span>		<c:out value="${hosdetails.getFrom_time()}"></c:out><br>
		<span class="title">To_Time:</span>			<c:out value="${hosdetails.getTo_time()}"></c:out><br>
				   </c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>
