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
<script type="text/javascript" src="resources/js/formContentValidate.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#submit').click(function() {
        if($("#form_profile_form").valid()){
        	$.ajax({
                type: "POST",
                url: "EditContent",
                data: {
                    title : $('#title').val(),
                    brief : $('#brief').val(),
                    content : $('#content').val(),
                    contentID : location.search.split('contentID=')[1]

                },
                success:function(){
                	alert("Your content has been successfully updated");
                }
            });
        }
    });
    
    $('#reset').click(function() {
    	$.ajax({
            type: "GET",
            url: "EditContent",
            data: {
            	contentID : location.search.split('contentID=')[1]
            },
            success: function(response) {
            	var data = $.parseJSON(response);
            	$('#title').val(data.title);
            	$('#brief').val(data.brief);
            	$('#content').val(data.content);
            }
    	});
    });
});
</script>
</head>
<body>
	<sql:setDataSource var="mysql" driver="com.mysql.cj.jdbc.Driver"
		url="jdbc:mysql://localhost/DoAnCuoiKi" user="root" password="root" />
	<sql:query dataSource="${mysql}" var="result">
        SELECT * from Content WHERE id = ?
        <sql:param value="${param.contentID}" />
    </sql:query>
    
	<div class="form-content">
	<h1>Edit Content</h1>
    <hr style="border-color: #f3f3f3; margin: 12px 0;">
    <div id="form_profile">
        <div id="form_profile_title">
            Content Form Elements
        </div>
        <c:forEach var="row" items="${result.rows}">
        <form method="post" id="form_profile_form">
            <div class="input_field">
                <label>Title</label><br>
                <input id="title" id="title" name="title" type="text" placeholder = "Enter the title" class="input" size="50" value="${row.Title}"><br>
            </div>
            <div class="input_field">
                <label>Brief</label><br>
                <textarea id="brief" name="brief" cols="104" rows="5"><c:out value="${row.Brief}"></c:out></textarea>
            </div>
            <div class="input_field">
                <label>Content</label><br>
                <textarea id="content" name="content" cols="104" rows="8"><c:out value="${row.Content}"></c:out></textarea>
            </div>
            <button type="button" form="form_profile_form" value="Submit" class="button" id="submit">Submit Button</button>
            <button type="button" form="form_profile_form" value="Reset" class="button" id="reset">Reset Button</button>
        </form>
        </c:forEach>
        </div>
    </div>
</body>
</html>