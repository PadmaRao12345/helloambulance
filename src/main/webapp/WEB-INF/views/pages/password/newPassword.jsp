   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script type="text/javascript" src="http://www.technicalkeeda.com/js/javascripts/plugin/jquery.js"></script>
    <script type="text/javascript" src="http://www.technicalkeeda.com/js/javascripts/plugin/jquery.validate.js"></script>

<html>
<script type="text/javascript">
   
 $(document).ready(function() {
				$("#email_id").change(function() {
					$.ajax({
						url : 'check_avail',
						data : {
							emailId : $("#email_id").val()
						},
			
						success : function(data) {
							$("#id_res1_div").html(data);
						}
					});
				});ss
			});
 </script>
<body> 
<h4 style="color:red;">Enter New Password for ${email_id}</h4>
<form class="ForgotPassword" action='<c:url value="/success" />' method="POST" id="ForgotPassword" >
<input type="hidden" name="email_id" value="${email_id}"/>
     <div id="id_res1_div" class="error"></div>
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