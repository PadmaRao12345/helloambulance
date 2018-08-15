<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
 	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
     <style>
     
 		.main-header {
   		   z-index: 1 !important;
    	}
    </style>
    
<div class="di" align="right">
</div>
</div>
         <script>
	       $(document).ready(function(){
	    	 $('.view-message').click(function(){
	    		 var messgae= $('#useremail_message').val();
	 			 var name = $('#userfirstname').val();
	 			 $('.useremail_msg').val(name +"\n"+messgae+"\n");
	 		 });
		  $('.pass-message').click(function(){
			 var email = $('#useremail_id2').val();
			 var contactID=$('#usercontact').val();
			 var message1=$('#useremail_message').val();
			 var newmessage=$('.useremail').val(); 
			$.post("${pageContext.request.contextPath}/admin/contactmessage",{email:email,contactID:contactID,message1:message1,newmessage:newmessage},function(){
			},'json');
		  }); 
	});
</script>	
</head>
<body>
<!-- <div class='form-group'
	style="position: absolute; margin:100%; color: black;"> -->
  <c:forEach var="con" items="${contact}" >
                                               <div class="form-group">
                                                        <label for="contact_id" class="col-sm-4 control-label" >
                                                          contact:${con.contact_id}</label>
                                                          <div class="col-sm-8">
                                                            <input type="hidden"  name="contact_id"  id="usercontact" value="${con.contact_id}"/>
                                                           <div id="id_div" class="error"></div>
                                                          </div> 
                                                       </div>
                                                 <div class="form-group">
                                                      <label for="name" class="col-sm-4 control-label" >
                                                        Name:${con.name} </label>
                                                        <div class="col-sm-8">
                                                          <div class="row">
                                                            <div class="col-md-12">
                                                               <input type="hidden"  name="name" id="userfirstname" value="${con.name}">
                                                            </div>
                                                          </div>
                                                        </div>
                                                      </div>
                                                      
                                                      <div class="form-group">
                                                        <label for="email" class="col-sm-4 control-label" >
                                                          EmailId:${con.email_id}</label>
                                                          <div class="col-sm-8">
                                                         <input type="hidden" name="email_id"  id="useremail_id2"  value="${con.email_id}" /> 
                                                           <div id="id_div" class="error"></div>
                                                          </div>
                                                       </div>
                                                     
                                                       <div class="form-group">
                                                        <label for="message" class="col-sm-4 control-label" >
                                                          Message:${con.message}</label>
                                                          <div class="col-sm-8">
                                                            <input type="hidden" class="form-control" name="message"  id="useremail_message" value="${con.message}" />
                                                           <div id="id_div" class="error"></div>
                                                          </div> 
                                                       </div>
                                                  
                                                       <div class="row">
                                                          <div class="col-sm-3">
                                                         </div>
                                                         </div>
														<div class="row">
														<div class="col-sm-3"></div>
														<div class="col-sm-9">
                                                    <button type="button" class="btn btn-info btn-lg view-message "  data-toggle="modal" data-target="#myModal" >Reply</button>					
                                                       </div>
														</div>
													</c:forEach> 

 <div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
        <textarea class="useremail_msg "  name="mail" cols="50" rows="5"  style="overflow: hidden; border: none; border-top: 1px solid LightGrey; margin: 6px;"></textarea>
        <textarea  class="useremail"   name="mail" cols="50" rows="3"  style="overflow: hidden; border: none; border-top: 1px solid LightGrey; margin: 6px;"></textarea>
        <button type="button" class="btn btn-info btn-sm pass-message" data-dismiss="modal" >Send</button>
        </div>
       </div>
      </div>
  </div>
</div>	
</body>	
</html>