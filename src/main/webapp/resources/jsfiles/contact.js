/**
 * 
 */
$(document).ready(function() {
			// Real-time Validation 
				//Name can't be blank//
				$('#contact_name').on('input', function() {
					var input=$(this);
					var n = /^[a-zA-Z]/;
					var is_name=n.test(input.val());

					if(is_name){input.removeClass("invalid").addClass("valid");}
					else{input.removeClass("valid").addClass("invalid");}
				});
				
				//Email must be an email //
				$('#contact_email').on('input', function() {
					var input=$(this);
					var re = /^[A-z]{1}[A-z0-9._][A-z0-9]+@[a-zA-Z]+\.[a-z]{2,3}$/.test(input.val());
					//var is_email=re.test(input.val());
					if(re){input.removeClass("invalid").addClass("valid");}
					else{input.removeClass("valid").addClass("invalid");}
				});
				
				
				//Message can't be blank//
				$('#contact_message').keyup(function(event) {
					var input=$(this);
					var message=$(this).val();
					console.log(message);
					if(message){input.removeClass("invalid").addClass("valid");}
					else{input.removeClass("valid").addClass("invalid");}	
				});
		
			// After Form Submitted Validation//
			$("#contact_submit button").click(function(event){
				var form_data=$("#contact").serializeArray();
				var error_free=true;
				for (var input in form_data){
					var element=$("#contact_"+form_data[input]['name']);
					var valid=element.hasClass("valid");
					var error_element=$("span", element.parent());
					if (!valid){error_element.removeClass("error").addClass("error_show"); error_free=false;}
					else{error_element.removeClass("error_show").addClass("error");}
				}
				if (!error_free){
					event.preventDefault(); 
				}
				else{ document.getElementById('success').innerHTML = "<b>Submitted</b>" 
					return true;
        
				}
			});
			
		});