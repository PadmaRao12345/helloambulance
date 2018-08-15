<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
</head>

<body><center>
<div style="margin-top: 50px;">
<br>

  <h2 style="color:#bd0808;">find location by google map </h2>

  <div>
	<input type="text" placeholder="type ip address" name="ipaddress" id="w-input-search" value="45.117.65.48"/>
	<span>
		<button class='btn btn-info' id="w-button-search" type="button">Search</button>
	</span>
  </div>
 </div>

  <script>
  $(document).ready(function() {

	$("#w-button-search").click(function() {
	
		$.getJSON("${pageContext.request.contextPath}/getLocationByIpAddress",
		{
			ipAddress : $('#w-input-search').val()
		}, 
		function(data) {
				
			var data = JSON.stringify(data);
			var json = JSON.parse(data);
				
			showMap(json["latitude"],json["longitude"]);
				
			$("#result").html(data);
				
		})
		.done(function() {							
		})
		.fail(function() { 
		})
		.complete(function() { 			
		});
			
	});
		
	var map;
		
	function showMap(latitude,longitude) { 
			
		var googleLatandLong = new google.maps.LatLng(latitude,longitude);
		
		var mapOptions = { 
			zoom: 5,
			center: googleLatandLong,
			mapTypeId: google.maps.MapTypeId.ROADMAP 
		};
		
		var mapDiv = document.getElementById("map");
		map = new google.maps.Map(mapDiv, mapOptions);
			
		var title = "Server Location"; 
		addMarker(map, googleLatandLong, title, "");
			
	}
		
	function addMarker(map, latlong, title, content) { 
			
		var markerOptions = {
			position: latlong, 
			map: map,
			title: title, 
			clickable: true
		};
		var marker = new google.maps.Marker(markerOptions); 
	}
		
  });
  </script>
  <br/>
  <div id="result"></div>
  <br/>
  <div style="width:600px;height:400px" id="map"></div>
  
</center>

</body>

</html>
