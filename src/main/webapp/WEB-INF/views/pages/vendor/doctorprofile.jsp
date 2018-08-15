 <%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-md-9">
		<div class="profile-content">
		<h3 class="padding:10px">Doctor Profile</h3>
		<div class="row ">
			<div class="col-sm-9">
				<div>
				 <c:forEach items="${Doctordetails}" var="docdetails">
				<span class="title">Doctor Degree:</span><c:out value="${docdetails. getDoctor_degree()}"></c:out> <br>
					<span class="title">Doctor Specialization:</span> <c:out value="${docdetails.getDoctor_specialization()}"></c:out><br>
					<span class="title">Hospital Name:</span><c:out value="${docdetails.getHospitalname()}"></c:out> <br>
					<span class="title">Year Of Experiences:</span><c:out value="${docdetails.getExperience()}"></c:out> <br>
					<span class="title">Practice LOcation:</span> <c:out value="${docdetails.getPractice_location()}"></c:out> <br>
					<span class="title">Address:</span><c:out value="${docdetails.getAddress()}"></c:out> <br>
					<span class="title">Country :</span><c:out value="${docdetails.getCountry()}"></c:out> <br>
					<span class="title">State:</span><c:out value="${docdetails.getState()}"></c:out> <br>
					<span class="title">City:</span><c:out value="${docdetails.getCity()}"></c:out> <br>
					<span class="title">Pincode:</span><c:out value="${docdetails.getPincode()}"></c:out><br>
				 </c:forEach>
				</div>
			</div>
		</div>
	</div>
</div>


