<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='sec' uri='http://www.springframework.org/security/tags' %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><tiles:getAsString name="title"/></title>
<tiles:insertAttribute name="header" />
</head>
<body>
<sec:authorize access="hasRole('ROLE_ADMIN')">

<c:url value="/admin/logout" var="logoutUrl" />
<form action="${logoutUrl}" method="post" id="logoutForm">
<input type="hidden" name="${_csrf.parameterName}"
value="${_csrf.token}" />
</form>
<script>
function formSubmit() {
document.getElementById("logoutForm").submit();
}
</script>




	<div id="container-fluid">
		<tiles:insertAttribute name="menu" />
				<div class="col-md-9" style="min-height: 700px">
		<tiles:insertAttribute name="body" />
		</div>
		<tiles:insertAttribute name="footer" />
	</div>
	</sec:authorize>>
</body>
</html>