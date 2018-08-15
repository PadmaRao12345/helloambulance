<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<title><tiles:getAsString name="title"/></title>
<tiles:insertAttribute name="header" />
<body>
<div id="container-fluid">
<tiles:insertAttribute name="menu" />
<tiles:insertAttribute name="body" />
<tiles:insertAttribute name="footer" />
</div>
</body>