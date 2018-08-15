<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<title>profile picture  Upload</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#fileUploadErr").hide();

		// Hide The Error Message When The Attachment Btn Is Clicked.
		$('#attachment').click(function(eObj) {
			$("#fileUploadErr").hide();
		});

		// Validating Whether The Attachment Is Uploaded Or Not.
		$('#submit').click(function(eObj) {
			var file = $("#attachment").map(function() {
				return $(this).val().trim() ? true : false;
			}).get();
			if (file.includes(true)) {
				// Do Nothing...!                    
			} else {
				$("#fileUploadErr").css({
					'color' : 'red',
					'font-weight' : 'bold'
				}).show();
				eObj.preventDefault();
			}
		});
	});
</script>
<style type="text/css">
#fileUploadBtn {
	float: left;
	margin-top: 22px;
}
</style>
</head>
<body>
	<center>
	<div class="col-sm-9" style="min-height: 500px">
	<div style="padding-top:100px"></div>
		<h2>profile image upload</h2>
		<form action='<c:url value="/vendor/uploadfile" />' method='POST'   enctype="multipart/form-data">
            <table id="fileUploadFormBeanTable" border="0" width="80%">
 
		
			<!-- <tr>
				<td>Image Name:</td>
				<td><input id="firstname" type="text" name="image_name"
					size="30" /></td>
			</tr> -->
			<!--  <tr>
				<td>File Name:</td>
				<td><input id="filename" type="text" name="file_name"
					size="30"  /></td>
			</tr>  -->
			<tr>
				<td>Attachment:</td>
				<td><input id="attachment" type="file"
					name="attachFileObj" size="60" /> <span id="fileUploadErr">Please
						Upload A File!</span></td>
			</tr>
			
			<tr>
				<td colspan="1" align="center"><input id="submit"type="submit" value="submit" /></td>
			</tr>
		</table>
		</form>
		</div>
	</center>

</body>
</html>