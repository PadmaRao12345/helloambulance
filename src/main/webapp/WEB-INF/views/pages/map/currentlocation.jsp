<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 
<body><center>
<div style="margin-top: 100px;">
<p style="color:teal ;">please share your locatoin here</p>

 <button  style="color:white;background-color: red;" onclick="getLocation()">share Current location</button></center>





<%-- <p id="demo"></p> 

<br>
<script type="text/javascript">
 var x = document.getElementById("demo"); 

function getLocation() {
    if (navigator.geolocation) {
       /*  navigator.geolocation.getCurrentPosition(showPosition); */
        navigator.geolocation.getCurrentPosition(showMap); 

    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

   function showPosition(position) {
	
     x.innerHTML = "Latitude: " + position.coords.latitude + 
    "<br>Longitude: " + position.coords.longitude;
    
}   
	var map;

	function showMap(position) {
	
		var googleLatandLong = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
		
		var mapOptions = { 
			zoom: 5,
			center: googleLatandLong,
			mapTypeId: google.maps.MapTypeId.ROADMAP
			
		};
		
		var mapDiv = document.getElementById("myMap");
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
	 
	 
	 
		
			
</script> 


 --%>




<br><center>
<div style="width:800px;height:400px" id="myMap"></div></center>
</div>
<br>






<!-- <input type="button" id="lonlat" onclick="getLocation()" value="share" > -->




</body>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBHkzSCqpooKDSinnmrpU3RzzHazBs8W04&libraries=places&callback=initAutocomplete"
         async defer></script>
<script type="text/javascript">



	 
		function getLocation() {
		    if (navigator.geolocation) {
		        /*  navigator.geolocation.getCurrentPosition(showPosition); */
		         navigator.geolocation.getCurrentPosition(showMap); 

		     } 
		 }

		var map;

		function showMap(position) {
		
			var googleLatandLong = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
			
			var mapOptions = { 
				zoom: 9,
				center: googleLatandLong,
				mapTypeId: google.maps.MapTypeId.ROADMAP
				
			};
			
			var mapDiv = document.getElementById("myMap");
			map = new google.maps.Map(mapDiv, mapOptions);
				
			var title = "Server Location"; 
			addMarker(map, googleLatandLong, title, "");
				
			
			
			
			
			
			
			
			
					
		
	$.ajax({
	 url : 'LonLat',
		
			data : {
				
				latitude :position.coords.latitude,
				longitude: position.coords.longitude
			},
			
			
			
			
			
			
			
			success : function(data) {
				
				if(data==""){
				alert("lacation shared failed ");
					 
				}
				else{
					
					
					alert("thank you lacation shared" );
					/* alert("booking success, response sent to your mail") */
					/* window.location.href = "http://localhost:8081/helloambulance/user/"; */
					

				}
				
				 alert("booking success, response sent to your mail") 
				 /* window.location.href = "http://localhost:8081/helloambulance/user/"; */ 
				
			}
			
			
			
			
			
			
			
			
			
			
			
	 
	 
	 });
	
	
	
	
	
	function addMarker(map, latlong, title, content) { 
		
		var markerOptions = {
			position: latlong, 
			map: map,
			title: title, 
			clickable: true
		};
		 var marker = new google.maps.Marker(markerOptions);  
		
		
		
		
		
		
	}
	
	
	
		}

		
	 




		 </script>















  

<!-- another -->




