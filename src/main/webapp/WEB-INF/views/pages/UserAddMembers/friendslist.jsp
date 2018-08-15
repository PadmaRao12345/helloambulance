<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



    <div class="container" style="margin-top: 100px; min-height: 500px">


<h2>your friends </h2>
<ol>
     <%-- <c:forEach items="${membersdetails}" var="frienddetails"> --%>
	 <c:forEach items="${members}" var="family">
        <li class=""> <a href="profiledetailsAddMembers/${family.family_member_id}" target="_blank"><img src="../resources/images/Pj.jpg" width="100" height="100" ></a> ${family.name} </li><br>
       <%--  <a href="deletemember/<c:out value="${frienddetails.getFamily_member_id()}"></c:out>" ><button>delete</button></a> --%>
       <%--  <a href="/updatemember/${frienddetails.getFamily_member_id()}"><button>update</button></a> --%>
        </c:forEach>
        <%--  </c:forEach> --%>

</ol>

 
    
</div>
 












  		
  				
  			
  	