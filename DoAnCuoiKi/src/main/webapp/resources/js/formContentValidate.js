$(function()
		{
		    $("#form_profile_form").validate(
		      {
		        rules: 
		        {
                    title:{
                        maxlength: 200,
						minlength: 10
                    },
					brief:
					{
						minlength: 10,
						maxlength: 150
					},
					content:
					{
						minlength: 50,
						maxlength: 1000
					}
		        }
		      });	
		});