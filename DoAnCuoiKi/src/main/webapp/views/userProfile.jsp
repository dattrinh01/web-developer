<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<link rel="stylesheet" href="resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
<script type="text/javascript" src="resources/js/userValidate.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#submit').click(function() {
    	if($("#form_profile_form").valid()){
        $.ajax({
            type: "POST",
            url: "UpdateProfile",
            data: {
                fname : $('#fname').val(),
                lname : $('#lname').val(),
                phone : $('#phone').val(),
                description : $('#description').val()
            },
            success:function(){
            	alert("Successfully update your profile");
            }
        });
    	}
    });
    
    $('#reset').click(function() {
    	$.ajax({
            type: "GET",
            url: "UpdateProfile",
            success: function(response) {
            	var data = $.parseJSON(response);
            	$('#fname').val(data.fname);
            	$('#lname').val(data.lname);
            	$('#phone').val(data.phone);
            	$('#description').val(data.description);
            }
    	});
});
});
</script>
</head>
<body>
	<%
		Integer id = (Integer) request.getSession().getAttribute("id"); 
	%>
	<sql:setDataSource var="mysql" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/DoAnCuoiKi" user="root" password="root" />
	<sql:query dataSource="${mysql}" var="result">
        SELECT * FROM Member WHERE id = ?;
        <sql:param value="${id}" />
    </sql:query>
	<div class="container">
    <h1>Edit Profile</h1>
    <hr style="border-color: #f3f3f3; margin: 12px 0;">
    <div id="form_profile">
        <div id="form_profile_title">
            Profile Form Elements
        </div>
        <c:forEach var="row" items="${result.rows}">
        <form action="" method="post" id="form_profile_form">
            <div class="input_field">
                <label>First Name</label><br>
                <input id="fname" name="fname" type="text" class="input" placeholder="Enter the first name" value="${row.Firstname}" size="50"><br>
            </div>
            <div class="input_field">
                <label>Last Name</label><br>
                <input id="lname" name="lname" type="text" class="input" placeholder="Enter the last name" value="${row.Lastname}" size="50"><br>
            </div>
            <div class="input_field">
                <label>Email</label><br>
                <input readonly type="email" class="email" id="email" name="email" value="${row.Email}" size="50"><br>
            </div>
            <div class="input_field">
                <label>Phone</label><br>
                <input id="phone" name="phone" type="text" class="input" placeholder="Enter your phone number" value="${row.Phone}"><br>
            </div>
            <div class="input_field">
                <label>Description</label><br>
                <textarea id="description" name="description" cols="104" rows="5"><c:out value="${row.Description}" /></textarea>
            </div>
            <button type="button" form="form_profile_form" value="Submit" class="button" id="submit">Submit Button</button>
            <button type="button" form="form_profile_form" value="Reset" class="button" id="reset">Reset Button</button>
        </form>
        </c:forEach>
    </div>
    </div>
</body>
</html>