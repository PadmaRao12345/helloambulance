<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>ForgotPassword</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>

<h4 style="color:red;">Enter your registered email address:</h4>
	 <form action="resetPasswordforvendor" method="POST">
		<table>
			<tr>

				<td colspan="2">Email Id: <input type="text" name="email_id" id="email_id">  <div id="id_div" class="error" style="max-width: 200px;color: red;"></div>
				</td>
				
			</tr>
			
			<tr>
				<td><input type="Submit" value="Reset Password" id="submit"></td>
				<td><input type="reset" value="Cancel">  </td>
			</tr>
			
		</table>
	</form>
</body>
<script type="text/javascript">
$(document).ready(function() {
	$("#email_id").change(function() {
		$.ajax({
			url : 'forgotpassword_check_availEmail_vendor',
			data : {
				email_id : $("#email_id").val()
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

</html>
