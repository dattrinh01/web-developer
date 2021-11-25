<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script type="text/javascript" src="resources/js/formContentValidate.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var timeDelay = 5000;
	setTimeout( function (){
    		$(".form-content").removeClass("hide");
    		$(".loading").addClass("hide");
    	}, timeDelay);
	
    $('#submit').click(function() {
        if($("#form_profile_form").validate()){
        	$.ajax({
                type: "POST",
                url: "AddContent",
                data: {
                    title : $('#title').val(),
                    brief : $('#brief').val(),
                    content : $('#content').val(),
                },
                success:function(){
                	alert("Successfully add your content");
                }       	
            });
        }
    });
    
    $('#reset').click(function() {
    	$('#title').val("");
    	$('#brief').val("");
    	$('#content').val("");
    });
});
</script>
</head>
<body>
	<h2 class="loading">Loading</h2>
	<div class="form-content hide">
	<h1>Add Content</h1>
    <hr style="border-color: #f3f3f3; margin: 12px 0;">
    <div id="form_profile">
        <div id="form_profile_title">
            Content Form Elements
        </div>
        <form method="post" id="form_profile_form">
            <div class="input_field">
                <label>Title</label><br>
                <input id="title" id="title" name="title" type="text" placeholder = "Enter the title" class="input" size="50"><br>
            </div>
            <div class="input_field">
                <label>Brief</label><br>
                <textarea id="brief" cols="104" rows="5"></textarea>
            </div>
            <div class="input_field">
                <label>Content</label><br>
                <textarea id="content" cols="104" rows="8"></textarea>
            </div>
            <button type="button" form="form_profile_form" value="Submit" class="button" id="submit">Submit Button</button>
            <button type="button" form="form_profile_form" value="Reset" class="button" id="reset">Reset Button</button>
        </form>
        </div>
    </div>
</body>
</html>