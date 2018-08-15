   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<script type="text/javascript" src="http://www.technicalkeeda.com/js/javascripts/plugin/jquery.js"></script>
    <script type="text/javascript" src="http://www.technicalkeeda.com/js/javascripts/plugin/jquery.validate.js"></script>

<html>

<body> 
<h4 style="color:red;">Enter New Password for ${email_id}</h4>
<form class="ForgotPassword" action='<c:url value="/vendor/setAmbulancepasswordInAmbulanceSuccess" />' method="POST" id="ForgotPassword" >
<input type="hidden" name="email_id" value="${email_id}"/>
<table>
<tr>
<td>Password</td>
<td><input type="password" name="password" id="password"> </td>
</tr>
<tr>
<td>Confirm Password</td>
<td><input type="password" name="confirmpassword" id="confirmpassword"> </td>
</tr>
<tr>
<td colspan="2"><input type="Submit" value="Save" >  </td>
</tr>

</table>
</form>
</body>
</html>