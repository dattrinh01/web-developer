$(function()
		{
		    $("#loginForm").validate(
		      {
		        rules: 
		        {
		          	email: 
		          {
		            required: true,
		            email: true,
		            maxlength: 50,
					minlength: 5
		          },
		          	password:
		          {
		            required: true,
		            maxlength: 50,
					minlength: 8
		          }
		        }
		      });	
		});