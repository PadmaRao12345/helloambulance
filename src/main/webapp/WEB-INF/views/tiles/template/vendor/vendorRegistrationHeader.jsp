<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


  
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css"> -->
  <!-- <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css"> -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
  <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Felipa|Varela+Round" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<!-- google location script -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU"></script>


 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <!-- <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css"> -->
  <!-- <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css"> -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Felipa|Varela+Round" rel="stylesheet">
<link href="../resources/cssfiles/style.css" rel="stylesheet">

--%>

<!-- google location script -->
<link href="/resources/cssfiles/style.css" rel="stylesheet">
<link href="/resources/cssfiles/vendor.css" rel="stylesheet">
<link href="/resources/cssfiles/styl.css" rel="stylesheet">
<link href="/resources/cssfiles/doctr.css" rel="stylesheet">


 <style>

.navbar-default {
    background-color: #52738d5c;
    border:none;
}
.navbar-default .navbar-nav>li>a {
    color: #ffffff;
    line-height: 60px;
}
.panel-heading {
    color: #fff !important;
    background-color: #d9534f !important;
  }
  .panel {
    border: 1px solid #d9534f;
  }

.btn-info {
    background: #5674bc none repeat scroll 0 0;
    border: 1px solid #5674bc;
    border-radius: 0;
    color: #fff;
    transition: all 0.5s ease 0s;
}
.stepwizard-step p {
    margin-top: 0px;
    color:#666;
}
.stepwizard-row {
    display: table-row;
}
.stepwizard {
    display: table;
    width: 100%;
    position: relative;
}
.stepwizard-step button[disabled] {
    /*opacity: 1 !important;
    filter: alpha(opacity=100) !important;*/
}
.stepwizard .btn.disabled, .stepwizard .btn[disabled], .stepwizard fieldset[disabled] .btn {
    opacity:1 !important;
    color:#bbb;
}
.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content:" ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
    z-index: 0;
}
.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}
.btn-circle {
    width: 30px;
    height: 30px;
    text-align: center;
    padding: 6px 0;
    font-size: 12px;
    line-height: 1.428571429;
    border-radius: 15px;
}
</style>
   
  
  
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css"> 
   <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script> 
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


<link rel="stylesheet"	href='<c:url value="/resources/cssfiles/style.css"/>'>

 <link rel="stylesheet"	href='<c:url value="/resources/cssfiles/main.css"/>'>
<link rel="stylesheet"	href='<c:url value="/resources/cssfiles/error.css"/>'>

 <script src='<c:url value="/resources/jsfiles/registration.js"/>' ></script>
 
<!-- jquery -->
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
  <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Felipa|Varela+Round" rel="stylesheet">
<!-- google location script -->


<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places&language=en-AU"></script>

<!-- google location script -->
      <link type="text/css" rel="Stylesheet"href="http://ajax.microsoft.com/ajax/jquery.ui/1.8.5/themes/start/jquery-ui.css" />
      <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<script src='<c:url value="/resources/jsfiles/registration.js"/>' ></script>

 