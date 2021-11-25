$(function()
		{
		    $("#form_profile_form").validate(
		      {
		        rules: 
		        {
		          	email: 
		            {
		            email: true,
		            minlength: 5
		            },
		          	fname:
		            {
		            maxlength: 30,
					minlength: 3
		            },
                    lname:
                    {
                        maxlength: 30,
						minlength: 3
                    },
					phone:
					{
						minlength: 9,
						maxlength: 13
					},
					description:
					{
						maxlength: 200
					}
		        }
		      });	
		});