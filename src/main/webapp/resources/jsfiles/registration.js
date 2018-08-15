/**
 * 
 */
/**
 * 
 */

        var autocomplete = new google.maps.places.Autocomplete($(".start")[0], {});
        var autocomplete1 = new google.maps.places.Autocomplete($(".end")[0], {});
          var autocomplete2 = new google.maps.places.Autocomplete($(".address")[0], {});

        google.maps.event.addListener(autocomplete, 'place_changed', function() {
            var place = autocomplete.getPlace();
            // console.log(place.address_components);
        });
        google.maps.event.addListener(autocomplete1, 'place_changed', function() {
            var place = autocomplete1.getPlace();
            // console.log(place.address_components);
        });
        google.maps.event.addListener(autocomplete2, 'place_changed', function() {
            var place = autocomplete2.getPlace();
            // console.log(place.address_components);
        });
   

          $(document).ready(function(){
            $('.carousel').carousel({
              interval: 1500
            })
            // Add smooth scrolling to all links in navbar + footer link
            $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
              // Make sure this.hash has a value before overriding default behavior
              if (this.hash !== "") {
                // Prevent default anchor click behavior
                event.preventDefault();

                // Store hash
                var hash = this.hash;

                // Using jQuery's animate() method to add smooth page scroll
                // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                $('html, body').animate({
                  scrollTop: $(hash).offset().top
                }, 900, function(){

                  // Add hash (#) to URL when done scrolling (default click behavior)
                  window.location.hash = hash;
                });
              } // End if
            });

            $(window).scroll(function() {
              $(".slideanim").each(function(){
                var pos = $(this).offset().top;
                var winTop = $(window).scrollTop();
                if (pos < winTop + 600) {
                  $(this).addClass("slide");
                }
              });
            });
            // image popup
            $('.thumbnail').click(function(){
                  $('.modal-body .view_doct').empty();
                  $('.modal-body .view_doct_inf').empty();
                   // $(".doct").css("display","block");
              	var title = $(this).parent('a').attr("title");
              	$('.modal-title').html(title);
              	$($(this).parents('div').html()).appendTo('.modal-body .view_doct');
                $($(".doct_inf").parents('div').html()).appendTo('.modal-body .view_doct_inf');
              	$('#modalpopup').modal({show:true});
            });
            // image popup

          })

       // </script>
      //  <!--starts links for date of birth validation -->
    //  <!--end links for date of birth validation -->
     // <script type="text/javascript">
      //validation for date of birth
      $(document).ready(function () {
      $(".dob").datepicker({
        minDate: '-50Y',
        maxDate: "-18Y",
        changeMonth: true,
        changeYear: true,
        defaultDate: new Date(),
        dateFormat: 'dd/mm/yy'
      }).attr("readonly", "readonly"); //prevent manual changes
      //validation for date of birth
      //validation for login form
      $( ".signin" ).validate({
        rules: {
          username: {
            required: true,
            minlength: 4,
            user:true,

          },

          pass: {
            required: true,
            /*password : true,*/
            minlength: 8,
          }
        },
        messages : {
          username: {
            required : "Please enter user Username or phone number",
            minlength: "please enter minimum 4 chars",
          },
          pass: {
            required : "Please enter your password (min8 max 12)",
            minlength: "Must contain at least one number and one uppercase and lowercase letter and one special charecter, and at least 8 or more characters and Maximum 12 ",
            password: "please fill required format (eg:Praveen@123)",
          },
        }
      });
      //validation for login form
      //validation for registeration form
      jQuery.validator.addMethod("password", function(value, element) {
        return this.optional( element ) || /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!,%,&,@,#,$,^,*,?,_,~]).{8,}$/.test( value );
      } );
      jQuery.validator.addMethod("user", function(value, element) {
    	  return this.optional( element ) || /^[a-zA-Z\s-, ]+$/.test( value );
    	 });
      jQuery.validator.addMethod("email_id", function(value, element) {
    	  return this.optional( element ) || /^[A-z].{1}(?!.*?[.,_]{2}[!,%,\^,&,@,#,$,*,?,~,+,-]{0})[A-z0-9._]+@[A-z0-9]+\.[A-z]{2,4}$/.test( value );
    	 }); 
      jQuery.validator.addMethod("phone", function (value, element) {
    	    return this.optional(element) || /^[6-9]{1}[0-9]{9}$/.test(value);
    	});
      $(".register").validate({
        rules: {
          name:{
            required: true,
            user:true,
          },
          email_id: {
            required: true,
            email: true,
            minlength: 4,
          },
          mobile_number: {
            required: true,
            digits:true,
            phone:true,
            minlength: 10,
            maxlength: 10,
          },
          date_of_birth:{
            required:true,
            date:true,
          },
          password: {
            required: true,
            minlength: 8,
            password:true,

          },
          /*confirm_password: {
            required: true,
            minlength: 8,
            password:true,
            equalTo:'#password',
          },*/

          pincode: {
            required: true,
            minlength: 6,
            maxlength: 6,
            digits:true,
          }
        },
        messages : {
        	email_id: {
            required : "Please specify your valid mail id",
            minlength: "Minimum 3 and Maximum 50",
          },
          mobile_number:  {
            required : "Please enter your mobile number",
            minlength: "Minimum 10 and Maximum 10",
            phone:"please enter valid mobile number",
            digits:"please enter number only",
          },
          date_of_birth:{
            required : "Please enter date of birth",
            date:"please enter valid date",
          },
          name:  {
            required: "Please enter name",
            user:"please enter proper user name",
          },
          pincode:  {
        	  required : "Please enter your pincode",
              minlength: " length should be 6 numbers ",
              
              digits:"please enter number only",
            },
          password: {
            required : "Please enter your password (min8 max 12)",
            minlength: "Must contain at least one number and one uppercase and lowercase letter and one special charecter, and at least 8 or more characters and Maximum 12 ",
            password: "please fill required format (eg:Praveen@123)",
          }
    /*      confirm_password: {
            required : "Please  confirm your password (min8 max 12)",
            password: "Please enter the same password as above",
            equalTo:"Please enter the same password as above",*/
            // notEqual: "Please enter the same password as above",
         /* }*/

        },
      });
      $(".vendor_register").validate({
        rules: {
          hsptl_name:{
            required: true,
            user : true,
            lettersonly:true,
          },
          email: {
            required: true,
            email: true,
            minlength: 4,
          },
          mobile: {
            required: true,
            digits:true,
            minlength: 10,
            maxlength: 10,
          },
          dob:{
            required:true,
          },

          passwd: {
            required: true,
            minlength: 8,
            password:true,

          },
          confirm_passwd: {
            required: true,
            minlength: 8,
            password:true,
            equalTo:'#passwd'
          },
          pincode: {
            required: true,
            minlength: 6,
            digits:true,
          }
        },
        messages : {
          email: {
            required : "Please specify your valid mail id",
            minlength: "Minimum 3 and Maximum 50",
          },
          mobile:  {
            required : "Please enter your mobile number",
            minlength: "Minimum 10 and Maximum 10",
            digits:"please enter number only",
          },
          dob:{
            required : "Please enter date of birth",
          },
          name:  {
            required: "Please enter name",
            user:"please enter proper user name",
          },

          passwd: {
            required : "Please enter your password (min8 max 12)",
            minlength: "Must contain at least one number and one uppercase and lowercase letter and one special charecter, and at least 8 or more characters and Maximum 12 ",
            password: "please fill required format (eg:Praveen@123)",
          },
          confirm_passwd: {
            required : "Please  confirm your password (min8 max 12)",
            password: "Please enter the same password as above",
            equalTo:"Please enter the same password as above",
            // notEqual: "Please enter the same password as above",
          }
        },
      });
      $(".pre_book").validate({
        rules: {
          patient:{
            required: true,
            user : true,
            lettersonly:true,
          },

          mobile: {
            required: true,
            digits:true,
            minlength: 10,
            maxlength: 10,
          },
          blood_group:{
            required:true,
          },
          start: {
            required: true,

          },
          end: {
            required: true,

          },
          pincode: {
            required: true,
            minlength: 6,
            digits:true,
          }
        },
        messages : {
          email: {
            required : "Please specify your valid mail id",
            minlength: "Minimum 3 and Maximum 50",
          },
          mobile:  {
            required : "Please enter your mobile number",
            minlength: "Minimum 10 and Maximum 10",
            digits:"please enter number only",
          },
          blood_group:{
            required : "Please enter date of birth",
          },
          start:  {
            required: "Please enter start location",

          },
          end: {
            required : "Please enter your destination",

          }

        },
      });

      });
    
      // validation for registeration form -->