<%-- <%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




    <div class="container" style="margin-top: 100px; min-height: 400px">
<h2>your friend details </h2>
<table BORDER="2"  > 
<tr contenteditable="true">
<!-- <th>your_friend_or_family_id</th>
<th>user_id</th> -->
<th>relation_type</th>
<th>name</th>
<th>gender</th>
<th>date_of_birth</th>
<th>Email</th>
<th>blood_group</th>
<th>willing_to_donate_blood</th>
<th>notify_blood_request</th>
<th>last_blood_donated_date</th>
<th>willing_to_donate_organs</th>
<th>address</th>
<th>country</th>
<th>state</th>
<th>city</th>
<th>pi_code</th>
<th>marital_status</th>
<th>food_habit</th>
<!-- <th>date_of_register</th> -->
<th>activity</th>
</tr>
	 <c:forEach items="${membersdetails}" var="frienddetails">
	 <tr>
	  <td>   <c:out value="${frienddetails.getFamily_member_id()}"></c:out></td>
	  <td> <c:out value="${frienddetails.getUser_id()}"></c:out> </td>
	   <td>  <c:out value="${frienddetails.getRelation_type()}"></c:out> </td>
	    <td><c:out value="${frienddetails.getName()}"></c:out></td>
	  <td> <c:out value="${frienddetails.getGender()}"></c:out></td>
	   <td> <c:out value="${frienddetails.getDate_of_birth()}"></c:out></td>
	   <td> <c:out value="${frienddetails.getEmail_id()}"></c:out></td>
	  <td><c:out value="${frienddetails.getBlood_group()}"></c:out></td>
	  <td><c:out value="${frienddetails.getWilling_to_donate_blood()}"></c:out> </td>
	  <td><c:out value="${frienddetails.getNotify_blood_request()}"></c:out></td>
	  <td><c:out value="${frienddetails.getLast_donated_date()}"></c:out></td>
	   <td><c:out value="${frienddetails.getWilling_to_donate_organs()}"></c:out></td>
	 <td> <c:out value="${frienddetails.getAddress()}"></c:out></td>
	  <td> <c:out value="${frienddetails.getCountry()}"></c:out></td>
	  <td> <c:out value="${frienddetails.getState()}"></c:out></td>
	  <td><c:out value="${frienddetails.getCity()}"></c:out></td>
	  <td><c:out value="${frienddetails.getPincode()}"></c:out></td>
	  <td>  <c:out value="${frienddetails.getMarital_status()}"></c:out></td>
	  <td><c:out value="${frienddetails.getFood_habit()}"></c:out></td>
	   <td> <c:out value="${frienddetails.getDate_of_register()}"></c:out></td>
	    <td>
	     <a href="../updatemember/<c:out value="${frienddetails.getFamily_member_id()}"></c:out>" >update</a> 
	     <a href="../deletemember/<c:out value="${frienddetails.getFamily_member_id()}"></c:out>" >delete</a>
	    </td>
	   
          
      </tr>
        </c:forEach>


</table>
 
    
</div> --%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="col-md-9">
		<div class="profile-content">
		<h3 class="padding:10px">your friend details </h3>
		<div class="row ">
			<div class="col-sm-9">
				<div>
				 <c:forEach items="${membersdetails}" var="frienddetails">
						<span class="title">Relation Type:</span>
						<c:out value="${frienddetails. getRelation_type()}"></c:out>
						<br>
						<span class="title">Name     :</span>
						<c:out value="${frienddetails.getName()}"></c:out>
						<br>
						<span class="title">Gender:</span>
						<c:out value="${frienddetails.getGender()}"></c:out>
						<br>
						<span class="title">Date Of Birth:</span>
						<c:out value="${frienddetails.getDate_of_birth()}"></c:out>
						<br>
						<span class="title">Email:</span>
						<c:out value="${frienddetails.getEmail_id()}"></c:out>
						<br>

						<span class="title">Blood Group:</span>
						<c:out value="${frienddetails.getBlood_group()}"></c:out>
						<br>
						<span class="title">Willing To Donate Blood:</span>
						<c:out value="${frienddetails.getWilling_to_donate_blood()}"></c:out>
						<br>
						<span class="title">Notify Blood Request:</span>
						<c:out value="${frienddetails.getNotify_blood_request()}"></c:out>
						<br>
						<span class="title">Last Blood Donated Date:</span>
						<c:out value="${frienddetails.getLast_donated_date()}"></c:out>
						<br>
						<span class="title">Willing To Donate Organs:</span>
						<c:out value="${frienddetails.getWilling_to_donate_organs()}"></c:out>
						<br>

						<span class="title">Address:</span>
						<c:out value="${frienddetails.getAddress()}"></c:out>
						<br>
						<span class="title">Country :</span>
						<c:out value="${frienddetails.getCountry()}"></c:out>
						<br>
						<span class="title">State:</span>
						<c:out value="${frienddetails.getState()}"></c:out>
						<br>
						<span class="title">City:</span>
						<c:out value="${frienddetails.getCity()}"></c:out>
						<br>
						<span class="title">Pincode:</span>
						<c:out value="${frienddetails.getPincode()}"></c:out>
						<br>
						<span class="title">Marital Status:</span>
						<c:out value="${frienddetails.getMarital_status()}"></c:out>
						<br>
						<span class="title">Food Habit:</span>
						<c:out value="${frienddetails.getFood_habit()}"></c:out>
						<br>

	     
				</div>
			</div>
			
			<ul class="nav navbar-nav pull-right">
					
					 <li class=""><a href="../updatemember/<c:out value="${frienddetails.getFamily_member_id()}"></c:out>" >update</a></li> 
	    <li class=""><a href="../deletemember/<c:out value="${frienddetails.getFamily_member_id()}"></c:out>" >delete</a></li>
	      </ul>
         </c:forEach>
		</div>
	</div>
</div>
 


