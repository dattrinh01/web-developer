$(function()
		{
		    $("#registerForm").validate(
		      {
		        rules: 
		        {
		        	username: 
		          {
		            required: true,
		            maxlength: 30,
					minlength: 3
		          },
		          	email: 
		          {
		            required: true,
		            email: true,
		            minlength: 5
		          },
		          	password:
		          {
		            required: true,
		            maxlength: 30,
					minlength: 8
		          },
		          	repassword: 
		          {
		          	required: true,
		          	equalTo: "#password",
					maxlength: 30,
					minlength: 8
		          }
		        }
		      });	
		});