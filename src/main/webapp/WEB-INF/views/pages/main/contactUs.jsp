 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <script src='<c:url value="/resources/jsfiles/contact.js"/>' ></script> 
  
  <link rel="stylesheet" href='<c:url value="/resources/cssfiles/contact.css"/>'>
  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>    
  <div class="container"><br><br>
  <h2>Contact Us Form</h2>
<div class="main">

		<form id="contact" method="post" action="save" name="contact">
			<!-- Name -->
			<div>
				<label for="contact_name">Name:</label>
				<input type="text" id="contact_name" name="name"></input>
				<span class="error">This field is required</span>
			</div>
			<!-- Email -->
			<div>
				<label for="contact_email">Email:</label>
				<input type="email" id="contact_email" name="email"></input>
				<span class="error">A valid email address is required</span>				
			</div>						
						
			<!-- Message -->
			<div>
				<label for="contact_message">Message:</label>
				<textarea id="contact_message" name="message"></textarea>
				<span class="error">This field is required</span>												
			</div>	
			<!-- Submit Button -->
			<div id="contact_submit">				
				<button type="submit" id="submit">Submit</button>
			</div>
			<span id="success"></span>
			
		</form>
		
</div>
</div>