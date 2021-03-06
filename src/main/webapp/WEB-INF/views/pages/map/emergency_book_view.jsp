<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Place Autocomplete Address Form</title>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
<link type="text/css" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
<style>
#locationField, #controls {
	position: relative;
	width: 480px;
}

#autocomplete {
	position: absolute;
	top: 0px;
	left: 304px;
	width: 99%;
}

.label {
	text-align: right;
	font-weight: bold;
	width: 100px;
	color: #303030;
}

#address {
	border: 1px solid #000090;
	background-color: #f0f0ff;
	width: 480px;
	padding-right: 2px;
}

#mobilenumber{
width: 50%;
}
#emergency-submit{
    width: 124px;
    height: 50px;
}
#address td {
	font-size: 10pt;
}

.field {
	width: 99%;
}

.slimField {
	width: 80px;
}

.wideField {
	width: 200px;
}

#locationField {
	height: 20px;
	margin-bottom: 34px;
}
</style>
</head>

<body style="margin-top: 20px;">
	<form class="form signin" method="POST"
		action="emergencybook">
		<div id="locationField" >
			<input id="autocomplete" name="address"
				placeholder="Enter your address" onFocus="geolocate()" type="text" required="required"></input>
		</div>

		<table id="address">
			<tr>
				<td class="label">Street address</td>
				<td class="slimField"><input class="field" id="street_number" name="street"
					disabled="true"></input></td>
				<td class="wideField" colspan="2"><input class="field"
					id="route" name="street" disabled="true"></input></td>
			</tr>
			<tr>
				<td class="label">City</td>
				<!-- Note: Selection of address components in this example is typical.
             You may need to adjust it for the locations relevant to your app. See
             https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete-addressform
        -->
				<td class="wideField" colspan="3"><input class="field"
					id="locality" name="city" disabled="true"></input></td>
			</tr>
			<tr>
				<td class="label">State</td>
				<td class="slimField"><input class="field"
					id="administrative_area_level_1" name="state" disabled="true"></input></td>
				<td class="label">Zip code</td>
				<td class="wideField"><input class="field" id="postal_code"
					name="zipcode" disabled="true"></input></td>
			</tr>
			<tr>
				<td class="label">Country</td>
				<td class="wideField" colspan="3"><input class="field"
					id="country" name="country" disabled="true"></input></td>
			</tr>
		</table>
		<style>
		::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
    color: #999;
    opacity: 1; /* Firefox */
}
		</style>
		  <input type="text" placeholder="enter mobile number" id="mobilenumber" name="mobile" required="required">
		 <input class="btn btn-danger" type="submit" id="emergency-submit"value="emergencybook">
	</form>
	<script>
		// This example displays an address form, using the autocomplete feature
		// of the Google Places API to help users fill in the information.

		// This example requires the Places library. Include the libraries=places
		// parameter when you first load the API. For example:
		// <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

		var placeSearch, autocomplete;
		var componentForm = {
			street_number : 'short_name',
			route : 'long_name',
			locality : 'long_name',
			administrative_area_level_1 : 'short_name',
			country : 'long_name',
			postal_code : 'short_name'
		};

		function initAutocomplete() {
			// Create the autocomplete object, restricting the search to geographical
			// location types.
			autocomplete = new google.maps.places.Autocomplete(
			/** @type {!HTMLInputElement} */
			(document.getElementById('autocomplete')), {
				types : [ 'geocode' ]
			});

			// When the user selects an address from the dropdown, populate the address
			// fields in the form.
			autocomplete.addListener('place_changed', fillInAddress);
		}

		function fillInAddress() {
			// Get the place details from the autocomplete object.
			var place = autocomplete.getPlace();

			for ( var component in componentForm) {
				document.getElementById(component).value = '';
				document.getElementById(component).disabled = false;
			}

			// Get each component of the address from the place details
			// and fill the corresponding field on the form.
			for (var i = 0; i < place.address_components.length; i++) {
				var addressType = place.address_components[i].types[0];
				if (componentForm[addressType]) {
					var val = place.address_components[i][componentForm[addressType]];
					document.getElementById(addressType).value = val;
				}
			}
		}

		// Bias the autocomplete object to the user's geographical location,
		// as supplied by the browser's 'navigator.geolocation' object.
		function geolocate() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					var geolocation = {
						lat : position.coords.latitude,
						lng : position.coords.longitude
					};
					var circle = new google.maps.Circle({
						center : geolocation,
						radius : position.coords.accuracy
					});
					autocomplete.setBounds(circle.getBounds());
				});
			}
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBHkzSCqpooKDSinnmrpU3RzzHazBs8W04&libraries=places&callback=initAutocomplete"
		async defer></script>
</body>
</html>